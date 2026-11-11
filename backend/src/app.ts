import { fileURLToPath } from "node:url";
import { serveStatic } from "@hono/node-server/serve-static";
import { Hono } from "hono";
import { HTTPException } from "hono/http-exception";
import { logger } from "hono/logger";
import { secureHeaders } from "hono/secure-headers";
import { sql } from "./db/client.js";
import { appleStatus } from "./lib/apple.js";
import { account } from "./routes/account.js";
import { admin } from "./routes/admin.js";
import { attribution } from "./routes/attribution.js";
import { config } from "./routes/config.js";
import { content } from "./routes/content.js";
import { diagnostics } from "./routes/diagnostics.js";
import { events } from "./routes/events.js";
import { legal } from "./routes/legal.js";
import { resetPage } from "./routes/reset-page.js";
import { site } from "./routes/site.js";

export const app = new Hono();

app.use("*", logger(), secureHeaders());

// The bare domain (dailyclassical.co) points here so Apple can deliver ad attribution copies to
// /.well-known/... (routes/attribution.ts), which it only sends to the registrable domain. Pages
// keep their address on www, as with the registrar's forwarding before.
app.use("*", async (c, next) => {
  const host = (c.req.header("host") ?? "").toLowerCase().split(":")[0];
  if (host === "dailyclassical.co" && (c.req.method === "GET" || c.req.method === "HEAD") && !c.req.path.startsWith("/.well-known/")) {
    const url = new URL(c.req.url);
    return c.redirect(`https://www.dailyclassical.co${url.pathname}${url.search}`, 301);
  }
  await next();
});

app.get("/health", async (c) => {
  await sql`select 1`;
  // Sign in with Apple configuration (lib/apple.ts): status words only, never the key.
  return c.json({ ok: true, appleSignIn: await appleStatus() });
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
app.route("/v1", events);
app.route("/v1", diagnostics);
// Target of the password reset email (no website yet); outside /v1 because it is a web page.
app.route("/", attribution);
app.route("/", resetPage);
app.route("/", legal);
app.route("/", admin);
app.route("/", site);

app.notFound((c) => c.json({ error: "not_found" }, 404));
app.onError((err, c) => {
  if (err instanceof HTTPException) return c.json({ error: err.message }, err.status);
  console.error(err);
  return c.json({ error: "internal" }, 500);
});
