import assert from "node:assert/strict";
import { test } from "node:test";
import type { CampaignRow } from "../src/lib/push-sender.js";

process.env.JWT_SECRET ??= "test-secret-test-secret-test-secret-123";
process.env.DATABASE_URL ??= "postgres://user:pass@localhost:5432/none";
const { payloadOf } = await import("../src/lib/apns.js");
const { messageFor } = await import("../src/lib/push-sender.js");
const { versionAtLeast } = await import("../src/routes/push.js");

const campaign: CampaignRow = {
  id: "c1", title_en: "Title", body_en: "Text", title_tr: "Başlık", body_tr: "Metin",
  link: "dailyclassical://premium", image_url: null, audience: "free", test_only: false,
};

test("each device gets its language; other languages read English", () => {
  assert.equal(messageFor(campaign, "tr")?.title, "Başlık");
  assert.equal(messageFor(campaign, "en")?.title, "Title");
  assert.equal(messageFor(campaign, "de")?.title, "Title");
});

test("a language left empty is not sent", () => {
  assert.equal(messageFor({ ...campaign, title_en: null, body_en: null }, "en"), null);
  assert.equal(messageFor({ ...campaign, body_tr: "  " }, "tr"), null);
});

test("payload: link and campaign id beside aps; an image turns on the service extension", () => {
  const plain = JSON.parse(payloadOf(messageFor(campaign, "tr")!));
  assert.deepEqual(plain.aps.alert, { title: "Başlık", body: "Metin" });
  assert.equal(plain.aps["mutable-content"], undefined);
  assert.equal(plain.link, "dailyclassical://premium");
  assert.equal(plain.cid, "c1");
  const withImage = JSON.parse(payloadOf({ title: "a", body: "b", imageUrl: "https://x/y.jpg" }));
  assert.equal(withImage.aps["mutable-content"], 1);
  assert.equal(withImage.image, "https://x/y.jpg");
});

test("versions compare part by part", () => {
  assert.ok(versionAtLeast("1.4", "1.4"));
  assert.ok(versionAtLeast("1.10", "1.4"));
  assert.ok(versionAtLeast("1.4.1", "1.4"));
  assert.ok(!versionAtLeast("1.3.1", "1.4"));
  assert.ok(versionAtLeast("2", "1.9.9"));
});
