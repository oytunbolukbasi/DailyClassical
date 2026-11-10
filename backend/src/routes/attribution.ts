import { Hono, type Context } from "hono";
import { sql } from "../db/client.js";
import { readPostback } from "../lib/ad-postback.js";
import { enforceRateLimit } from "../lib/rate-limit.js";

/**
 * Developer copies of winning install postbacks. iOS posts them to the registrable domain named in
 * the app's Info.plist (NSAdvertisingAttributionReportEndpoint, AdAttributionKit ›
 * AttributionCopyEndpoint: https://dailyclassical.co), so these paths must be served on the apex
 * domain, not only on api. or www. The admin page counts installs per ad network and campaign.
 */
export const attribution = new Hono();

const MAX_BODY = 20_000;

async function store(c: Context, framework: "skadnetwork" | "adattributionkit") {
  await enforceRateLimit(c, "postbacks");
  const text = await c.req.text();
  if (text.length > MAX_BODY) return c.body(null, 413);
  let body: unknown;
  try { body = JSON.parse(text); } catch { return c.body(null, 400); }
  const p = readPostback(framework, body);
  if (!p) return c.body(null, 400);
  await sql`
    insert into ad_postbacks (framework, ad_network_id, source_identifier, conversion_type, fine_value, coarse_value, postback_index, raw)
    values (${framework}, ${p.adNetworkId}, ${p.sourceIdentifier}, ${p.conversionType}, ${p.fineValue}, ${p.coarseValue},
            ${p.postbackIndex}, ${text}::jsonb)`;
  return c.body(null, 200);
}

// Apple's paths end in a slash; accept both forms.
attribution.post("/.well-known/skadnetwork/report-attribution", (c) => store(c, "skadnetwork"));
attribution.post("/.well-known/skadnetwork/report-attribution/", (c) => store(c, "skadnetwork"));
attribution.post("/.well-known/appattribution/report-attribution", (c) => store(c, "adattributionkit"));
attribution.post("/.well-known/appattribution/report-attribution/", (c) => store(c, "adattributionkit"));
