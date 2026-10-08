import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { test } from "node:test";
import { renderMarkdown } from "../src/lib/markdown.js";

test("markdown subset: headings, lists, bold, links; HTML in the source is escaped", () => {
  const html = renderMarkdown("# Title\n\nA **bold** [link](https://example.com) <script>\n\n- one\n- two\n\n## Next");
  assert.match(html, /<h1>Title<\/h1>/);
  assert.match(html, /<strong>bold<\/strong> <a href="https:\/\/example.com">link<\/a> &lt;script&gt;/);
  assert.match(html, /<ul><li>one<\/li><li>two<\/li><\/ul>/);
  assert.match(html, /<h2>Next<\/h2>/);
  assert.doesNotMatch(renderMarkdown("[x](javascript:alert(1))"), /href=/);
  assert.match(renderMarkdown("[t](/terms?locale=en)"), /<a href="\/terms\?locale=en">t<\/a>/);
  assert.doesNotMatch(renderMarkdown("[x](//evil.example)"), /href=/);
});

test("legal pages exist in both languages with the same sections", () => {
  for (const page of ["terms", "privacy", "support"]) {
    const sections = (locale: string) =>
      readFileSync(new URL(`../legal/${page}.${locale}.md`, import.meta.url), "utf8").match(/^## /gm)?.length;
    assert.ok(sections("en")! > 5);
    assert.equal(sections("tr"), sections("en"));
  }
});

test("the legal routes serve both pages in the requested language", async () => {
  const { legal } = await import("../src/routes/legal.js");
  const tr = await legal.request("/privacy?locale=tr");
  assert.equal(tr.status, 200);
  assert.match(await tr.text(), /<h1>Gizlilik Politikası<\/h1>/);
  const en = await legal.request("/terms", { headers: { "Accept-Language": "en-GB" } });
  assert.match(await en.text(), /<h1>Terms of Use<\/h1>/);
  const support = await legal.request("/support?locale=tr");
  assert.match(await support.text(), /<h1>Destek<\/h1>[\s\S]*hello@dailyclassical\.co/);
  const home = await legal.request("/", { headers: { "Accept-Language": "tr-TR" } });
  assert.match(await home.text(), /<title>DailyClassical<\/title>[\s\S]*href="\/\?locale=en"[\s\S]*href="\/support\?locale=tr"/);
});
