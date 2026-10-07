import { mkdirSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import { parseContent, validateContent } from "../src/content/parse.js";
import { readLocaleMarkdown } from "../src/content/sources.js";

/**
 * content/<locale>/glossary.md + content/<locale>/pieces/*.md  →  content/build/<locale>.json
 * (consumed by db:seed and fixtures). Format: content/CONTENT_GUIDE.md.
 */
const root = join(dirname(fileURLToPath(import.meta.url)), "../../content");

mkdirSync(join(root, "build"), { recursive: true });
let failed = false;
for (const locale of ["en", "tr"]) {
  const markdown = readLocaleMarkdown(root, locale);
  if (markdown === null) {
    console.warn(`· ${locale}: ${locale}/pieces not found, skipped`);
    continue;
  }
  const parsed = parseContent(markdown, locale);
  const problems = validateContent(parsed);
  writeFileSync(join(root, "build", `${locale}.json`), JSON.stringify(parsed, null, 2) + "\n");
  const stops = parsed.pieces.reduce((n, p) => n + p.document.movements.reduce((k, m) => k + m.stops.length, 0), 0);
  console.log(`✓ ${locale}: ${parsed.pieces.length} pieces, ${stops} stops, ${parsed.glossary.length} glossary terms`);
  for (const p of problems) console.warn(`  ! ${p}`);
  failed ||= problems.length > 0;
}
process.exit(failed ? 1 : 0);
