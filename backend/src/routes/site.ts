import { createHash } from "node:crypto";
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { serveStatic } from "@hono/node-server/serve-static";
import { Hono } from "hono";
import { requestLocale } from "../lib/locale.js";

/**
 * dailyclassical.co: the landing page (backend/site, from Claude Design "DailyClassical Landing").
 * GET / sets <html lang> from ?locale or Accept-Language; a language picked on the page
 * (localStorage) wins on the client. Assets under /assets/*.
 */
export const site = new Hono();

const root = fileURLToPath(new URL("../../site", import.meta.url));
// CSS and JS URLs carry a content hash, so a deploy never meets a stale cached copy.
const versioned = (html: string, file: string) => {
  const hash = createHash("sha256").update(readFileSync(`${root}/assets/${file}`)).digest("hex").slice(0, 10);
  return html.replace(`/assets/${file}"`, `/assets/${file}?v=${hash}"`);
};
const page = ["site.css", "site.js"].reduce(versioned, readFileSync(`${root}/index.html`, "utf8"));
const rendered = { en: page, tr: page.replace('<html lang="en">', '<html lang="tr">') };

site.get("/", (c) => {
  c.header("Cache-Control", "public, max-age=300");
  c.header("Vary", "Accept-Language");
  return c.html(rendered[requestLocale(c)]);
});

site.use("/assets/*", async (c, next) => {
  await next();
  if (c.res.status === 200) {
    // Paintings, fonts and badges never change in place; CSS/JS are requested with ?v=<hash>.
    c.res.headers.set("Cache-Control", "public, max-age=2592000");
  }
}, serveStatic({ root: fileURLToPath(new URL("../../site", import.meta.url)) }));
