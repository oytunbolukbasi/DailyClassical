import assert from "node:assert/strict";
import { test } from "node:test";
import { readPostback } from "../src/lib/ad-postback.js";

test("an SKAdNetwork 4 install postback", () => {
  const p = readPostback("skadnetwork", {
    version: "4.0", "ad-network-id": "v9wttpbfk9.skadnetwork", "source-identifier": "5239", "app-id": 6820556910,
    "transaction-id": "x", redownload: false, "conversion-value": 20, "postback-sequence-index": 0, "did-win": true,
  });
  assert.deepEqual(p, { adNetworkId: "v9wttpbfk9.skadnetwork", sourceIdentifier: "5239", conversionType: "download",
    fineValue: 20, coarseValue: null, postbackIndex: 0 });
});

test("an older postback names the campaign campaign-id; a later window has only a coarse value", () => {
  const p = readPostback("skadnetwork", { "ad-network-id": "n38lu8286q.skadnetwork", "campaign-id": 42, redownload: true,
    "coarse-conversion-value": "high", "postback-sequence-index": 1 });
  assert.equal(p?.sourceIdentifier, "42");
  assert.equal(p?.conversionType, "redownload");
  assert.equal(p?.fineValue, null);
  assert.equal(p?.coarseValue, "high");
  assert.equal(p?.postbackIndex, 1);
});

test("an AdAttributionKit postback is read from its JWS payload", () => {
  const payload = Buffer.from(JSON.stringify({ "ad-network-id": "v9wttpbfk9.skadnetwork", "source-identifier": "1234",
    "conversion-type": "download", "conversion-value": 40, "postback-sequence-index": 0 })).toString("base64url");
  const p = readPostback("adattributionkit", { "jws-string": `eyJhbGciOiJFUzI1NiJ9.${payload}.sig` });
  assert.equal(p?.sourceIdentifier, "1234");
  assert.equal(p?.fineValue, 40);
  assert.equal(readPostback("adattributionkit", { "jws-string": "not-a-jws" }), null);
});
