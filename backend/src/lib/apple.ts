import { createRemoteJWKSet, importPKCS8, type JWTVerifyGetKey, jwtVerify, SignJWT } from "jose";
import { env } from "../env.js";

/**
 * Sign in with Apple, server side. The app sends the identity token (a JWT Apple signed for our
 * bundle id) and a one-time authorization code. The token proves who the user is; the code is
 * exchanged for a refresh token, kept only so the Apple link can be revoked when the account is
 * deleted, as App Store Review requires.
 */
const APPLE_ISSUER = "https://appleid.apple.com";
const appleKeys = createRemoteJWKSet(new URL(`${APPLE_ISSUER}/auth/keys`));

export type AppleIdentity = { sub: string; email: string | null; emailVerified: boolean };

/** Apple sends booleans as JSON booleans or as the strings "true" / "false". */
const truthy = (v: unknown) => v === true || v === "true";

export async function verifyAppleIdentityToken(
  token: string,
  keys: JWTVerifyGetKey = appleKeys,
  audience = env.APPLE_BUNDLE_ID,
): Promise<AppleIdentity> {
  const { payload } = await jwtVerify(token, keys, { issuer: APPLE_ISSUER, audience });
  if (typeof payload.sub !== "string" || !payload.sub) throw new Error("apple token without sub");
  const email = typeof payload.email === "string" ? payload.email.trim().toLowerCase() : null;
  return { sub: payload.sub, email, emailVerified: truthy(payload.email_verified) };
}

const configured = () => !!(env.APPLE_TEAM_ID && env.APPLE_KEY_ID && env.APPLE_PRIVATE_KEY);

/** The short-lived ES256 client secret Apple's token and revoke endpoints require. */
async function clientSecret(): Promise<string> {
  const key = await importPKCS8(env.APPLE_PRIVATE_KEY!, "ES256");
  return new SignJWT({})
    .setProtectedHeader({ alg: "ES256", kid: env.APPLE_KEY_ID! })
    .setIssuer(env.APPLE_TEAM_ID!)
    .setSubject(env.APPLE_BUNDLE_ID)
    .setAudience(APPLE_ISSUER)
    .setIssuedAt()
    .setExpirationTime("5m")
    .sign(key);
}

async function post(path: string, form: Record<string, string>) {
  return fetch(`${APPLE_ISSUER}${path}`, {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: new URLSearchParams(form),
    signal: AbortSignal.timeout(10_000),
  });
}

/** Exchanges the authorization code for a refresh token; null when not configured or on failure. */
export async function exchangeAppleCode(code: string): Promise<string | null> {
  if (!configured()) return null;
  try {
    const res = await post("/auth/token", {
      client_id: env.APPLE_BUNDLE_ID, client_secret: await clientSecret(), code, grant_type: "authorization_code",
    });
    if (!res.ok) {
      console.error("apple code exchange failed", res.status);
      return null;
    }
    const body = (await res.json()) as { refresh_token?: string };
    return body.refresh_token ?? null;
  } catch (err) {
    console.error("apple code exchange failed", err);
    return null;
  }
}

/** Revokes the Apple link (best effort: account deletion must not fail because Apple is down). */
export async function revokeAppleToken(refreshToken: string): Promise<void> {
  if (!configured()) return;
  try {
    const res = await post("/auth/revoke", {
      client_id: env.APPLE_BUNDLE_ID, client_secret: await clientSecret(), token: refreshToken, token_type_hint: "refresh_token",
    });
    if (!res.ok) console.error("apple revoke failed", res.status);
  } catch (err) {
    console.error("apple revoke failed", err);
  }
}
