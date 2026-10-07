import assert from "node:assert/strict";
import { fileURLToPath } from "node:url";
import { test } from "node:test";
import { normalizeRich, parseContent, parseStopTime, validateContent } from "../src/content/parse.js";
import { readLocaleMarkdown } from "../src/content/sources.js";

const contentRoot = fileURLToPath(new URL("../../content", import.meta.url));

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

test("English content parses cleanly", () => {
  const c = parseContent(readLocaleMarkdown(contentRoot, "en")!, "en");
  assert.ok(c.pieces.length >= 10);
  assert.ok(c.pieces.every((p) => p.meta.form));
  assert.deepEqual(validateContent(c), []);
  const tchaikovsky = c.pieces.find((p) => p.meta.id === "tchaikovsky-symphony-6")!;
  assert.equal(tchaikovsky.document.movements[0]!.stops.length, 11);
  assert.equal(tchaikovsky.document.movements[0]!.durationSec, 19 * 60 + 42);
});

test("Turkish content parses cleanly", () => {
  const c = parseContent(readLocaleMarkdown(contentRoot, "tr")!, "tr");
  const en = parseContent(readLocaleMarkdown(contentRoot, "en")!, "en");
  assert.equal(c.pieces.length, en.pieces.length);
  assert.equal(c.glossary.length, en.glossary.length);
  assert.deepEqual(validateContent(c), []);
  const t = c.pieces.find((p) => p.meta.id === "tchaikovsky-symphony-6")!;
  assert.equal(t.meta.composerDisplay, "Pyotr İlyiç Çaykovski");
  assert.equal(t.document.movements[0]!.stops.length, 11);
  assert.ok(t.document.bigPicture.inOneLine);
});

test("a solo recording needs no conductor or orchestra", () => {
  const md = [
    "## X – Sonata", "", "```yaml", "id: x-piano-sonata-1", "composer: X", "form: piano-sonata", "title: Sonata",
    "year: 1800", "duration_min: 10", "movement_count: 1", "hook: H.",
    "reference_recording:", "  soloists:", "    - { name: A Pianist, role: piano }",
    "painting: { artist: P, title: T, year: 1800, collection: C }", "```", "",
    "### I. Allegro", "", "**Listening stops**", "", "| Time | What you hear | What is happening |", "| --- | --- | --- |", "| ≈ 0:00 | a | b |",
  ].join("\n");
  const c = parseContent(md, "en");
  assert.equal(c.pieces[0]!.meta.form, "piano-sonata");
  assert.equal(c.pieces[0]!.meta.referenceRecording.conductor, null);
  assert.deepEqual(validateContent(c), []);
  assert.throws(() => parseContent(md.replace("form: piano-sonata", "form: opera"), "en"), /form "opera"/);
});

test("typographic quotes", async () => {
  const { smartQuotes } = await import("../src/content/parse.js");
  assert.equal(smartQuotes(`Symphony No. 6, "Pathétique"`), "Symphony No. 6, “Pathétique”");
  assert.equal(smartQuotes(`Viyana'da "O Freunde"`), "Viyana’da “O Freunde”");
});

test("every glossary term has a one-line short in both languages", () => {
  for (const locale of ["en", "tr"]) {
    const c = parseContent(readLocaleMarkdown(contentRoot, locale)!, locale);
    assert.ok(c.glossary.length >= 40);
    for (const g of c.glossary) {
      assert.ok(g.short, `${locale}/${g.id}: no short`);
      assert.ok(g.short.length <= 64, `${locale}/${g.id}: short is ${g.short.length} characters`);
      assert.ok(g.short.length < g.definition.length, `${locale}/${g.id}: short is not shorter than the definition`);
    }
  }
  const tr = parseContent(readLocaleMarkdown(contentRoot, "tr")!, "tr");
  const coda = tr.glossary.find((g) => g.id === "coda")!;
  assert.deepEqual([coda.term, coda.short], ["Koda", "Bir bölümü toparlayan kapanış kısmı"]);
});

test("glossary tables without a short column still parse", () => {
  const en = parseContent(["## Glossary", "", "| Term | Definition |", "| --- | --- |", "| Coda | A closing section. |"].join("\n"), "en");
  assert.deepEqual(en.glossary, [{ id: "coda", key: "Coda", term: "Coda", short: null, definition: "A closing section." }]);
  const tr = parseContent(["## Sözlük", "", "| Key | Terim | Tanım |", "| --- | --- | --- |", "| Coda | Koda | Kapanış kısmı. |"].join("\n"), "tr");
  assert.deepEqual(tr.glossary, [{ id: "coda", key: "Coda", term: "Koda", short: null, definition: "Kapanış kısmı." }]);
  assert.deepEqual(validateContent(tr), [`tr/glossary: "Coda" has no short line`]);
  const current = parseContent(["## Sözlük", "", "| Key | Terim | Kısa | Tanım |", "| --- | --- | --- | --- |", "| Coda | Koda | Kapanış | Kapanış kısmı. |"].join("\n"), "tr");
  assert.equal(current.glossary[0]!.short, "Kapanış");
  assert.equal(current.glossary[0]!.definition, "Kapanış kısmı.");
});
