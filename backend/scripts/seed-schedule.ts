import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import { lt, sql as raw } from "drizzle-orm";
import { drizzle } from "drizzle-orm/postgres-js";
import postgres from "postgres";
import { expandSchedule, loadSchedule } from "../src/content/schedule.js";
import { dailySchedule } from "../src/db/schema.js";

/**
 * content/schedule.yaml → daily_schedule (idempotent upsert). Days before `start` are deleted:
 * they are not part of the plan (the review build's test schedule ran from 24 Sep 2026), and a
 * row left there would keep its piece published and its day in Today's back-swipe.
 */
const url = process.env.DATABASE_URL_UNPOOLED ?? process.env.DATABASE_URL;
if (!url) throw new Error("DATABASE_URL is not set");
const sql = postgres(url, { max: 1, ssl: "require", onnotice: () => {} });
const db = drizzle(sql);
const rows = expandSchedule(loadSchedule(join(dirname(fileURLToPath(import.meta.url)), "../../content/schedule.yaml")));
const removed = await db.delete(dailySchedule).where(lt(dailySchedule.day, rows[0]!.day)).returning({ day: dailySchedule.day });
if (removed.length > 0) console.log(`✓ removed ${removed.length} days before ${rows[0]!.day}`);
for (let i = 0; i < rows.length; i += 100) {
  await db.insert(dailySchedule).values(rows.slice(i, i + 100))
    .onConflictDoUpdate({ target: dailySchedule.day, set: { pieceId: raw`excluded.piece_id` } });
}
console.log(`✓ scheduled ${rows.length} days from ${rows[0]!.day} (${rows[0]!.pieceId})`);
await sql.end();
