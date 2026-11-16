import { timingSafeEqual } from "node:crypto";
import { Hono } from "hono";
import { sql } from "../db/client.js";
import { env } from "../env.js";
import { changeOf, type RcEvent, userIdsOf } from "../lib/revenuecat.js";

/**
 * POST /v1/webhooks/revenuecat: RevenueCat › Integrations › Webhooks sends every purchase,
 * renewal, cancellation, billing issue and expiry here, with the Authorization header set in
 * REVENUECAT_WEBHOOK_AUTH. Each event is stored once (revenuecat_events) and, when it names one
 * of our accounts, the account's premium_* columns are updated (lib/revenuecat.ts). For reading in
 * the database and /admin only; the app never reads them. Answers 200 quickly; RevenueCat retries
 * anything else.
 */
export const revenuecat = new Hono();

const MAX_BODY = 50_000;

function authorized(header: string | undefined): boolean {
  const want = env.REVENUECAT_WEBHOOK_AUTH;
  if (!want || !header) return false;
  const a = Buffer.from(header.trim()), b = Buffer.from(want);
  return a.length === b.length && timingSafeEqual(a, b);
}

revenuecat.post("/webhooks/revenuecat", async (c) => {
  if (!env.REVENUECAT_WEBHOOK_AUTH) return c.notFound();
  if (!authorized(c.req.header("authorization"))) return c.body(null, 401);
  const text = await c.req.text();
  if (text.length > MAX_BODY) return c.body(null, 413);
  let event: RcEvent;
  try {
    event = (JSON.parse(text) as { event?: RcEvent }).event as RcEvent;
  } catch {
    return c.body(null, 400);
  }
  if (!event?.id || !event.type) return c.body(null, 400);

  const ids = userIdsOf(event);
  const users = ids.length ? await sql<{ id: string }[]>`select id from users where id = any(${ids}::uuid[])` : [];
  const inserted = await sql`
    insert into revenuecat_events (id, type, app_user_id, user_id, product_id, environment, raw)
    values (${event.id}, ${event.type}, ${event.app_user_id ?? null}, ${users[0]?.id ?? null},
            ${event.product_id ?? null}, ${event.environment ?? null}, ${text}::jsonb)
    on conflict (id) do nothing returning id`;
  if (inserted.length === 0) return c.body(null, 200); // a retry of an event already handled

  const change = changeOf(event);
  if (change && users.length) {
    const at = new Date(event.event_timestamp_ms ?? Date.now());
    const sandbox = event.environment === "SANDBOX";
    for (const u of users) {
      // Late events never overwrite a newer state, and monthly events never downgrade a paid lifetime.
      await sql`
        update users set premium_plan = ${change.plan}, premium_status = ${change.status},
          premium_expires_at = ${change.expiresAt}, premium_updated_at = ${at}, premium_sandbox = ${sandbox}
        where id = ${u.id}
          and (premium_updated_at is null or premium_updated_at <= ${at})
          and not (premium_plan = 'lifetime' and premium_status = 'active' and ${change.plan} = 'monthly')`;
    }
  }
  return c.body(null, 200);
});
