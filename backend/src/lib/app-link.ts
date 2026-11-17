/**
 * dailyclassical.co/app: the one link for bios, stories and posts (routes/app-link.ts). It counts
 * the click and sends the visitor on to the App Store as an App Store Connect campaign link, so
 * downloads show per campaign in App Store Connect › Analytics › Acquisition (the `ct` token).
 */

export const APP_ID = "6820556910";
/** App Store Connect provider id: the `pt` of campaign links (public; it appears in every such link). */
export const PROVIDER_TOKEN = "129257819";

/** Apple accepts campaign tokens up to 40 characters. */
const CT_MAX = 40;

/** A UTM value as stored and shown: lower case, a short safe alphabet, or null when empty. */
export function cleanTag(v: string | undefined | null, max = 60): string | null {
  // Turkish letters to their plain forms (ı has no decomposition), other accents dropped.
  const plain = (v ?? "").replace(/ı/g, "i").replace(/İ/g, "I").normalize("NFD").replace(/[\u0300-\u036f]/g, "");
  const s = plain.trim().toLowerCase().replace(/[^a-z0-9._-]+/g, "-").replace(/-+/g, "-").replace(/^-|-$/g, "").slice(0, max);
  return s || null;
}

export type Tags = { source: string | null; medium: string | null; campaign: string | null; content: string | null };

export function tagsOf(q: (k: string) => string | undefined): Tags {
  return {
    source: cleanTag(q("utm_source")),
    medium: cleanTag(q("utm_medium")),
    campaign: cleanTag(q("utm_campaign")),
    content: cleanTag(q("utm_content")),
  };
}

/**
 * The App Store campaign token: utm_campaign when given, else source-medium
 * ("instagram-profile"), else "web" for a bare /app.
 */
export function campaignToken(t: Tags): string {
  const ct = t.campaign ?? ([t.source, t.medium].filter(Boolean).join("-") || "web");
  return ct.slice(0, CT_MAX).replace(/-$/, "");
}

export function appStoreUrl(ct: string): string {
  return `https://apps.apple.com/app/apple-store/id${APP_ID}?pt=${PROVIDER_TOKEN}&ct=${encodeURIComponent(ct)}&mt=8`;
}

/** Link previews and scripts: redirected like anyone else, but not counted as clicks. */
const BOT = /bot\b|bot\/|crawler|spider|facebookexternalhit|facebookcatalog|meta-externalagent|preview|whatsapp|telegram|slack|discord|embedly|curl\/|wget|python|go-http|okhttp|headless|lighthouse/i;

export type Device = "ios" | "android" | "desktop" | "bot";

export function deviceOf(ua: string): Device {
  if (!ua || BOT.test(ua)) return "bot";
  if (/iPhone|iPad|iPod/.test(ua)) return "ios";
  if (/Android/.test(ua)) return "android";
  return "desktop";
}

/** The app whose built-in browser opened the link, when its user agent says so. */
export function inAppOf(ua: string): string | null {
  if (/Instagram/.test(ua)) return "instagram";
  if (/FBAN|FBAV|FB_IAB/.test(ua)) return "facebook";
  if (/TikTok|musical_ly|BytedanceWebview/i.test(ua)) return "tiktok";
  if (/Threads/.test(ua)) return "threads";
  if (/LinkedInApp/.test(ua)) return "linkedin";
  if (/Twitter/.test(ua)) return "x";
  return null;
}

/** Host of the Referer, without www.; null for none or junk. */
export function referrerHost(ref: string | undefined): string | null {
  if (!ref) return null;
  try {
    return new URL(ref).hostname.replace(/^www\./, "").slice(0, 100) || null;
  } catch {
    return null;
  }
}
