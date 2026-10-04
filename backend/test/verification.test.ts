import assert from "node:assert/strict";
import { test } from "node:test";

process.env.DATABASE_URL ??= "postgres://test:test@localhost:5432/test";
process.env.JWT_SECRET ??= "test-secret-test-secret-test-secret-123";
const { checkCode, generateCode, hashCode, MAX_ATTEMPTS } = await import("../src/lib/verification-code.js");
const { verificationCodeEmail } = await import("../src/lib/email-templates.js");

test("codes are six digits and stored only as a keyed hash", () => {
  for (let i = 0; i < 200; i++) assert.match(generateCode(), /^\d{6}$/);
  assert.notEqual(hashCode("123456"), "123456");
  assert.equal(hashCode("123456"), hashCode("123456"));
});

test("checkCode: ok, wrong, expired, attempt limit", () => {
  const future = new Date(Date.now() + 60_000);
  const row = { codeHash: hashCode("482913"), expiresAt: future, attempts: 0 };
  assert.equal(checkCode("482913", row), "ok");
  assert.equal(checkCode("000000", row), "wrong");
  assert.equal(checkCode("482913", { ...row, expiresAt: new Date(Date.now() - 1) }), "expired");
  assert.equal(checkCode("482913", { ...row, attempts: MAX_ATTEMPTS }), "too_many_attempts");
});

test("verification email carries the code in subject, HTML and text, in both languages", () => {
  const en = verificationCodeEmail("en", "482913", 10);
  const tr = verificationCodeEmail("tr", "482913", 10);
  assert.match(en.subject, /482913/);
  assert.match(tr.subject, /482913/);
  assert.match(en.text, /10 minutes/);
  assert.match(tr.text, /10 dakika/);
  assert.equal((en.html.match(/class="digit"/g) ?? []).length, 6);
});
