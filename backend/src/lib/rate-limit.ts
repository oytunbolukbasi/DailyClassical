import { createHash } from "node:crypto";
import { isIP } from "node:net";
import { getConnInfo } from "@hono/node-server/conninfo";
import { lt, sql } from "drizzle-orm";
import type { Context } from "hono";
import { HTTPException } from "hono/http-exception";
import { db } from "../db/client.js";
import { rateLimits } from "../db/schema.js";
import { env } from "../env.js";

/**
 * Request limits for the auth endpoints, kept in Postgres (table rate_limit) so they hold
 * across API instances and restarts. Fixed windows aligned to the epoch: cheap (one upsert per
 * request, see enforceRateLimit) at the cost of allowing up to 2× a limit across a window edge,
 * which is fine for these numbers. Every request counts, including blocked ones, so a client
 * that keeps hammering stays blocked until the window ends.
 *
 * These sit on top of the per-code limits in verification-code.ts (5 tries per code, 30 s
 * between codes), which still apply.
 */

const MINUTE = 60_000;
const HOUR = 60 * MINUTE;

/** What a counter is keyed on. "ip" is the client address (an IPv6 /64, see ipBucket). */
export type RateLimitScope = "ip" | "email" | "ip_email";
export type RateLimitRule = { scope: RateLimitScope; limit: number; windowMs: number };

export const AUTH_RATE_LIMITS = {
  login: [
    // Password guessing against one account from one address. Ten covers typos and a few
    // remembered variants.
    { scope: "ip_email", limit: 10, windowMs: 15 * MINUTE },
    // One account from many addresses (a botnet). Also lets someone lock a known address out
    // of sign-in for up to 15 minutes at a time; accepted, since they can't get in either.
    { scope: "email", limit: 30, windowMs: 15 * MINUTE },
    // One address spraying many accounts. High enough for a shared office or carrier NAT.
    { scope: "ip", limit: 50, windowMs: 15 * MINUTE },
  ],
  register: [
    // Each sign-up (and each re-sign-up of an unverified address) emails a code: these cap
    // mail sent to one inbox and accounts created from one address. 10 rather than 5 per IP
    // because mobile carriers put many phones behind one IPv4 address.
    { scope: "email", limit: 5, windowMs: HOUR },
    { scope: "ip", limit: 10, windowMs: HOUR },
  ],
  verify: [
    // Codes already lock after 5 wrong tries; this bounds guessing across many accounts.
    { scope: "ip", limit: 20, windowMs: 15 * MINUTE },
  ],
  resend: [
    // Email bombing: the app's "Send a new code" waits 30 s, so 5 an hour is ample for a person.
    { scope: "email", limit: 5, windowMs: HOUR },
    { scope: "ip", limit: 20, windowMs: HOUR },
  ],
  passwordReset: [
    // Same reasoning as resend: each request emails a link.
    { scope: "email", limit: 5, windowMs: HOUR },
    { scope: "ip", limit: 20, windowMs: HOUR },
  ],
  passwordResetConfirm: [
    // Tokens are 256-bit, so this is about scrypt CPU rather than guessing.
    { scope: "ip", limit: 20, windowMs: 15 * MINUTE },
  ],
} as const satisfies Record<string, readonly RateLimitRule[]>;

export type RateLimitAction = keyof typeof AUTH_RATE_LIMITS;

// ---- Window logic (pure) ----

/** Start of the fixed window containing `now` (ms since epoch). */
export function windowStart(now: number, windowMs: number): number {
  return now - (now % windowMs);
}

export type Counter = { windowStart: number; count: number };

/**
 * The counter after one more request; mirrors the ON CONFLICT clause in enforceRateLimit. A
 * newer window starts again at 1; an older one (an instance whose clock runs slightly behind)
 * counts into the current window instead of resetting it.
 */
export function nextCounter(existing: Counter | undefined, start: number): Counter {
  if (!existing || start > existing.windowStart) return { windowStart: start, count: 1 };
  return { windowStart: existing.windowStart, count: existing.count + 1 };
}

/** Seconds until every exceeded counter's window has ended, or null when none is exceeded. */
export function retryAfterSeconds(hits: { rule: RateLimitRule; counter: Counter }[], now: number): number | null {
  let limited = false;
  let waitMs = 0;
  for (const { rule, counter } of hits) {
    if (counter.count <= rule.limit) continue;
    limited = true;
    waitMs = Math.max(waitMs, counter.windowStart + rule.windowMs - now);
  }
  return limited ? Math.max(1, Math.ceil(waitMs / 1000)) : null;
}

// ---- Keys and client address (pure) ----

/** Counter key. Only a hash of the address/email is stored, so the table holds no personal data. */
export function rateLimitKey(action: RateLimitAction, scope: RateLimitScope, subject: string): string {
  return `${action}:${scope}:${createHash("sha256").update(subject).digest("hex").slice(0, 32)}`;
}

function ipv6Hextets(address: string): number[] {
  let s = address;
  const v4 = /(\d+)\.(\d+)\.(\d+)\.(\d+)$/.exec(s); // "64:ff9b::192.0.2.1"
  if (v4) {
    const [a, b, c, d] = v4.slice(1).map(Number) as [number, number, number, number];
    s = `${s.slice(0, v4.index)}${((a << 8) | b).toString(16)}:${((c << 8) | d).toString(16)}`;
  }
  const [head, tail] = s.split("::");
  const h = head ? head.split(":") : [];
  const t = tail === undefined ? [] : tail ? tail.split(":") : [];
  const zeros = tail === undefined ? 0 : 8 - h.length - t.length;
  return [...h, ...Array<string>(zeros).fill("0"), ...t].map((x) => parseInt(x, 16));
}

/**
 * The address a limit applies to, or null if `raw` isn't an IP. IPv4 as is (IPv4-mapped IPv6
 * unwrapped); IPv6 cut to its /64, because one subscriber is handed a whole /64 and could
 * otherwise rotate through it for fresh limits.
 */
export function ipBucket(raw: string): string | null {
  let ip = raw.trim().replace(/^\[(.*)\]$/, "$1").split("%")[0]!;
  const mapped = /^::ffff:(\d+\.\d+\.\d+\.\d+)$/i.exec(ip);
  if (mapped) ip = mapped[1]!;
  const kind = isIP(ip);
  if (kind === 4) return ip;
  if (kind !== 6) return null;
  return `${ipv6Hextets(ip.toLowerCase()).slice(0, 4).map((n) => n.toString(16)).join(":")}::/64`;
}

/**
 * Client address. Behind Railway's edge proxy (production) the socket peer is the proxy, so
 * the client comes from the headers: the left-most X-Forwarded-For entry, then X-Real-IP.
 * Railway's edge discards any X-Forwarded-For the client sent, so the first entry is the
 * address that connected to it. Trade-off: this trusts Railway's header handling, which it
 * doesn't formally document; if it ever appended to a client-sent header instead, a client
 * could rotate that value to escape the per-IP limits (the per-email ones would still hold).
 * Putting another proxy in front (e.g. Cloudflare with proxying on) would make every client
 * look like that proxy, so revisit this then. Outside production (local `npm run dev`) the
 * headers are ignored and the socket address is used.
 */
export function clientIp(
  from: { forwardedFor?: string | null; realIp?: string | null; socket?: string | null },
  behindProxy: boolean,
): string {
  const candidates = behindProxy ? [from.forwardedFor?.split(",")[0], from.realIp, from.socket] : [from.socket];
  for (const candidate of candidates) {
    const bucket = candidate ? ipBucket(candidate) : null;
    if (bucket) return bucket;
  }
  return "unknown";
}

// ---- Enforcement (Postgres) ----

function requestIp(c: Context): string {
  let socket: string | undefined;
  try {
    socket = getConnInfo(c).remote.address;
  } catch {
    // No Node socket (app.request() in tests).
  }
  return clientIp(
    { forwardedFor: c.req.header("x-forwarded-for"), realIp: c.req.header("x-real-ip"), socket },
    env.NODE_ENV === "production",
  );
}

/** Expired rows are deleted at most this often per instance, off the request path. */
const CLEANUP_INTERVAL_MS = 10 * MINUTE;
let lastCleanup = 0;

function cleanUpExpired(now: number) {
  if (now - lastCleanup < CLEANUP_INTERVAL_MS) return;
  lastCleanup = now;
  void db.delete(rateLimits).where(lt(rateLimits.expiresAt, new Date(now)))
    .catch((err) => console.error("rate limit cleanup failed", err));
}

/**
 * Counts this request against every rule for `action` and throws 429 `rate_limited` (with
 * Retry-After) when any is over its limit. Call it after the body is validated and before any
 * expensive work (scrypt, email). `email` is the normalized address from the body, for the
 * actions that have one. Fails open if the counter query errors: the limits are a guard, and
 * auth shouldn't go down with them.
 */
export async function enforceRateLimit(c: Context, action: RateLimitAction, email?: string): Promise<void> {
  const now = Date.now();
  const ip = requestIp(c);
  const subjects: Record<RateLimitScope, string | undefined> = {
    ip,
    email,
    ip_email: email === undefined ? undefined : `${ip}|${email}`,
  };
  const rules = new Map<string, RateLimitRule>();
  const rows = [];
  for (const rule of AUTH_RATE_LIMITS[action] as readonly RateLimitRule[]) {
    const subject = subjects[rule.scope];
    if (subject === undefined) continue;
    const key = rateLimitKey(action, rule.scope, subject);
    const start = windowStart(now, rule.windowMs);
    rules.set(key, rule);
    rows.push({ key, windowStart: new Date(start), count: 1, expiresAt: new Date(start + rule.windowMs) });
  }
  if (rows.length === 0) return;

  let counters: { key: string; windowStart: Date; count: number }[];
  try {
    // One statement for all of the action's counters (same logic as nextCounter).
    counters = await db.insert(rateLimits).values(rows)
      .onConflictDoUpdate({
        target: rateLimits.key,
        set: {
          count: sql`case when excluded.window_start > ${rateLimits.windowStart} then 1 else ${rateLimits.count} + 1 end`,
          windowStart: sql`greatest(${rateLimits.windowStart}, excluded.window_start)`,
          expiresAt: sql`greatest(${rateLimits.expiresAt}, excluded.expires_at)`,
        },
      })
      .returning({ key: rateLimits.key, windowStart: rateLimits.windowStart, count: rateLimits.count });
  } catch (err) {
    console.error("rate limit check failed", err);
    return;
  }
  cleanUpExpired(now);

  const retryAfter = retryAfterSeconds(
    counters.map((r) => ({ rule: rules.get(r.key)!, counter: { windowStart: r.windowStart.getTime(), count: r.count } })),
    now,
  );
  if (retryAfter !== null) {
    c.header("Retry-After", String(retryAfter)); // kept on the error response built in app.onError
    throw new HTTPException(429, { message: "rate_limited" });
  }
}
