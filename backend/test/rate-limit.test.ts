import assert from "node:assert/strict";
import { test } from "node:test";

// The module imports the db client, which only connects on the first query (none here).
process.env.DATABASE_URL ??= "postgres://test:test@localhost:5432/test";
process.env.JWT_SECRET ??= "test-secret-test-secret-test-secret-123";
const { AUTH_RATE_LIMITS, clientIp, ipBucket, nextCounter, rateLimitKey, retryAfterSeconds, windowStart } =
  await import("../src/lib/rate-limit.js");
type Counter = { windowStart: number; count: number };

const MINUTE = 60_000;
const rule = { scope: "ip", limit: 3, windowMs: 15 * MINUTE } as const;

/** Replays requests at `times` through the same steps the upsert performs. */
function simulate(times: number[]) {
  let counter: Counter | undefined;
  return times.map((now) => {
    counter = nextCounter(counter, windowStart(now, rule.windowMs));
    return retryAfterSeconds([{ rule, counter }], now);
  });
}

test("windows are aligned to the epoch", () => {
  assert.equal(windowStart(0, 15 * MINUTE), 0);
  assert.equal(windowStart(15 * MINUTE - 1, 15 * MINUTE), 0);
  assert.equal(windowStart(15 * MINUTE, 15 * MINUTE), 15 * MINUTE);
  const now = Date.UTC(2026, 9, 7, 12, 7, 30);
  assert.equal(windowStart(now, 15 * MINUTE), Date.UTC(2026, 9, 7, 12, 0, 0));
  assert.equal(windowStart(now, 60 * MINUTE), Date.UTC(2026, 9, 7, 12, 0, 0));
});

test("allows up to the limit, then blocks until the window ends", () => {
  const t0 = Date.UTC(2026, 9, 7, 12, 0, 0);
  const results = simulate([t0, t0 + 1000, t0 + 2000, t0 + 3000, t0 + 10 * MINUTE]);
  assert.deepEqual(results.slice(0, 3), [null, null, null]);
  assert.equal(results[3], 15 * 60 - 3); // seconds left in the window
  assert.equal(results[4], 5 * 60);
});

test("a new window starts counting from one again", () => {
  const t0 = Date.UTC(2026, 9, 7, 12, 0, 0);
  const results = simulate([t0, t0 + 1, t0 + 2, t0 + 3, t0 + 15 * MINUTE, t0 + 15 * MINUTE + 1]);
  assert.notEqual(results[3], null);
  assert.equal(results[4], null);
  assert.equal(results[5], null);
});

test("an older window (lagging clock) counts into the current one instead of resetting it", () => {
  const current = { windowStart: 15 * MINUTE, count: 3 };
  assert.deepEqual(nextCounter(current, 0), { windowStart: 15 * MINUTE, count: 4 });
  assert.deepEqual(nextCounter(current, 15 * MINUTE), { windowStart: 15 * MINUTE, count: 4 });
  assert.deepEqual(nextCounter(current, 30 * MINUTE), { windowStart: 30 * MINUTE, count: 1 });
  assert.deepEqual(nextCounter(undefined, 30 * MINUTE), { windowStart: 30 * MINUTE, count: 1 });
});

test("Retry-After is the longest wait among exceeded rules and at least one second", () => {
  const now = 10 * MINUTE;
  const short = { scope: "ip_email", limit: 1, windowMs: 15 * MINUTE } as const;
  const long = { scope: "ip", limit: 1, windowMs: 60 * MINUTE } as const;
  assert.equal(retryAfterSeconds([{ rule: short, counter: { windowStart: 0, count: 1 } }], now), null);
  assert.equal(retryAfterSeconds([
    { rule: short, counter: { windowStart: 0, count: 2 } },
    { rule: long, counter: { windowStart: 0, count: 1 } },
  ], now), 5 * 60);
  assert.equal(retryAfterSeconds([
    { rule: short, counter: { windowStart: 0, count: 2 } },
    { rule: long, counter: { windowStart: 0, count: 2 } },
  ], now), 50 * 60);
  assert.equal(retryAfterSeconds([{ rule: short, counter: { windowStart: 0, count: 2 } }], 15 * MINUTE - 10), 1);
});

test("every auth action has rules, and email actions are limited per email", () => {
  for (const [action, rules] of Object.entries(AUTH_RATE_LIMITS)) {
    assert.ok(rules.length > 0, action);
    for (const r of rules) assert.ok(r.limit > 0 && r.windowMs > 0, action);
  }
  for (const action of ["login", "register", "resend", "passwordReset"] as const) {
    assert.ok(AUTH_RATE_LIMITS[action].some((r) => r.scope === "email" || r.scope === "ip_email"), action);
    assert.ok(AUTH_RATE_LIMITS[action].some((r) => r.scope === "ip"), action);
  }
});

test("keys are stable, scoped and hold no raw address or email", () => {
  const a = rateLimitKey("login", "email", "someone@example.com");
  assert.equal(a, rateLimitKey("login", "email", "someone@example.com"));
  assert.notEqual(a, rateLimitKey("register", "email", "someone@example.com"));
  assert.notEqual(a, rateLimitKey("login", "ip_email", "someone@example.com"));
  assert.match(a, /^login:email:[0-9a-f]{32}$/);
  assert.doesNotMatch(rateLimitKey("login", "ip", "203.0.113.7"), /203/);
});

test("ipBucket: IPv4 as is, mapped IPv4 unwrapped, IPv6 cut to /64, junk rejected", () => {
  assert.equal(ipBucket("203.0.113.7"), "203.0.113.7");
  assert.equal(ipBucket(" ::ffff:203.0.113.7 "), "203.0.113.7");
  assert.equal(ipBucket("2001:db8:1:2:aaaa:bbbb:cccc:dddd"), "2001:db8:1:2::/64");
  assert.equal(ipBucket("2001:DB8:1:2::1"), "2001:db8:1:2::/64");
  assert.equal(ipBucket("2001:db8::1"), "2001:db8:0:0::/64");
  assert.equal(ipBucket("[2001:db8:1:2::1]"), "2001:db8:1:2::/64");
  assert.equal(ipBucket("fe80::1%en0"), "fe80:0:0:0::/64");
  assert.equal(ipBucket("::1"), "0:0:0:0::/64");
  assert.equal(ipBucket("64:ff9b::192.0.2.1"), "64:ff9b:0:0::/64");
  assert.equal(ipBucket("not-an-ip"), null);
  assert.equal(ipBucket(""), null);
});

test("clientIp trusts proxy headers only behind the proxy", () => {
  const from = { forwardedFor: "198.51.100.4, 10.0.0.2", realIp: "198.51.100.9", socket: "10.0.0.1" };
  assert.equal(clientIp(from, true), "198.51.100.4");
  assert.equal(clientIp({ ...from, forwardedFor: "garbage" }, true), "198.51.100.9");
  assert.equal(clientIp({ socket: "10.0.0.1" }, true), "10.0.0.1");
  // Locally a client could send any header, so only the socket counts.
  assert.equal(clientIp(from, false), "10.0.0.1");
  assert.equal(clientIp({}, false), "unknown");
});
