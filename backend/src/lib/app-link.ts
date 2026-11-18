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

/**
 * A shared piece as a link preview shows it (iMessage, WhatsApp, Facebook…): the app's share
 * links (utm_source=app-share, utm_content=<piece id>) get an Open Graph page instead of the
 * redirect when a preview bot asks (routes/app-link.ts). Design: design/birthdays-sharing/B3-Link-preview.
 */
export type PiecePreview = {
  /** The language the texts are in ("en" or "tr"). */
  locale: string;
  composerShortName: string;
  title: string;
  hook: string;
  /** The painting alone, as a JPEG preview bots can read (the widget image); null when there is none. */
  imageUrl: string | null;
  /** "Isaac Levitan, Above Eternal Peace" */
  imageAlt: string | null;
};

/** "Tchaikovsky: Symphony No. 6 in B minor, “Pathétique”" */
export function previewTitle(p: PiecePreview): string {
  return `${p.composerShortName}: ${p.title}`;
}

/** The hook, then what the link is: "… A listening guide on DailyClassical." */
export function previewDescription(p: PiecePreview): string {
  const tail = p.locale === "tr" ? "DailyClassical’da bir dinleme rehberi." : "A listening guide on DailyClassical.";
  return `${p.hook.trim()} ${tail}`;
}

/** The shared link as og:url, rebuilt from the cleaned tags (never the raw query). */
export function shareLinkUrl(t: Tags): string {
  const url = new URL("https://dailyclassical.co/app");
  const pairs: [string, string | null][] = [
    ["utm_source", t.source], ["utm_medium", t.medium], ["utm_campaign", t.campaign], ["utm_content", t.content],
  ];
  for (const [k, v] of pairs) if (v) url.searchParams.set(k, v);
  return url.toString();
}

const escapeHtml = (s: string) =>
  s.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;").replace(/'/g, "&#39;");

/**
 * A small page that only link previews read: title, description and the painting (og:image,
 * large Twitter card), with a refresh and a link to the App Store for anything that renders it.
 */
export function previewPage(p: PiecePreview, pageUrl: string, appStore: string): string {
  const title = escapeHtml(previewTitle(p));
  const description = escapeHtml(previewDescription(p));
  const store = escapeHtml(appStore);
  const meta = (attr: "property" | "name", key: string, value: string | null) =>
    value === null ? "" : `<meta ${attr}="${key}" content="${value}">\n`;
  const image = p.imageUrl ? escapeHtml(p.imageUrl) : null;
  const alt = p.imageAlt ? escapeHtml(p.imageAlt) : null;
  return `<!doctype html>
<html lang="${p.locale === "tr" ? "tr" : "en"}">
<head>
<meta charset="utf-8">
<title>${title}</title>
<meta name="description" content="${description}">
${meta("property", "og:type", "website")}${meta("property", "og:site_name", "DailyClassical")}${meta("property", "og:locale", p.locale === "tr" ? "tr_TR" : "en_US")}${meta("property", "og:title", title)}${meta("property", "og:description", description)}${meta("property", "og:url", escapeHtml(pageUrl))}${meta("property", "og:image", image)}${meta("property", "og:image:alt", image && alt)}${meta("name", "twitter:card", "summary_large_image")}${meta("name", "twitter:title", title)}${meta("name", "twitter:description", description)}${meta("name", "twitter:image", image)}<meta http-equiv="refresh" content="0; url=${store}">
</head>
<body>
<p><a href="${store}">${title}</a></p>
</body>
</html>
`;
}
