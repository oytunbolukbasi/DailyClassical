import { Hono } from "hono";
import { env } from "../env.js";

/**
 * Remote app configuration, read by the app at launch. Content itself needs no app update; this
 * only covers the rare case where a server change needs a newer build (see env.ts).
 */
export const config = new Hono();

config.get("/config", (c) => {
  c.header("Cache-Control", "public, max-age=300");
  return c.json({
    minSupportedVersion: env.MIN_APP_VERSION ?? null,
    latestVersion: env.LATEST_APP_VERSION ?? null,
    appStoreUrl: env.APP_STORE_URL ?? null,
  });
});
