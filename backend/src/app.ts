import { fileURLToPath } from "node:url";
import { serveStatic } from "@hono/node-server/serve-static";
import { Hono } from "hono";
import { HTTPException } from "hono/http-exception";
import { logger } from "hono/logger";
import { secureHeaders } from "hono/secure-headers";
import { sql } from "./db/client.js";
import { account } from "./routes/account.js";
import { config } from "./routes/config.js";
import { content } from "./routes/content.js";
import { resetPage } from "./routes/reset-page.js";

export const app = new Hono();

app.use("*", logger(), secureHeaders());

app.get("/health", async (c) => {
  await sql`select 1`;
  return c.json({ ok: true });
});

// Optimized painting/portrait HEICs (scripts/optimize-images.ts). URLs carry ?v=<hash>, so they never change.
app.use("/images/*", async (c, next) => {
  await next();
  if ((c.res.status === 200 || c.res.status === 206) && /\.(heic|jpg)$/.test(c.req.path)) {
    c.res.headers.set("Cache-Control", "public, max-age=31536000, immutable");
    if (c.req.path.endsWith(".heic")) c.res.headers.set("Content-Type", "image/heic");  // not in hono's mime table
  }
}, serveStatic({ root: fileURLToPath(new URL("../public", import.meta.url)) }));

app.route("/v1", config);
app.route("/v1", content);
app.route("/v1", account);
// Target of the password reset email (no website yet); outside /v1 because it is a web page.
app.route("/", resetPage);

app.notFound((c) => c.json({ error: "not_found" }, 404));
app.onError((err, c) => {
  if (err instanceof HTTPException) return c.json({ error: err.message }, err.status);
  console.error(err);
  return c.json({ error: "internal" }, 500);
});
