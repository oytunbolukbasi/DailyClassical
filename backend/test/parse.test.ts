import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { test } from "node:test";
import { normalizeRich, parseContent, parseStopTime, validateContent } from "../src/content/parse.js";

test("stop time variants", () => {
  assert.deepEqual(parseStopTime("≈ 4:30"), { startSec: 270, endSec: null, approximate: true, label: null });
  assert.deepEqual(parseStopTime("≈ 9:30–10:30"), { startSec: 570, endSec: 630, approximate: true, label: null });
  assert.deepEqual(parseStopTime("≈ 12:30 and again shortly after"), { startSec: 750, endSec: null, approximate: true, label: "and again shortly after" });
  assert.deepEqual(parseStopTime("Mid-development"), { startSec: null, endSec: null, approximate: false, label: "Mid-development" });
});

test("glossary markup normalises to id|surface", () => {
  assert.equal(normalizeRich("in [[sonata form]]"), "in [[sonata-form|sonata form]]");
  assert.equal(normalizeRich("[[idée fixe|idée fixe]]"), "[[idee-fixe|idée fixe]]");
  assert.equal(normalizeRich("[[development|gelişme bölümü]]nde"), "[[development|gelişme bölümü]]nde");
});

test("English launch content parses cleanly", () => {
  const md = readFileSync(new URL("../../content/en/launch-content.md", import.meta.url), "utf8");
  const c = parseContent(md, "en");
  assert.equal(c.pieces.length, 10);
  assert.deepEqual(validateContent(c), []);
  const tchaikovsky = c.pieces.find((p) => p.meta.id === "tchaikovsky-symphony-6")!;
  assert.equal(tchaikovsky.document.movements[0]!.stops.length, 11);
  assert.equal(tchaikovsky.document.movements[0]!.durationSec, 19 * 60 + 42);
});

test("Turkish launch content parses cleanly", () => {
  const md = readFileSync(new URL("../../content/tr/launch-content.tr.md", import.meta.url), "utf8");
  const c = parseContent(md, "tr");
  assert.equal(c.pieces.length, 10);
  assert.equal(c.glossary.length, 34);
  assert.deepEqual(validateContent(c), []);
  const t = c.pieces.find((p) => p.meta.id === "tchaikovsky-symphony-6")!;
  assert.equal(t.meta.composerDisplay, "Pyotr İlyiç Çaykovski");
  assert.equal(t.document.movements[0]!.stops.length, 11);
  assert.ok(t.document.bigPicture.inOneLine);
});

test("typographic quotes", async () => {
  const { smartQuotes } = await import("../src/content/parse.js");
  assert.equal(smartQuotes(`Symphony No. 6, "Pathétique"`), "Symphony No. 6, “Pathétique”");
  assert.equal(smartQuotes(`Viyana'da "O Freunde"`), "Viyana’da “O Freunde”");
});
