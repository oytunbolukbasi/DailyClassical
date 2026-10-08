import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { Hono } from "hono";
import { type Locale, locales } from "../db/schema.js";
import { requestLocale } from "../lib/locale.js";
import { renderMarkdown } from "../lib/markdown.js";

/**
 * GET /, /terms, /privacy and /support (?locale=tr, else Accept-Language): a placeholder home page,
 * the Terms of Use, Privacy Policy and support page, written in backend/legal/<page>.<locale>.md. The app opens them in an
 * in-app browser; App Store Connect links to /privacy (privacy URL) and /support (support URL).
 * Served on dailyclassical.co (and api.dailyclassical.co, which the app still links to).
 */
export const legal = new Hono();

const pages = ["home", "terms", "privacy", "support"] as const;
type Page = (typeof pages)[number];
/** The home page (a placeholder until the website) lives at the root. */
const path = (page: Page) => (page === "home" ? "/" : `/${page}`);

const read = (page: Page, locale: Locale) =>
  readFileSync(fileURLToPath(new URL(`../../legal/${page}.${locale}.md`, import.meta.url)), "utf8");

const other: Record<Locale, { locale: Locale; label: string }> = {
  en: { locale: "tr", label: "Türkçe" },
  tr: { locale: "en", label: "English" },
};

export function renderLegalPage(page: Page, locale: Locale, markdown: string): string {
  const body = renderMarkdown(markdown);
  const heading = markdown.match(/^#\s+(.*)$/m)?.[1];
  const title = page === "home" || !heading ? "DailyClassical" : `${heading} · DailyClassical`;
  const switchTo = other[locale];
  return `<!doctype html>
<html lang="${locale}">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>${title}</title>
<style>
:root{--bg:#F5F2EC;--surface:#FFFFFF;--ink:#1E1B17;--ink2:#5E5852;--ink3:#8A837B;--rule:rgba(30,27,23,.12);--accent:#6B4A2B;color-scheme:light dark}
@media (prefers-color-scheme:dark){:root{--bg:#111010;--surface:#1C1A18;--ink:#F0EBE3;--ink2:#B3ABA1;--ink3:#7D766E;--rule:rgba(240,235,227,.12);--accent:#D4AE84}}
*{box-sizing:border-box}
body{margin:0;background:var(--bg);color:var(--ink);font:16px/1.6 -apple-system,BlinkMacSystemFont,"Segoe UI",Helvetica,Arial,sans-serif;-webkit-text-size-adjust:100%}
main{max-width:640px;margin:0 auto;padding:40px 24px 64px}
.top{display:flex;justify-content:space-between;align-items:baseline;margin:0 0 28px}
.brand{font-size:12px;font-weight:600;letter-spacing:.1em;text-transform:uppercase;color:var(--ink2)}
.top a{font-size:14px}
h1{font:500 32px/1.15 Literata,Georgia,"Times New Roman",serif;letter-spacing:-.01em;margin:0 0 6px}
h1+p{font-size:13px;color:var(--ink3);margin:0 0 28px}
h2{font:500 21px/1.25 Literata,Georgia,"Times New Roman",serif;margin:36px 0 10px;padding-top:24px;border-top:.5px solid var(--rule)}
p,li{color:var(--ink2)}
p{margin:0 0 14px}
ul{margin:0 0 14px;padding-left:20px}
li{margin:0 0 6px}
strong{color:var(--ink);font-weight:600}
a{color:var(--accent);text-decoration-thickness:.5px;text-underline-offset:2px}
</style>
</head>
<body>
<main>
<div class="top"><span class="brand" lang="en">DailyClassical</span><a href="${path(page)}?locale=${switchTo.locale}" hreflang="${switchTo.locale}">${switchTo.label}</a></div>
${body}
</main>
</body>
</html>`;
}

/** Rendered once at startup: the texts only change with a deploy. */
const rendered = Object.fromEntries(
  pages.flatMap((page) => locales.map((locale) => [`${page}.${locale}`, renderLegalPage(page, locale, read(page, locale))])),
);

for (const page of pages) {
  legal.get(path(page), (c) => {
    c.header("Cache-Control", "public, max-age=3600");
    return c.html(rendered[`${page}.${requestLocale(c)}`]!);
  });
}
