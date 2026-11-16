import assert from "node:assert/strict";
import { test } from "node:test";
import { SignJWT } from "jose";

process.env.ADMIN_EMAILS ??= "admin@example.com";
process.env.JWT_SECRET ??= "test-secret-test-secret-test-secret-123";
process.env.DATABASE_URL ??= "postgres://user:pass@localhost:5432/none";

const token = async (email: string, issuedAt: number) =>
  new SignJWT({}).setProtectedHeader({ alg: "HS256" }).setSubject(email).setAudience("dailyclassical-admin")
    .setIssuedAt(issuedAt).setExpirationTime(issuedAt + 90 * 86_400)
    .sign(new TextEncoder().encode(process.env.JWT_SECRET));

// /admin/diagnostics/<bad id> checks the session, then answers 404 without touching the database.
const probe = async (cookie?: string) => {
  const { admin } = await import("../src/routes/admin.js");
  return admin.request("/admin/diagnostics/not-an-id", { headers: cookie ? { cookie } : {} });
};

test("no session: back to the sign-in page", async () => {
  const res = await probe();
  assert.equal(res.status, 303);
});

test("a session older than a day is renewed as a 90-day Lax cookie", async () => {
  const email = process.env.ADMIN_EMAILS!.split(",")[0]!;
  const old = await token(email, Math.floor(Date.now() / 1000) - 3 * 86_400);
  const res = await probe(`dc_admin=${old}`);
  assert.equal(res.status, 404);
  const set = res.headers.get("set-cookie") ?? "";
  assert.match(set, /^dc_admin=/);
  assert.match(set, /SameSite=Lax/);
  assert.match(set, /Max-Age=7776000/);
  assert.match(set, /Path=\/admin/);
});

test("a fresh session is not re-issued on every request", async () => {
  const email = process.env.ADMIN_EMAILS!.split(",")[0]!;
  const res = await probe(`dc_admin=${await token(email, Math.floor(Date.now() / 1000) - 60)}`);
  assert.equal(res.status, 404);
  assert.equal(res.headers.get("set-cookie"), null);
});
