import assert from "node:assert/strict";
import { test } from "node:test";
process.env.JWT_SECRET ??= "test-secret-test-secret-test-secret-123";
process.env.DATABASE_URL ??= "postgres://user:pass@localhost:5432/none";

import { appStoreUrl, campaignToken, cleanTag, deviceOf, inAppOf, referrerHost, tagsOf } from "../src/lib/app-link.js";

const IG_IPHONE = "Mozilla/5.0 (iPhone; CPU iPhone OS 18_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 350.0.0.0 (iPhone15,2; iOS 18_1; tr_TR)";

test("campaign token: utm_campaign, else source-medium, else web; at most 40 characters", () => {
  const q = (o: Record<string, string>) => tagsOf((k) => o[k]);
  assert.equal(campaignToken(q({ utm_source: "Instagram", utm_medium: "Profile" })), "instagram-profile");
  assert.equal(campaignToken(q({ utm_source: "instagram", utm_medium: "story", utm_campaign: "Kasım Lansman" })), "kasim-lansman");
  assert.equal(campaignToken(q({ utm_source: "instagram" })), "instagram");
  assert.equal(campaignToken(q({})), "web");
  assert.ok(campaignToken(q({ utm_campaign: "x".repeat(80) })).length <= 40);
  assert.equal(cleanTag("  <script>alert(1)</script> "), "script-alert-1-script");
  assert.equal(cleanTag(""), null);
  assert.equal(cleanTag("Şubat Öğretmen Çağrısı"), "subat-ogretmen-cagrisi");
});

test("the App Store link is a campaign link for our app", () => {
  assert.equal(appStoreUrl("instagram-profile"), "https://apps.apple.com/app/apple-store/id6820556910?pt=129257819&ct=instagram-profile&mt=8");
});

test("devices, in-app browsers, link previews and referrers", () => {
  assert.equal(deviceOf(IG_IPHONE), "ios");
  assert.equal(inAppOf(IG_IPHONE), "instagram");
  assert.equal(deviceOf("facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)"), "bot");
  assert.equal(deviceOf("WhatsApp/2.23.20.0"), "bot");
  assert.equal(deviceOf(""), "bot");
  assert.equal(deviceOf("Mozilla/5.0 (Linux; Android 14; Pixel 8) AppleWebKit/537.36 Chrome/120 Mobile Safari/537.36"), "android");
  assert.equal(deviceOf("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 Version/18.0 Safari/605.1.15"), "desktop");
  assert.equal(referrerHost("https://l.instagram.com/?u=x"), "l.instagram.com");
  assert.equal(referrerHost("https://www.google.com/"), "google.com");
  assert.equal(referrerHost("not a url"), null);
});

test("GET /app redirects to the App Store campaign link and is never cached", async () => {
  const { appLink } = await import("../src/routes/app-link.js");
  // HEAD skips the database, so this runs without one.
  const res = await appLink.request("/app?utm_source=instagram&utm_medium=profile", { method: "HEAD" });
  assert.equal(res.status, 302);
  assert.equal(res.headers.get("location"), "https://apps.apple.com/app/apple-store/id6820556910?pt=129257819&ct=instagram-profile&mt=8");
  assert.equal(res.headers.get("cache-control"), "no-store");
});

// Link previews of the app's share links (design/birthdays-sharing/B3-Link-preview).
const SHARE = "/app?utm_source=app-share&utm_medium=piece&utm_content=tchaikovsky-symphony-6";
const IMESSAGE = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/601.2.4 (KHTML, like Gecko) Version/9.0.1 Safari/601.2.4 facebookexternalhit/1.1 Facebot Twitterbot/1.0";
const SAFARI_IPHONE = "Mozilla/5.0 (iPhone; CPU iPhone OS 26_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.1 Mobile/15E148 Safari/604.1";
const PATHETIQUE = {
  en: { locale: "en", composerShortName: "Tchaikovsky", title: "Symphony No. 6 in B minor, “Pathétique”", hook: "A symphony that ends not in triumph but in silence." },
  tr: { locale: "tr", composerShortName: "Çaykovski", title: "Si minör 6. Senfoni, “Patetik”", hook: "Zaferle değil, sessizlikle biten bir senfoni." },
};

async function shareRoutes() {
  const { appLinkRoutes } = await import("../src/routes/app-link.js");
  const calls = { preview: [] as string[], record: 0 };
  const routes = appLinkRoutes({
    preview: async (id, locale) => {
      calls.preview.push(`${id}:${locale}`);
      if (id !== "tchaikovsky-symphony-6") return null;
      return {
        ...PATHETIQUE[locale === "tr" ? "tr" : "en"],
        imageUrl: "https://api.dailyclassical.co/images/widget/tchaikovsky-symphony-6.jpg?v=e86db379aa",
        imageAlt: "Isaac Levitan, Above Eternal Peace",
      };
    },
    record: async () => { calls.record++; },
  });
  return { routes, calls };
}

const metaContent = (html: string, key: string) =>
  html.match(new RegExp(`<meta (?:property|name)="${key}" content="([^"]*)">`))?.[1];

test("a link-preview bot gets the piece's Open Graph page, still counted", async () => {
  const { routes, calls } = await shareRoutes();
  const res = await routes.request(SHARE, { headers: { "user-agent": IMESSAGE } });
  assert.equal(res.status, 200);
  assert.match(res.headers.get("content-type") ?? "", /text\/html/);
  assert.equal(res.headers.get("cache-control"), "no-store");
  const html = await res.text();
  assert.equal(metaContent(html, "og:title"), "Tchaikovsky: Symphony No. 6 in B minor, “Pathétique”");
  assert.equal(metaContent(html, "og:description"), "A symphony that ends not in triumph but in silence. A listening guide on DailyClassical.");
  assert.equal(metaContent(html, "og:image"), "https://api.dailyclassical.co/images/widget/tchaikovsky-symphony-6.jpg?v=e86db379aa");
  assert.equal(metaContent(html, "og:url"), "https://dailyclassical.co/app?utm_source=app-share&amp;utm_medium=piece&amp;utm_content=tchaikovsky-symphony-6");
  assert.equal(metaContent(html, "twitter:card"), "summary_large_image");
  assert.equal(metaContent(html, "og:locale"), "en_US");
  // Anything that renders the page still lands on the App Store, with the share campaign token.
  const store = "https://apps.apple.com/app/apple-store/id6820556910?pt=129257819&amp;ct=app-share-piece&amp;mt=8";
  assert.ok(html.includes(`<meta http-equiv="refresh" content="0; url=${store}">`));
  assert.ok(html.includes(`<a href="${store}">`));
  assert.deepEqual(calls.preview, ["tchaikovsky-symphony-6:en"]);
  assert.equal(calls.record, 1);
});

test("the preview follows the request's language (Accept-Language, ?locale)", async () => {
  const { routes, calls } = await shareRoutes();
  let html = await (await routes.request(SHARE, { headers: { "user-agent": "WhatsApp/2.23.20.0", "accept-language": "tr-TR,tr;q=0.9" } })).text();
  assert.equal(metaContent(html, "og:title"), "Çaykovski: Si minör 6. Senfoni, “Patetik”");
  assert.equal(metaContent(html, "og:description"), "Zaferle değil, sessizlikle biten bir senfoni. DailyClassical’da bir dinleme rehberi.");
  assert.equal(metaContent(html, "og:locale"), "tr_TR");
  assert.match(html, /<html lang="tr">/);
  html = await (await routes.request(`${SHARE}&locale=tr`, { headers: { "user-agent": IMESSAGE } })).text();
  assert.equal(metaContent(html, "og:title"), "Çaykovski: Si minör 6. Senfoni, “Patetik”");
  assert.deepEqual(calls.preview, ["tchaikovsky-symphony-6:tr", "tchaikovsky-symphony-6:tr"]);
});

test("people are redirected exactly as before, even on a share link", async () => {
  const { routes, calls } = await shareRoutes();
  for (const ua of [SAFARI_IPHONE, IG_IPHONE]) {
    const res = await routes.request(SHARE.replace("medium=piece", "medium=moment"), { headers: { "user-agent": ua } });
    assert.equal(res.status, 302);
    assert.equal(res.headers.get("location"), "https://apps.apple.com/app/apple-store/id6820556910?pt=129257819&ct=app-share-moment&mt=8");
    assert.equal(res.headers.get("cache-control"), "no-store");
  }
  assert.deepEqual(calls.preview, []);
  assert.equal(calls.record, 2);
});

test("bots get the redirect for links without a known piece", async () => {
  const { routes, calls } = await shareRoutes();
  for (const path of ["/app?utm_source=instagram&utm_medium=profile", "/app?utm_source=app-share&utm_medium=piece&utm_content=no-such-piece"]) {
    const res = await routes.request(path, { headers: { "user-agent": IMESSAGE } });
    assert.equal(res.status, 302);
    assert.match(res.headers.get("location") ?? "", /^https:\/\/apps\.apple\.com\//);
  }
  assert.deepEqual(calls.preview, ["no-such-piece:en"]);
  // A failing lookup (database down) falls back to the redirect too.
  const { appLinkRoutes } = await import("../src/routes/app-link.js");
  const failing = appLinkRoutes({ preview: async () => { throw new Error("down"); }, record: async () => {} });
  const res = await failing.request(SHARE, { headers: { "user-agent": IMESSAGE } });
  assert.equal(res.status, 302);
});

test("preview texts are escaped", async () => {
  const { previewPage } = await import("../src/lib/app-link.js");
  const html = previewPage(
    { locale: "en", composerShortName: "A<b>", title: "\"Quoted\" & 'single'", hook: "<script>x</script>", imageUrl: null, imageAlt: null },
    "https://dailyclassical.co/app", "https://apps.apple.com/x?a=1&b=2");
  assert.ok(!html.includes("<script>"));
  assert.ok(!html.includes("<b>"));
  assert.ok(html.includes("A&lt;b&gt;: &quot;Quoted&quot; &amp; &#39;single&#39;"));
  assert.ok(!html.includes("og:image"));  // no painting, no image tags
});
