import assert from "node:assert/strict";
import { test } from "node:test";
import { changeOf, userIdsOf } from "../src/lib/revenuecat.js";

const USER = "3f2b9c1e-8a4d-4e6f-9b7a-1c2d3e4f5a6b";
const MONTHLY = "co.dailyclassical.premium.monthly";
const LIFETIME = "co.dailyclassical.premium.lifetime";
const base = { id: "evt", app_user_id: USER, event_timestamp_ms: 1_800_000_000_000 };

test("our account ids are found in app_user_id, aliases and transferred_to; anonymous ids are skipped", () => {
  assert.deepEqual(userIdsOf({ ...base, type: "X", app_user_id: "$RCAnonymousID:abc", aliases: [USER.toUpperCase(), "$RCAnonymousID:abc"] }), [USER]);
  assert.deepEqual(userIdsOf({ id: "e", type: "TRANSFER", transferred_to: [USER] }), [USER]);
  assert.deepEqual(userIdsOf({ id: "e", type: "X", app_user_id: "$RCAnonymousID:abc" }), []);
});

test("a monthly trial, its renewal, cancellation and expiry", () => {
  const exp = 1_800_300_000_000;
  assert.deepEqual(changeOf({ ...base, type: "INITIAL_PURCHASE", product_id: MONTHLY, period_type: "TRIAL", expiration_at_ms: exp }),
    { plan: "monthly", status: "trial", expiresAt: new Date(exp) });
  assert.equal(changeOf({ ...base, type: "RENEWAL", product_id: MONTHLY, period_type: "NORMAL", expiration_at_ms: exp })?.status, "active");
  assert.equal(changeOf({ ...base, type: "CANCELLATION", product_id: MONTHLY, cancel_reason: "UNSUBSCRIBE", expiration_at_ms: exp })?.status, "cancelled");
  assert.equal(changeOf({ ...base, type: "BILLING_ISSUE", product_id: MONTHLY, expiration_at_ms: exp })?.status, "billing_issue");
  assert.equal(changeOf({ ...base, type: "EXPIRATION", product_id: MONTHLY, expiration_at_ms: exp })?.status, "expired");
});

test("lifetime has no end date; a refund marks it refunded", () => {
  assert.deepEqual(changeOf({ ...base, type: "NON_RENEWING_PURCHASE", product_id: LIFETIME, expiration_at_ms: null }),
    { plan: "lifetime", status: "active", expiresAt: null });
  assert.equal(changeOf({ ...base, type: "CANCELLATION", product_id: LIFETIME, cancel_reason: "CUSTOMER_SUPPORT" })?.status, "refunded");
});

test("test events, transfers and unknown products change nothing", () => {
  assert.equal(changeOf({ ...base, type: "TEST", product_id: MONTHLY }), null);
  assert.equal(changeOf({ ...base, type: "TRANSFER", product_id: MONTHLY }), null);
  assert.equal(changeOf({ ...base, type: "INITIAL_PURCHASE", product_id: "something.else" }), null);
});

test("the webhook refuses a wrong or missing Authorization header before reading the body", async () => {
  process.env.REVENUECAT_WEBHOOK_AUTH = "Bearer right-secret";
  process.env.JWT_SECRET ??= "test-secret-test-secret-test-secret-123";
  process.env.DATABASE_URL ??= "postgres://user:pass@localhost:5432/none";
  const { revenuecat } = await import("../src/routes/revenuecat.js");
  const body = JSON.stringify({ event: { id: "e", type: "TEST" } });
  assert.equal((await revenuecat.request("/webhooks/revenuecat", { method: "POST", body })).status, 401);
  assert.equal((await revenuecat.request("/webhooks/revenuecat", { method: "POST", body, headers: { authorization: "Bearer wrong" } })).status, 401);
});
