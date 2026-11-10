import { Hono } from "hono";
import { z } from "zod";
import { sql } from "../db/client.js";
import { signatureOf } from "../lib/diagnostic-signature.js";
import { enforceRateLimit } from "../lib/rate-limit.js";

/**
 * POST /v1/diagnostics: MetricKit crash, hang, launch, CPU and disk-write reports from the app
 * (Core/Services/Diagnostics.swift), one per request. No install or account id. Each report gets a
 * `signature` (lib/diagnostic-signature.ts) so the admin page (routes/admin.ts) can group the same
 * fault. Offsets are read on a Mac against the build's dSYM (ios/scripts/symbolicate.sh).
 */
export const diagnostics = new Hono();

const MAX_BODY = 300_000;
const RETENTION_DAYS = 180;

const body = z.object({
  kind: z.enum(["crash", "hang", "cpu", "disk", "launch"]),
  appVersion: z.string().max(20),
  build: z.string().max(20),
  osVersion: z.string().max(80),
  device: z.string().max(40),
  at: z.iso.datetime({ offset: true }).optional(),
  details: z.record(z.string().max(40), z.string().max(500)).refine((d) => Object.keys(d).length <= 12),
  callStack: z.unknown().optional(),
  test: z.boolean().optional(),
});

diagnostics.post("/diagnostics", async (c) => {
  await enforceRateLimit(c, "diagnostics");
  const text = await c.req.text();
  if (text.length > MAX_BODY) return c.json({ error: "too_large" }, 413);
  let json: unknown;
  try { json = JSON.parse(text); } catch { return c.json({ error: "invalid_request" }, 400); }
  const parsed = body.safeParse(json);
  if (!parsed.success) return c.json({ error: "invalid_request" }, 400);
  const r = parsed.data;
  const signature = signatureOf(r.kind, r.details, r.callStack);
  await sql`
    insert into diagnostic_reports (happened_at, kind, signature, app_version, build, os_version, device, details, call_stack, is_test)
    values (${r.at ?? null}::timestamptz, ${r.kind}, ${signature}, ${r.appVersion}, ${r.build}, ${r.osVersion}, ${r.device},
            ${JSON.stringify(r.details)}::jsonb, ${r.callStack === undefined ? null : JSON.stringify(r.callStack)}::jsonb, ${r.test ?? false})`;
  if (Math.random() < 0.05) {
    await sql`delete from diagnostic_reports where received_at < now() - ${RETENTION_DAYS} * interval '1 day'`;
  }
  return c.body(null, 204);
});
