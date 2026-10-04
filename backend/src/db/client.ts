import { drizzle } from "drizzle-orm/postgres-js";
import postgres from "postgres";
import { env } from "../env.js";
import * as schema from "./schema.js";

// Neon: use the pooled connection string (…-pooler…) for the API; prepared statements off for PgBouncer.
export const sql = postgres(env.DATABASE_URL, { max: 10, prepare: false, ssl: "require" });
export const db = drizzle(sql, { schema });
export type DB = typeof db;
