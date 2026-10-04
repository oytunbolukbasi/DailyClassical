import { mkdirSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import { expandSchedule, loadSchedule } from "../src/content/schedule.js";

/** Writes Fixtures/<locale>/schedule.json so the bundled app picks the same Today as the API. */
const here = dirname(fileURLToPath(import.meta.url));
const schedule = loadSchedule(join(here, "../../content/schedule.yaml"));
const days = Object.fromEntries(expandSchedule(schedule).map((r) => [r.day, r.pieceId]));
for (const locale of ["en", "tr"]) {
  const dir = join(here, "../../ios/DailyClassical/Resources/Fixtures", locale);
  mkdirSync(dir, { recursive: true });
  writeFileSync(join(dir, "schedule.json"), JSON.stringify({ start: schedule.start, order: schedule.order, days }));
}
console.log(`✓ fixtures schedule: ${Object.keys(days).length} days`);
