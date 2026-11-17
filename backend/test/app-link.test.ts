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
