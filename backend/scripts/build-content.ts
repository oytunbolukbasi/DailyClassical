import { existsSync, mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import { parseContent, validateContent } from "../src/content/parse.js";

/** content/<locale>/*.md  →  content/build/<locale>.json (consumed by db:seed). */
const root = join(dirname(fileURLToPath(import.meta.url)), "../../content");
const sources: Record<string, string> = {
  en: "en/launch-content.md",
  tr: "tr/launch-content.tr.md",
};

mkdirSync(join(root, "build"), { recursive: true });
let failed = false;
for (const [locale, file] of Object.entries(sources)) {
  const path = join(root, file);
  if (!existsSync(path)) {
    console.warn(`· ${locale}: ${file} not found, skipped`);
    continue;
  }
  const parsed = parseContent(readFileSync(path, "utf8"), locale);
  const problems = validateContent(parsed);
  writeFileSync(join(root, "build", `${locale}.json`), JSON.stringify(parsed, null, 2) + "\n");
  const stops = parsed.pieces.reduce((n, p) => n + p.document.movements.reduce((k, m) => k + m.stops.length, 0), 0);
  console.log(`✓ ${locale}: ${parsed.pieces.length} pieces, ${stops} stops, ${parsed.glossary.length} glossary terms`);
  for (const p of problems) console.warn(`  ! ${p}`);
  failed ||= problems.length > 0;
}
process.exit(failed ? 1 : 0);
