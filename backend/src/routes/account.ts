import { and, eq, gt, isNull } from "drizzle-orm";
import { Hono } from "hono";
import { HTTPException } from "hono/http-exception";
import { z } from "zod";
import { db } from "../db/client.js";
import { emailVerificationCodes, favourites, type Locale, locales, passwordResetTokens, pieces, users } from "../db/schema.js";
import { type AuthVars, hashPassword, issueToken, requireUser, verifyPassword } from "../lib/auth.js";
import { sendPasswordResetEmail, sendVerificationCodeEmail, sendWelcomeEmail } from "../lib/email.js";
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
function userPayload(u: Pick<UserRow, "id" | "email" | "compPremiumUntil">) {
  return { id: u.id, email: u.email, premium: !!u.compPremiumUntil && u.compPremiumUntil.getTime() > Date.now() };
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

/** App Store Review 5.1.1(v): accounts must be deletable in-app. */
account.delete("/me", requireUser, async (c) => {
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
