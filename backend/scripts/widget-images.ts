import { execFileSync } from "node:child_process";
import { copyFileSync, existsSync, mkdirSync, readdirSync, rmSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import { scheduledPieceIds } from "./scheduled.js";

/**
 * Widget-only artwork: one JPEG per painting, long side ≤ 1100 px (the large widget is 364 pt wide
 * at 3×). JPEG on purpose: ImageIO can decode it at reduced size, which keeps the widget extension
 * well inside its ~30 MB memory limit on device (a full HEIC hero decode peaks near 18 MB).
 * Written to backend/public/images/widget/<id>.jpg for every piece (served; GET /v1/widget and the admin page)
 * and to ios/DailyClassicalWidget/Artwork/<id>.jpg for scheduled pieces only (bundled; scripts/scheduled.ts).
 * Runs after optimize-images (`npm run images`).
 */
const root = join(dirname(fileURLToPath(import.meta.url)), "../..");
const heroes = join(root, "backend/public/images/paintings");  // every piece; the app bundle has scheduled ones only
const scheduled = scheduledPieceIds(root);
const out = join(root, "ios/DailyClassicalWidget/Artwork");
// The same files are served at /images/widget/<id>.jpg (GET /v1/widget), so pieces added after the
// app shipped still reach the widget.
const served = join(root, "backend/public/images/widget");
for (const dir of [out, served]) {
  rmSync(dir, { recursive: true, force: true });
  mkdirSync(dir, { recursive: true });
}

let count = 0;
for (const file of readdirSync(heroes).filter((f) => f.endsWith("-hero.heic"))) {
  const id = file.replace(/-hero\.heic$/, "");
  const target = join(served, `${id}.jpg`);
  execFileSync("sips", ["-Z", "1100", "-s", "format", "jpeg", "-s", "formatOptions", "82", join(heroes, file), "--out", target], { stdio: "ignore" });
  if (!existsSync(target)) throw new Error(`sips failed for ${id}`);
  if (scheduled.has(id)) copyFileSync(target, join(out, `${id}.jpg`));
  count++;
}
const bytes = readdirSync(out).reduce((n, f) => n + Number(execFileSync("stat", ["-f%z", join(out, f)]).toString()), 0);
console.log(`✓ widget artwork: ${count} served, ${readdirSync(out).length} bundled (${(bytes / 1048576).toFixed(2)} MB)`);
