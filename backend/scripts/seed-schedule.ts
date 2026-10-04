import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import { sql as raw } from "drizzle-orm";
import { drizzle } from "drizzle-orm/postgres-js";
import postgres from "postgres";
import { expandSchedule, loadSchedule } from "../src/content/schedule.js";
import { dailySchedule } from "../src/db/schema.js";

/** content/schedule.yaml → daily_schedule (idempotent upsert). */
const url = process.env.DATABASE_URL_UNPOOLED ?? process.env.DATABASE_URL;
if (!url) throw new Error("DATABASE_URL is not set");
const sql = postgres(url, { max: 1, ssl: "require", onnotice: () => {} });
const db = drizzle(sql);
const rows = expandSchedule(loadSchedule(join(dirname(fileURLToPath(import.meta.url)), "../../content/schedule.yaml")));
for (let i = 0; i < rows.length; i += 100) {
  await db.insert(dailySchedule).values(rows.slice(i, i + 100))
    .onConflictDoUpdate({ target: dailySchedule.day, set: { pieceId: raw`excluded.piece_id` } });
}
console.log(`✓ scheduled ${rows.length} days from ${rows[0]!.day} (${rows[0]!.pieceId})`);
await sql.end();
