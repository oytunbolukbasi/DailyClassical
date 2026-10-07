import { existsSync, readdirSync, readFileSync } from "node:fs";
import { join } from "node:path";

/**
 * The markdown for one locale: content/<locale>/glossary.md followed by every
 * content/<locale>/pieces/*.md (one piece per file, see content/CONTENT_GUIDE.md).
 * Null when the locale has no pieces folder.
 */
export function readLocaleMarkdown(contentRoot: string, locale: string): string | null {
  const piecesDir = join(contentRoot, locale, "pieces");
  if (!existsSync(piecesDir)) return null;
  const files = [
    join(contentRoot, locale, "glossary.md"),
    ...readdirSync(piecesDir).filter((f) => f.endsWith(".md")).sort().map((f) => join(piecesDir, f)),
  ].filter(existsSync);
  return files.map((f) => readFileSync(f, "utf8")).join("\n\n");
}
