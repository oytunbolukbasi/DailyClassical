import { readFileSync } from "node:fs";
import { join } from "node:path";
import YAML from "yaml";

/**
 * Pieces in content/schedule.yaml's order: the only paintings whose hero image is bundled in the app
 * and widget (optimize-images.ts, widget-images.ts). Every other piece's images are served from the
 * API (backend/public/images, Railway) and cached on the device, so the app stays small however
 * large the catalogue grows. After adding pieces to the schedule, re-run `npm run images` (no
 * --only) and `npm run images:widget` before an app build.
 */
export function scheduledPieceIds(repo: string): Set<string> {
  const doc = YAML.parse(readFileSync(join(repo, "content/schedule.yaml"), "utf8")) as { order?: string[] };
  return new Set(doc.order ?? []);
}
