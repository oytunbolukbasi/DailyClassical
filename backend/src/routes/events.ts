import { Hono } from "hono";
import { z } from "zod";
import { sql } from "../db/client.js";
import { memo } from "../lib/memo.js";
import { enforceRateLimit } from "../lib/rate-limit.js";

/**
 * POST /v1/events: anonymous usage counts from the app (Core/Services/Analytics.swift). An
 * install sends a random UUID it made itself, never an account, device or advertising id; the
 * server keeps one row per install and per active day and per piece and day (db/schema.ts), and
 * the admin page (routes/admin.ts) reads only totals. Rows older than 400 days are deleted.
 */
export const events = new Hono();

const day = z.string().regex(/^\d{4}-\d{2}-\d{2}$/);
const body = z.object({
  installId: z.uuid(),
  appVersion: z.string().max(20).optional(),
  locale: z.string().max(10).optional(),
  test: z.boolean().optional(),
  events: z.array(z.object({
    type: z.enum(["active", "piece_open", "spotify_tap"]),
    day,
    pieceId: z.string().max(100).regex(/^[a-z0-9-]+$/).optional(),
  })).min(1).max(100),
});

const RETENTION_DAYS = 400;

/** Piece ids the content knows; events for anything else are dropped. */
const knownPieces = () => memo("events:pieceIds", 5 * 60_000, async () =>
  new Set((await sql<{ id: string }[]>`select id from pieces`).map((r) => r.id)));

/** A client's local date may be a day either side of the server's; older or later is junk. */
function plausible(d: string, now = Date.now()): boolean {
  const t = Date.parse(`${d}T12:00:00Z`);
  return Number.isFinite(t) && Math.abs(t - now) <= 3 * 86_400_000;
}

events.post("/events", async (c) => {
  await enforceRateLimit(c, "events");
  const parsed = body.safeParse(await c.req.json().catch(() => null));
  if (!parsed.success) return c.json({ error: "invalid_request" }, 400);
  const { installId, appVersion, locale, test, events: list } = parsed.data;

  const pieces = await knownPieces();
  const days = new Set<string>();
  const activity = new Map<string, { pieceId: string; day: string; opens: number; taps: number }>();
  for (const e of list) {
    if (!plausible(e.day)) continue;
    days.add(e.day);
    if (e.type === "active" || !e.pieceId || !pieces.has(e.pieceId)) continue;
    const key = `${e.pieceId}|${e.day}`;
    const row = activity.get(key) ?? { pieceId: e.pieceId, day: e.day, opens: 0, taps: 0 };
    if (e.type === "piece_open") row.opens++;
    else row.taps++;
    activity.set(key, row);
  }
  if (days.size === 0) return c.body(null, 204);
  const sorted = [...days].sort();

  await sql.begin(async (tx) => {
    await tx`
      insert into app_installs (install_id, first_seen, last_seen, app_version, locale, is_test)
      values (${installId}, ${sorted[0]!}, ${sorted.at(-1)!}, ${appVersion ?? null}, ${locale ?? null}, ${test ?? false})
      on conflict (install_id) do update set
        first_seen = least(app_installs.first_seen, excluded.first_seen),
        last_seen = greatest(app_installs.last_seen, excluded.last_seen),
        app_version = coalesce(excluded.app_version, app_installs.app_version),
        locale = coalesce(excluded.locale, app_installs.locale),
        is_test = excluded.is_test`;
    for (const d of sorted) {
      await tx`insert into app_install_days (install_id, day) values (${installId}, ${d}) on conflict do nothing`;
    }
    for (const r of activity.values()) {
      await tx`
        insert into piece_activity (install_id, piece_id, day, opens, spotify_taps)
        values (${installId}, ${r.pieceId}, ${r.day}, ${r.opens}, ${r.taps})
        on conflict (install_id, piece_id, day) do update set
          opens = piece_activity.opens + excluded.opens,
          spotify_taps = piece_activity.spotify_taps + excluded.spotify_taps`;
    }
  });

  // Retention, now and then rather than on a schedule.
  if (Math.random() < 0.01) {
    await sql`delete from app_install_days where day < current_date - ${RETENTION_DAYS}::int`;
    await sql`delete from piece_activity where day < current_date - ${RETENTION_DAYS}::int`;
    await sql`delete from app_installs where last_seen < current_date - ${RETENTION_DAYS}::int`;
  }
  return c.body(null, 204);
});
