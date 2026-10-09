import assert from "node:assert/strict";
import { test } from "node:test";

test("the landing page follows Accept-Language and links hashed CSS/JS", async () => {
  const { site } = await import("../src/routes/site.js");
  const tr = await site.request("/", { headers: { "Accept-Language": "tr-TR,tr;q=0.9" } });
  assert.equal(tr.status, 200);
  const html = await tr.text();
  assert.match(html, /<html lang="tr">/);
  assert.match(html, /<title>DailyClassical · Her gün bir klasik eser<\/title>/);
  assert.match(html, /\/assets\/site\.css\?v=[a-f0-9]{10}"/);
  assert.match(html, /\/assets\/site\.js\?v=[a-f0-9]{10}"/);
  assert.match(html, /apps\.apple\.com\/app\/id6820556910/);
  assert.match(await (await site.request("/?locale=en")).text(), /<html lang="en">/);
});

test("landing assets are served with a long cache", async () => {
  const { site } = await import("../src/routes/site.js");
  for (const path of ["/assets/site.css", "/assets/img/vernet-640.webp", "/assets/badges/app-store-black-tr-tr.svg", "/assets/fonts/literata-latin.woff2"]) {
    const res = await site.request(path);
    assert.equal(res.status, 200, path);
    assert.match(res.headers.get("cache-control") ?? "", /max-age=2592000/);
  }
});
