import { createHmac } from "node:crypto";
import { Hono, type Context } from "hono";
import { HTTPException } from "hono/http-exception";
import { listPieces, widgetImageUrl } from "../content/repository.js";
import { db, sql } from "../db/client.js";
import type { Locale } from "../db/schema.js";
import { env } from "../env.js";
import {
  appStoreUrl, campaignToken, deviceOf, inAppOf, previewPage, referrerHost, shareLinkUrl, tagsOf, type PiecePreview, type Tags,
} from "../lib/app-link.js";
import { requestLocale } from "../lib/locale.js";
import { memo } from "../lib/memo.js";
import { enforceRateLimit, requestIp } from "../lib/rate-limit.js";

/**
 * GET /app: counts the click (table link_clicks, shown on /admin) and redirects to the App Store
 * as a campaign link. Use it with UTM tags, e.g.
 *   https://dailyclassical.co/app?utm_source=instagram&utm_medium=profile
 * The App Store campaign token (ct) is utm_campaign, else "<source>-<medium>", so downloads from
 * the link show under that name in App Store Connect › Analytics › Acquisition › Campaigns.
 *
 * The app's share links carry the piece id in utm_content
 * (…?utm_source=app-share&utm_medium=piece|moment&utm_content=<piece id>). When a link-preview bot
 * (iMessage, WhatsApp, Facebook…) asks for one, it gets a small Open Graph page for that piece
 * instead (lib/app-link.ts previewPage): title, hook and the painting. People are always redirected.
 */
export type AppLinkDeps = {
  /** The piece behind utm_content, in `locale` (English fallback); null for an unknown id. */
  preview: (pieceId: string, locale: Locale) => Promise<PiecePreview | null>;
  /** Counts the click (GET only). */
  record: (c: Context, tags: Tags, ct: string) => Promise<void>;
};

const RETENTION_DAYS = 400;
const PREVIEW_TTL = 5 * 60_000;

export function appLinkRoutes(deps: Partial<AppLinkDeps> = {}) {
  const preview = deps.preview ?? piecePreview;
  const record = deps.record ?? count;
  const routes = new Hono();

  routes.get("/app", async (c) => {
    const tags = tagsOf((k) => c.req.query(k));
    const ct = campaignToken(tags);
    // HEAD (link checkers) is redirected but not counted; a failed count never blocks the redirect.
    if (c.req.method === "GET") await record(c, tags, ct);
    // Never cached, so every click reaches us.
    c.header("Cache-Control", "no-store");
    c.header("Referrer-Policy", "no-referrer");
    if (tags.content && deviceOf(c.req.header("user-agent") ?? "") === "bot") {
      const piece = await preview(tags.content, requestLocale(c)).catch((err) => {
        console.error("link preview failed", err);
        return null;
      });
      if (piece) return c.html(previewPage(piece, shareLinkUrl(tags), appStoreUrl(ct)));
    }
    return c.redirect(appStoreUrl(ct), 302);
  });

  return routes;
}

export const appLink = appLinkRoutes();

/** The link preview's fields from the content tables: the painting is the widget JPEG (long side ≤ 1100 px). */
async function piecePreview(pieceId: string, locale: Locale): Promise<PiecePreview | null> {
  return memo(`app-link-preview:${pieceId}:${locale}`, PREVIEW_TTL, async () => {
    const [p] = await listPieces(db, locale, [pieceId]);
    if (!p) return null;
    return {
      locale: p.contentLocale,
      composerShortName: p.composer.shortName,
      title: p.title,
      hook: p.hook,
      imageUrl: widgetImageUrl(p.id),
      imageAlt: p.painting ? `${p.painting.artist}, ${p.painting.title}` : null,
    };
  });
}

async function count(c: Context, tags: Tags, ct: string) {
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
    if (Math.random() < 0.01) await sql`delete from link_clicks where at < now() - make_interval(days => ${RETENTION_DAYS}::int)`;
  } catch (err) {
    console.error("link click not recorded", err);
  }
}
