import { Hono } from "hono";
import { z } from "zod";
import { sql } from "../db/client.js";
import { optionalUserId } from "../lib/auth.js";
import { hashResetToken } from "../lib/reset-token.js";
import { enforceRateLimit } from "../lib/rate-limit.js";

/**
 * Push notifications and in-app messages from our own server (no third party). The admin page
 * writes them (routes/admin-messages.ts); lib/push-sender.ts sends the pushes.
 *
 * POST /v1/push/devices   the app's APNs token, sent when notifications are allowed and again when
 *                         the language, Premium or the signed-in account changes.
 * POST /v1/push/opened    a push was tapped (counts per campaign).
 * GET  /v1/messages       in-app messages to show now, in the reader's language.
 * POST /v1/messages/:id/event   shown | tapped (counts per message).
 * POST /v1/push/test-device       verifies this device from an emailed invite (see below).
 */
export const push = new Hono();

const version = z.string().max(20).regex(/^\d+(\.\d+){0,2}$/);
const locale = z.string().max(10).transform((l) => (l.toLowerCase().startsWith("tr") ? "tr" : "en"));

const device = z.object({
  token: z.string().regex(/^[0-9a-f]{64,200}$/i).transform((t) => t.toLowerCase()),
  environment: z.enum(["production", "sandbox"]),
  installId: z.uuid().optional(),
  locale,
  premium: z.boolean(),
  appVersion: version.optional(),
  test: z.boolean().optional(),
});

push.post("/push/devices", async (c) => {
  await enforceRateLimit(c, "push");
  const parsed = device.safeParse(await c.req.json().catch(() => null));
  if (!parsed.success) return c.json({ error: "invalid_request" }, 400);
  const d = parsed.data;
  const userId = await optionalUserId(c.req.header("authorization"));
  await sql`
    insert into push_devices (token, environment, install_id, user_id, locale, is_premium, app_version, is_test)
    values (${d.token}, ${d.environment}, ${d.installId ?? null}, ${userId}, ${d.locale}, ${d.premium}, ${d.appVersion ?? null}, ${d.test ?? false})
    on conflict (token) do update set
      environment = excluded.environment, install_id = coalesce(excluded.install_id, push_devices.install_id),
      user_id = excluded.user_id, locale = excluded.locale, is_premium = excluded.is_premium,
      app_version = excluded.app_version, is_test = excluded.is_test, updated_at = now()`;
  return c.body(null, 204);
});

push.post("/push/opened", async (c) => {
  await enforceRateLimit(c, "push");
  const parsed = z.object({ campaignId: z.uuid() }).safeParse(await c.req.json().catch(() => null));
  if (!parsed.success) return c.json({ error: "invalid_request" }, 400);
  await sql`update push_campaigns set opened_count = opened_count + 1 where id = ${parsed.data.campaignId}`;
  return c.body(null, 204);
});

/** "1.4" < "1.10": versions compare part by part. */
export function versionAtLeast(v: string, min: string): boolean {
  const a = v.split(".").map(Number);
  const b = min.split(".").map(Number);
  for (let i = 0; i < Math.max(a.length, b.length); i++) {
    const x = a[i] ?? 0;
    const y = b[i] ?? 0;
    if (x !== y) return x > y;
  }
  return true;
}

type MessageRow = {
  id: string; title_en: string | null; body_en: string | null; button_en: string | null;
  title_tr: string | null; body_tr: string | null; button_tr: string | null;
  link: string | null; image_url: string | null; min_app_version: string | null; ends_at: Date | string | null;
};

const query = z.object({
  locale,
  premium: z.enum(["0", "1"]).transform((p) => p === "1"),
  appVersion: version,
  /** The app's install id: test-only messages reach verified test devices (push_test_devices). */
  installId: z.uuid().optional(),
});

push.get("/messages", async (c) => {
  await enforceRateLimit(c, "push");
  const parsed = query.safeParse(c.req.query());
  if (!parsed.success) return c.json({ error: "invalid_request" }, 400);
  const q = parsed.data;
  const isTest = q.installId ? await isTestInstall(q.installId) : false;
  const rows = await sql<MessageRow[]>`
    select id, title_en, body_en, button_en, title_tr, body_tr, button_tr, link, image_url, min_app_version, ends_at
    from in_app_messages
    where active and starts_at <= now() and (ends_at is null or ends_at > now())
      and (not test_only or ${isTest})
      and (audience = 'all' or (audience = 'premium') = ${q.premium})
    order by starts_at desc
    limit 5`;
  const tr = q.locale === "tr";
  const messages = rows
    .filter((m) => !m.min_app_version || versionAtLeast(q.appVersion, m.min_app_version))
    .map((m) => ({
      id: m.id,
      title: (tr ? m.title_tr : m.title_en)?.trim() ?? "",
      body: (tr ? m.body_tr : m.body_en)?.trim() ?? "",
      button: (tr ? m.button_tr : m.button_en)?.trim() || null,
      link: m.link,
      imageUrl: m.image_url,
      endsAt: m.ends_at ? new Date(m.ends_at).toISOString() : null,
    }))
    .filter((m) => m.title && m.body);
  c.header("Cache-Control", "no-store");
  return c.json({ messages });
});

async function isTestInstall(installId: string): Promise<boolean> {
  const [row] = await sql`select 1 from push_test_devices where verified_at is not null and install_id = ${installId} limit 1`;
  return !!row;
}

/**
 * POST /v1/push/test-device: the app opened an invite link (dailyclassical://test-device/<invite>).
 * Marks this install (and its push token, if it has one) as a test device. An invite works for
 * one device; the same device may open it again.
 */
const verify = z.object({
  invite: z.string().min(20).max(100),
  installId: z.uuid(),
  pushToken: z.string().regex(/^[0-9a-f]{64,200}$/i).transform((t) => t.toLowerCase()).optional(),
  device: z.string().max(40).optional(),
  appVersion: version.optional(),
});

push.post("/push/test-device", async (c) => {
  await enforceRateLimit(c, "push");
  const parsed = verify.safeParse(await c.req.json().catch(() => null));
  if (!parsed.success) return c.json({ error: "invalid_request" }, 400);
  const v = parsed.data;
  const [row] = await sql<{ id: string; email: string; expires_at: Date | string; verified_at: Date | string | null; install_id: string | null }[]>`
    select id, email, expires_at, verified_at, install_id from push_test_devices where invite_hash = ${hashResetToken(v.invite)}`;
  if (!row) return c.json({ error: "invite_not_found" }, 404);
  if (row.verified_at && row.install_id !== v.installId) return c.json({ error: "invite_used" }, 409);
  if (!row.verified_at && new Date(row.expires_at) < new Date()) return c.json({ error: "invite_expired" }, 410);
  await sql`
    update push_test_devices set verified_at = coalesce(verified_at, now()), install_id = ${v.installId},
      push_token = coalesce(${v.pushToken ?? null}, push_token), device = ${v.device ?? null}, app_version = ${v.appVersion ?? null}
    where id = ${row.id}`;
  return c.json({ ok: true, email: row.email });
});

push.post("/messages/:id/event", async (c) => {
  await enforceRateLimit(c, "push");
  const id = c.req.param("id");
  const parsed = z.object({ action: z.enum(["shown", "tapped"]) }).safeParse(await c.req.json().catch(() => null));
  if (!parsed.success || !/^[0-9a-f-]{36}$/.test(id)) return c.json({ error: "invalid_request" }, 400);
  if (parsed.data.action === "shown") await sql`update in_app_messages set shown_count = shown_count + 1 where id = ${id}`;
  else await sql`update in_app_messages set tapped_count = tapped_count + 1 where id = ${id}`;
  return c.body(null, 204);
});
