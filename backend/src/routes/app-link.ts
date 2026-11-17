import { createHmac } from "node:crypto";
import { Hono } from "hono";
import { HTTPException } from "hono/http-exception";
import { sql } from "../db/client.js";
import { env } from "../env.js";
import { appStoreUrl, campaignToken, deviceOf, inAppOf, referrerHost, tagsOf } from "../lib/app-link.js";
import { enforceRateLimit, requestIp } from "../lib/rate-limit.js";

/**
 * GET /app: counts the click (table link_clicks, shown on /admin) and redirects to the App Store
 * as a campaign link. Use it with UTM tags, e.g.
 *   https://dailyclassical.co/app?utm_source=instagram&utm_medium=profile
 * The App Store campaign token (ct) is utm_campaign, else "<source>-<medium>", so downloads from
 * the link show under that name in App Store Connect › Analytics › Acquisition › Campaigns.
 */
export const appLink = new Hono();

const RETENTION_DAYS = 400;

appLink.get("/app", async (c) => {
  const tags = tagsOf((k) => c.req.query(k));
  const ct = campaignToken(tags);
  // HEAD (link checkers) is redirected but not counted; a failed count never blocks the redirect.
  if (c.req.method === "GET") await count(c, tags, ct);
  // Never cached, so every click reaches us.
  c.header("Cache-Control", "no-store");
  c.header("Referrer-Policy", "no-referrer");
  return c.redirect(appStoreUrl(ct), 302);
});

async function count(c: Parameters<typeof enforceRateLimit>[0], tags: ReturnType<typeof tagsOf>, ct: string) {
  try {
    await enforceRateLimit(c, "appLink");
  } catch (err) {
    if (err instanceof HTTPException) c.header("Retry-After", undefined);
    return;  // over the limit: redirect, don't count
  }
  const ua = c.req.header("user-agent") ?? "";
  const day = new Date().toISOString().slice(0, 10);
  const visitor = createHmac("sha256", env.JWT_SECRET).update(`link-click|${day}|${requestIp(c)}|${ua}`).digest("hex").slice(0, 16);
  try {
    await sql`
      insert into link_clicks (source, medium, campaign, content, ct, device, in_app, referrer, visitor)
      values (${tags.source}, ${tags.medium}, ${tags.campaign}, ${tags.content}, ${ct}, ${deviceOf(ua)}, ${inAppOf(ua)},
              ${referrerHost(c.req.header("referer"))}, ${visitor})`;
    if (Math.random() < 0.01) await sql`delete from link_clicks where at < now() - make_interval(days => ${RETENTION_DAYS})`;
  } catch (err) {
    console.error("link click not recorded", err);
  }
}
