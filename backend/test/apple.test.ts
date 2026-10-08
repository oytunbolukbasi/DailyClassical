import assert from "node:assert/strict";
import { test } from "node:test";
import { createLocalJWKSet, exportJWK, generateKeyPair, SignJWT } from "jose";

process.env.DATABASE_URL ??= "postgres://u:p@localhost:5432/x";
process.env.JWT_SECRET ??= "x".repeat(32);

async function setup() {
  const { verifyAppleIdentityToken } = await import("../src/lib/apple.js");
  const { publicKey, privateKey } = await generateKeyPair("RS256");
  const jwk = { ...(await exportJWK(publicKey)), kid: "k1", alg: "RS256" };
  const keys = createLocalJWKSet({ keys: [jwk] });
  const sign = (claims: Record<string, unknown>, opts: { iss?: string; aud?: string; exp?: string } = {}) =>
    new SignJWT(claims)
      .setProtectedHeader({ alg: "RS256", kid: "k1" })
      .setIssuer(opts.iss ?? "https://appleid.apple.com")
      .setAudience(opts.aud ?? "co.dailyclassical.app")
      .setSubject("001234.abcd")
      .setIssuedAt()
      .setExpirationTime(opts.exp ?? "5m")
      .sign(privateKey);
  return { verify: (t: string) => verifyAppleIdentityToken(t, keys, "co.dailyclassical.app"), sign };
}

test("a valid Apple identity token yields sub, lower-cased email and verification", async () => {
  const { verify, sign } = await setup();
  const id = await verify(await sign({ email: "Someone@PrivateRelay.AppleID.com", email_verified: "true" }));
  assert.deepEqual(id, { sub: "001234.abcd", email: "someone@privaterelay.appleid.com", emailVerified: true });
});

test("tokens for another app, from another issuer or expired are rejected", async () => {
  const { verify, sign } = await setup();
  await assert.rejects(verify(await sign({}, { aud: "com.example.other" })));
  await assert.rejects(verify(await sign({}, { iss: "https://evil.example" })));
  await assert.rejects(verify(await sign({}, { exp: "-1m" })));
});

test("a token without an email still verifies (returning users)", async () => {
  const { verify, sign } = await setup();
  assert.deepEqual(await verify(await sign({})), { sub: "001234.abcd", email: null, emailVerified: false });
});

test("the Apple private key is read however it was pasted", async () => {
  const { normalizePrivateKey } = await import("../src/lib/apple.js");
  const { importPKCS8, exportPKCS8, generateKeyPair } = await import("jose");
  const { privateKey } = await generateKeyPair("ES256", { extractable: true });
  const pem = await exportPKCS8(privateKey);
  const body = pem.split("\n").filter((l) => l && !l.startsWith("-----")).join("");
  const variants = [
    pem,
    pem.replace(/\n/g, "\\n"),
    pem.replace(/\n/g, " "),
    pem.replace(/\n/g, "\r\n"),
    body,
    `"${pem}"`,
  ];
  for (const v of variants) await importPKCS8(normalizePrivateKey(v), "ES256");
});
