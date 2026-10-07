import { execFileSync } from "node:child_process";
import { copyFileSync, existsSync, mkdirSync, readdirSync, rmSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

/**
 * Widget-only artwork: one JPEG per painting, long side ≤ 1100 px (the large widget is 364 pt wide
 * at 3×). JPEG on purpose: ImageIO can decode it at reduced size, which keeps the widget extension
 * well inside its ~30 MB memory limit on device (a full HEIC hero decode peaks near 18 MB).
 * Written to ios/DailyClassicalWidget/Artwork/<id>.jpg (bundled), so the widget doesn't bundle the app's
 * 11 MB Artwork folder a second time, and to backend/public/images/widget/<id>.jpg (served). Runs after optimize-images (`npm run images`).
 */
const root = join(dirname(fileURLToPath(import.meta.url)), "../..");
const heroes = join(root, "ios/DailyClassical/Resources/Artwork/paintings");
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
  const target = join(out, `${id}.jpg`);
  execFileSync("sips", ["-Z", "1100", "-s", "format", "jpeg", "-s", "formatOptions", "82", join(heroes, file), "--out", target], { stdio: "ignore" });
  if (!existsSync(target)) throw new Error(`sips failed for ${id}`);
  copyFileSync(target, join(served, `${id}.jpg`));
  count++;
}
const bytes = readdirSync(out).reduce((n, f) => n + Number(execFileSync("stat", ["-f%z", join(out, f)]).toString()), 0);
console.log(`✓ widget artwork: ${count} paintings, ${(bytes / 1048576).toFixed(2)} MB`);
