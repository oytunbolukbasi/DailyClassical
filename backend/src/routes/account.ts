import { and, eq, gt, isNotNull, isNull, ne } from "drizzle-orm";
import { Hono } from "hono";
import { HTTPException } from "hono/http-exception";
import { z } from "zod";
import { db } from "../db/client.js";
import { emailChangeCodes, emailVerificationCodes, favourites, type Locale, locales, passwordResetTokens, pieces, users } from "../db/schema.js";
import { exchangeAppleCode, revokeAppleToken, verifyAppleIdentityToken } from "../lib/apple.js";
import { type AuthVars, hashPassword, issueToken, requireUser, verifyPassword } from "../lib/auth.js";
import { sendEmailChangeCodeEmail, sendEmailChangedEmail, sendPasswordResetEmail, sendVerificationCodeEmail, sendWelcomeEmail } from "../lib/email.js";
import { requestLocale } from "../lib/locale.js";
import { enforceRateLimit } from "../lib/rate-limit.js";
import { generateResetToken, hashResetToken, resetTokenExpiry } from "../lib/reset-token.js";
import { checkCode, CODE_TTL_MS, generateCode, hashCode, RESEND_COOLDOWN_MS } from "../lib/verification-code.js";

export const account = new Hono<AuthVars>();

const credentials = z.object({
  email: z.string().trim().toLowerCase().email().max(254),
  password: z.string().min(8).max(200),
});

async function body<T extends z.ZodTypeAny>(req: Request, schema: T): Promise<z.infer<T>> {
  const parsed = schema.safeParse(await req.json().catch(() => null));
  if (!parsed.success) throw new HTTPException(400, { message: "invalid_request" });
  return parsed.data;
}

type UserRow = typeof users.$inferSelect;

/** What the app needs about the signed-in account. */
function userPayload(u: Pick<UserRow, "id" | "email" | "compPremiumUntil" | "appleSub" | "passwordHash">) {
  return {
    id: u.id,
    email: u.email,
    premium: !!u.compPremiumUntil && u.compPremiumUntil.getTime() > Date.now(),
    apple: !!u.appleSub,
    // Sign in with Apple accounts without one can't change their email (it comes from Apple).
    password: !!u.passwordHash,
  };
}

/**
 * Creates a fresh 6-digit code and emails it, unless one was sent within the cooldown.
 * Returns false when throttled.
 */
async function issueVerificationCode(user: Pick<UserRow, "id" | "email" | "locale">, fallback: Locale): Promise<boolean> {
  const [existing] = await db.select().from(emailVerificationCodes).where(eq(emailVerificationCodes.userId, user.id));
  if (existing && Date.now() - existing.sentAt.getTime() < RESEND_COOLDOWN_MS) return false;
  const code = generateCode();
  const row = { codeHash: hashCode(code), expiresAt: new Date(Date.now() + CODE_TTL_MS), attempts: 0, sentAt: new Date() };
  await db.insert(emailVerificationCodes).values({ userId: user.id, ...row })
    .onConflictDoUpdate({ target: emailVerificationCodes.userId, set: row });
  void sendVerificationCodeEmail(user.email, code, storedLocale(user.locale, fallback))
    .catch((err) => console.error("verification email failed", err));
  return true;
}

/**
 * Sign-up: the account starts unverified and a code is emailed. No session until the code
 * is confirmed (POST /auth/verify). Re-registering an address that was never verified just
 * replaces the password and sends a new code, so a typo'd or abandoned sign-up can't block it.
 */
account.post("/auth/register", async (c) => {
  const { email, password } = await body(c.req.raw, credentials);
  await enforceRateLimit(c, "register", email);
  const locale = requestLocale(c);
  const passwordHash = await hashPassword(password);
  const [existing] = await db.select().from(users).where(eq(users.email, email));
  if (existing?.emailVerifiedAt) throw new HTTPException(409, { message: "email_taken" });
  const user = existing
    ? (await db.update(users).set({ passwordHash, locale }).where(eq(users.id, existing.id)).returning())[0]!
    : (await db.insert(users).values({ email, passwordHash, locale }).returning())[0]!;
  await issueVerificationCode(user, locale);
  return c.json({ status: "verification_required", email: user.email }, 202);
});

account.post("/auth/verify", async (c) => {
  const { email, code } = await body(c.req.raw, z.object({ email: credentials.shape.email, code: z.string().regex(/^\d{6}$/) }));
  await enforceRateLimit(c, "verify");
  const [user] = await db.select().from(users).where(eq(users.email, email));
  const [row] = user ? await db.select().from(emailVerificationCodes).where(eq(emailVerificationCodes.userId, user.id)) : [];
  if (!user || !row) throw new HTTPException(400, { message: "invalid_code" });
  const result = checkCode(code, row);
  if (result !== "ok") {
    if (result === "wrong") {
      await db.update(emailVerificationCodes).set({ attempts: row.attempts + 1 }).where(eq(emailVerificationCodes.userId, user.id));
    }
    throw new HTTPException(400, { message: result === "wrong" ? "invalid_code" : result });
  }
  const [verified] = await db.update(users).set({ emailVerifiedAt: new Date() }).where(eq(users.id, user.id)).returning();
  await db.delete(emailVerificationCodes).where(eq(emailVerificationCodes.userId, user.id));
  void sendWelcomeEmail(user.email, storedLocale(user.locale, requestLocale(c))).catch((err) => console.error("welcome email failed", err));
  return c.json({ token: await issueToken(user.id), user: userPayload(verified!) });
});

/** Always 204 (no account enumeration); throttled per user by RESEND_COOLDOWN_MS and by AUTH_RATE_LIMITS.resend. */
account.post("/auth/verify/resend", async (c) => {
  const { email } = await body(c.req.raw, z.object({ email: credentials.shape.email }));
  await enforceRateLimit(c, "resend", email);
  const [user] = await db.select().from(users).where(eq(users.email, email));
  if (user && !user.emailVerifiedAt) await issueVerificationCode(user, requestLocale(c));
  return c.body(null, 204);
});

account.post("/auth/login", async (c) => {
  const { email, password } = await body(c.req.raw, credentials);
  await enforceRateLimit(c, "login", email);
  const [user] = await db.select().from(users).where(eq(users.email, email));
  if (!user || !(await verifyPassword(password, user.passwordHash))) {
    throw new HTTPException(401, { message: "invalid_credentials" });
  }
  if (!user.emailVerifiedAt) {
    // Correct password but never verified: send a code and let the app show the code step.
    await issueVerificationCode(user, requestLocale(c));
    throw new HTTPException(403, { message: "email_not_verified" });
  }
  return c.json({ token: await issueToken(user.id), user: userPayload(user) });
});

// ---- Sign in with Apple ----

/**
 * One call for both sign-up and sign-in. The account is found by Apple's stable `sub`; the first
 * time, by the verified email Apple gives (an existing email account is linked), else created.
 * Apple has verified the address, so there is no code step. Linking to an account that was never
 * verified also clears its password: whoever registered it without proving the address must not
 * keep a way in once the real owner arrives through Apple.
 */
account.post("/auth/apple", async (c) => {
  const { identityToken, authorizationCode } = await body(
    c.req.raw,
    z.object({ identityToken: z.string().min(20).max(8000), authorizationCode: z.string().max(2000).optional() }),
  );
  await enforceRateLimit(c, "apple");
  const apple = await verifyAppleIdentityToken(identityToken).catch(() => {
    throw new HTTPException(401, { message: "invalid_apple_token" });
  });
  const locale = requestLocale(c);

  let [user] = await db.select().from(users).where(eq(users.appleSub, apple.sub));
  let created = false;
  if (!user) {
    if (!apple.email || !apple.emailVerified) throw new HTTPException(400, { message: "apple_email_missing" });
    const [existing] = await db.select().from(users).where(eq(users.email, apple.email));
    if (existing?.appleSub) throw new HTTPException(409, { message: "email_linked_to_other_apple_id" });
    if (existing) {
      [user] = await db.update(users).set({
        appleSub: apple.sub,
        emailVerifiedAt: existing.emailVerifiedAt ?? new Date(),
        ...(existing.emailVerifiedAt ? {} : { passwordHash: null, passwordChangedAt: new Date() }),
      }).where(eq(users.id, existing.id)).returning();
      await db.delete(emailVerificationCodes).where(eq(emailVerificationCodes.userId, existing.id));
    } else {
      [user] = await db.insert(users).values({
        email: apple.email, passwordHash: null, locale, emailVerifiedAt: new Date(), appleSub: apple.sub,
      }).returning();
      created = true;
    }
  }
  if (authorizationCode) {
    const refreshToken = await exchangeAppleCode(authorizationCode);
    if (refreshToken) {
      [user] = await db.update(users).set({ appleRefreshToken: refreshToken }).where(eq(users.id, user!.id)).returning();
    }
  }
  if (created) {
    void sendWelcomeEmail(user!.email, locale).catch((err) => console.error("welcome email failed", err));
  }
  return c.json({ token: await issueToken(user!.id), user: userPayload(user!) });
});

// ---- Password reset ----

const storedLocale = (value: string, fallback: Locale): Locale =>
  (locales as readonly string[]).includes(value) ? (value as Locale) : fallback;

/**
 * Always 204, whether or not the address has an account, so the endpoint cannot be used
 * to find out who is registered. The email is sent in the background for the same reason
 * (response time does not depend on the lookup result).
 */
account.post("/auth/password-reset", async (c) => {
  const { email } = await body(c.req.raw, z.object({ email: credentials.shape.email }));
  await enforceRateLimit(c, "passwordReset", email);
  const locale = requestLocale(c);
  const [user] = await db
    .select({ id: users.id, email: users.email, locale: users.locale })
    .from(users)
    .where(eq(users.email, email));
  if (user) {
    const token = generateResetToken();
    await db.insert(passwordResetTokens).values({ userId: user.id, tokenHash: hashResetToken(token), expiresAt: resetTokenExpiry() });
    void sendPasswordResetEmail(user.email, token, storedLocale(user.locale, locale)).catch((err) => console.error("password reset email failed", err));
  }
  return c.body(null, 204);
});

/**
 * Sets a new password from an emailed link (used by GET /reset-password). Tokens are single-use;
 * the user's other open links are revoked and existing sessions are signed out.
 */
account.post("/auth/password-reset/confirm", async (c) => {
  const { token, password } = await body(
    c.req.raw,
    z.object({ token: z.string().min(16).max(200), password: credentials.shape.password }),
  );
  await enforceRateLimit(c, "passwordResetConfirm");
  const passwordHash = await hashPassword(password);
  const ok = await db.transaction(async (tx) => {
    const [claimed] = await tx
      .update(passwordResetTokens)
      .set({ usedAt: new Date() })
      .where(and(
        eq(passwordResetTokens.tokenHash, hashResetToken(token)),
        isNull(passwordResetTokens.usedAt),
        gt(passwordResetTokens.expiresAt, new Date()),
      ))
      .returning({ userId: passwordResetTokens.userId });
    if (!claimed) return false;
    // passwordChangedAt invalidates every session token issued before now (see requireUser).
    await tx.update(users).set({ passwordHash, passwordChangedAt: new Date() }).where(eq(users.id, claimed.userId));
    await tx.delete(passwordResetTokens).where(eq(passwordResetTokens.userId, claimed.userId));
    return true;
  });
  if (!ok) throw new HTTPException(400, { message: "invalid_or_expired_token" });
  return c.body(null, 204);
});

account.get("/me", requireUser, async (c) => {
  const [user] = await db.select().from(users).where(eq(users.id, c.get("userId")));
  if (!user) throw new HTTPException(401, { message: "unauthorized" });
  return c.json({ user: userPayload(user) });
});

// ---- Changing the email address ----

/**
 * Step 1: the current password (accounts that have one) and the new address; a code goes to the
 * new address, and nothing changes until it's confirmed. Sign in with Apple accounts without a
 * password get their address from Apple and can't change it here.
 */
account.post("/me/email", requireUser, async (c) => {
  const { email, password } = await body(c.req.raw, z.object({ email: credentials.shape.email, password: z.string().max(200) }));
  const [user] = await db.select().from(users).where(eq(users.id, c.get("userId")));
  if (!user) throw new HTTPException(401, { message: "unauthorized" });
  await enforceRateLimit(c, "emailChange", user.email);
  if (!user.passwordHash) throw new HTTPException(400, { message: "no_password" });
  if (!(await verifyPassword(password, user.passwordHash))) throw new HTTPException(400, { message: "wrong_password" });
  if (email === user.email) throw new HTTPException(400, { message: "same_email" });
  const [taken] = await db.select({ id: users.id }).from(users).where(and(eq(users.email, email), isNotNull(users.emailVerifiedAt)));
  if (taken) throw new HTTPException(409, { message: "email_taken" });
  await issueEmailChangeCode(user, email, requestLocale(c));
  return c.json({ status: "verification_required", email }, 202);
});

account.post("/me/email/resend", requireUser, async (c) => {
  const [user] = await db.select().from(users).where(eq(users.id, c.get("userId")));
  const [pending] = user ? await db.select().from(emailChangeCodes).where(eq(emailChangeCodes.userId, user.id)) : [];
  if (user && pending) {
    await enforceRateLimit(c, "resend", pending.newEmail);
    await issueEmailChangeCode(user, pending.newEmail, requestLocale(c));
  }
  return c.body(null, 204);
});

/** Step 2: the code from the new inbox. The session stays valid; the old address gets a notice. */
account.post("/me/email/confirm", requireUser, async (c) => {
  const { code } = await body(c.req.raw, z.object({ code: z.string().regex(/^\d{6}$/) }));
  await enforceRateLimit(c, "verify");
  const userId = c.get("userId");
  const [user] = await db.select().from(users).where(eq(users.id, userId));
  const [row] = user ? await db.select().from(emailChangeCodes).where(eq(emailChangeCodes.userId, userId)) : [];
  if (!user || !row) throw new HTTPException(400, { message: "invalid_code" });
  const result = checkCode(code, row);
  if (result !== "ok") {
    if (result === "wrong") await db.update(emailChangeCodes).set({ attempts: row.attempts + 1 }).where(eq(emailChangeCodes.userId, userId));
    throw new HTTPException(400, { message: result === "wrong" ? "invalid_code" : result });
  }
  const updated = await db.transaction(async (tx) => {
    const [other] = await tx.select().from(users).where(and(eq(users.email, row.newEmail), ne(users.id, userId)));
    if (other?.emailVerifiedAt) return null;  // someone verified it in the meantime
    // An abandoned, never verified sign-up with that address doesn't block it (as in /auth/register).
    if (other) await tx.delete(users).where(eq(users.id, other.id));
    const [u] = await tx.update(users).set({ email: row.newEmail, emailVerifiedAt: new Date() }).where(eq(users.id, userId)).returning();
    await tx.delete(emailChangeCodes).where(eq(emailChangeCodes.userId, userId));
    await tx.delete(emailVerificationCodes).where(eq(emailVerificationCodes.userId, userId));
    return u!;
  });
  if (!updated) throw new HTTPException(409, { message: "email_taken" });
  void sendEmailChangedEmail(user.email, updated.email, storedLocale(user.locale, requestLocale(c)))
    .catch((err) => console.error("email changed notice failed", err));
  return c.json({ user: userPayload(updated) });
});

async function issueEmailChangeCode(user: Pick<UserRow, "id" | "locale">, newEmail: string, fallback: Locale): Promise<void> {
  const [existing] = await db.select().from(emailChangeCodes).where(eq(emailChangeCodes.userId, user.id));
  // Same address within the cooldown: the code already sent still works.
  if (existing && existing.newEmail === newEmail && Date.now() - existing.sentAt.getTime() < RESEND_COOLDOWN_MS) return;
  const code = generateCode();
  const row = { newEmail, codeHash: hashCode(code), expiresAt: new Date(Date.now() + CODE_TTL_MS), attempts: 0, sentAt: new Date() };
  await db.insert(emailChangeCodes).values({ userId: user.id, ...row })
    .onConflictDoUpdate({ target: emailChangeCodes.userId, set: row });
  void sendEmailChangeCodeEmail(newEmail, code, storedLocale(user.locale, fallback))
    .catch((err) => console.error("email change code failed", err));
}

/** App Store Review 5.1.1(v): accounts must be deletable in-app. */
account.delete("/me", requireUser, async (c) => {
  const [user] = await db.select({ appleRefreshToken: users.appleRefreshToken }).from(users).where(eq(users.id, c.get("userId")));
  if (user?.appleRefreshToken) await revokeAppleToken(user.appleRefreshToken);
  await db.delete(users).where(eq(users.id, c.get("userId")));
  return c.body(null, 204);
});

account.get("/favourites", requireUser, async (c) => {
  const rows = await db.select({ pieceId: favourites.pieceId, createdAt: favourites.createdAt })
    .from(favourites).where(eq(favourites.userId, c.get("userId")));
  return c.json({ favourites: rows });
});

account.put("/favourites/:pieceId", requireUser, async (c) => {
  const pieceId = c.req.param("pieceId");
  const [exists] = await db.select({ id: pieces.id }).from(pieces).where(eq(pieces.id, pieceId));
  if (!exists) throw new HTTPException(404, { message: "not_found" });
  await db.insert(favourites).values({ userId: c.get("userId"), pieceId }).onConflictDoNothing();
  return c.body(null, 204);
});

account.delete("/favourites/:pieceId", requireUser, async (c) => {
  await db.delete(favourites).where(and(eq(favourites.userId, c.get("userId")), eq(favourites.pieceId, c.req.param("pieceId"))));
  return c.body(null, 204);
});
