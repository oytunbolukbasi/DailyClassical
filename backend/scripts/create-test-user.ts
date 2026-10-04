import { randomBytes } from "node:crypto";
import { appendFileSync, existsSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import { eq } from "drizzle-orm";
import { drizzle } from "drizzle-orm/postgres-js";
import postgres from "postgres";
import { users } from "../src/db/schema.js";
import { hashPassword } from "../src/lib/auth.js";

/**
 * Creates (or resets) a verified test account with complimentary Premium.
 *   npm run test-user -- premium-test@dailyclassical.co [--free]
 * The generated password goes to backend/test-accounts.local.md (git-ignored), never stdout.
 */
const email = (process.argv[2] ?? "premium-test@dailyclassical.co").toLowerCase();
const premium = !process.argv.includes("--free");
const password = randomBytes(9).toString("base64url");

const url = process.env.DATABASE_URL_UNPOOLED ?? process.env.DATABASE_URL;
if (!url) throw new Error("DATABASE_URL is not set");
const sql = postgres(url, { max: 1, ssl: "require", onnotice: () => {} });
const db = drizzle(sql);

const values = {
  passwordHash: await hashPassword(password),
  emailVerifiedAt: new Date(),
  compPremiumUntil: premium ? new Date("2099-12-31T00:00:00Z") : null,
  passwordChangedAt: new Date(),
};
const [existing] = await db.select({ id: users.id }).from(users).where(eq(users.email, email));
if (existing) await db.update(users).set(values).where(eq(users.id, existing.id));
else await db.insert(users).values({ email, locale: "tr", ...values });

const file = join(dirname(fileURLToPath(import.meta.url)), "../test-accounts.local.md");
if (!existsSync(file)) writeFileSync(file, "# Test accounts (local only, git-ignored)\n\n| Email | Password | Premium | Created |\n| --- | --- | --- | --- |\n");
appendFileSync(file, `| ${email} | ${password} | ${premium ? "yes (comp, until 2099)" : "no"} | ${new Date().toISOString()} |\n`);
console.log(`✓ ${existing ? "reset" : "created"} ${email} (${premium ? "Premium" : "free"}); password written to test-accounts.local.md`);
await sql.end();
