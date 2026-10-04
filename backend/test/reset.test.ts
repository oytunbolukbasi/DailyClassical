import assert from "node:assert/strict";
import { test } from "node:test";
import { passwordResetEmail, welcomeEmail } from "../src/lib/email-templates.js";
import {
  RESET_TOKEN_TTL_MS,
  generateResetToken,
  hashResetToken,
  isResetTokenUsable,
  issuedBeforePasswordChange,
  resetTokenExpiry,
} from "../src/lib/reset-token.js";

test("reset tokens are random, URL-safe and stored only as a stable hash", () => {
  const a = generateResetToken();
  const b = generateResetToken();
  assert.notEqual(a, b);
  assert.match(a, /^[A-Za-z0-9_-]{43}$/);
  assert.equal(hashResetToken(a), hashResetToken(a));
  assert.notEqual(hashResetToken(a), a);
  assert.match(hashResetToken(a), /^[0-9a-f]{64}$/);
});

test("reset tokens expire after 30 minutes and are single use", () => {
  const now = new Date("2026-10-04T08:00:00Z");
  assert.equal(RESET_TOKEN_TTL_MS, 30 * 60 * 1000);
  const expiresAt = resetTokenExpiry(now);
  assert.equal(expiresAt.toISOString(), "2026-10-04T08:30:00.000Z");
  assert.equal(isResetTokenUsable({ expiresAt, usedAt: null }, new Date("2026-10-04T08:29:59Z")), true);
  assert.equal(isResetTokenUsable({ expiresAt, usedAt: null }, new Date("2026-10-04T08:30:00Z")), false);
  assert.equal(isResetTokenUsable({ expiresAt, usedAt: new Date("2026-10-04T08:05:00Z") }, now), false);
});

test("sessions issued before a password change are rejected", () => {
  const changed = new Date("2026-10-04T08:00:00.700Z");
  const changedSec = Math.floor(changed.getTime() / 1000);
  assert.equal(issuedBeforePasswordChange(changedSec - 1, changed), true);
  assert.equal(issuedBeforePasswordChange(changedSec, changed), false); // signed in again right after
  assert.equal(issuedBeforePasswordChange(changedSec - 100, null), false);
  assert.equal(issuedBeforePasswordChange(undefined, changed), true);
});

test("emails are localized, mention 30 minutes and escape the link", () => {
  const link = "https://api.dailyclassical.co/reset-password?token=abc&lang=tr";
  const en = passwordResetEmail("en", link);
  const tr = passwordResetEmail("tr", link);
  assert.match(en.text, /30 minutes/);
  assert.match(tr.text, /30 dakika/);
  assert.ok(en.text.includes(link));
  assert.ok(en.html.includes("token=abc&amp;lang=tr"));
  assert.match(tr.html, /<html lang="tr">/);
  assert.notEqual(welcomeEmail("en").subject, welcomeEmail("tr").subject);
});
