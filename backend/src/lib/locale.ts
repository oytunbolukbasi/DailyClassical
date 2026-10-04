import type { Context } from "hono";
import { locales, type Locale } from "../db/schema.js";

export const DEFAULT_LOCALE: Locale = "en";

/** ?locale=tr wins, then Accept-Language, then English. */
export function requestLocale(c: Context): Locale {
  const q = c.req.query("locale")?.toLowerCase();
  if (q && (locales as readonly string[]).includes(q)) return q as Locale;
  const header = c.req.header("accept-language") ?? "";
  for (const part of header.split(",")) {
    const tag = part.split(";")[0]!.trim().toLowerCase().split("-")[0]!;
    if ((locales as readonly string[]).includes(tag)) return tag as Locale;
  }
  return DEFAULT_LOCALE;
}

/** Pick the row for `locale`, falling back to English. */
export function pick<T extends { locale: string }>(rows: T[], locale: Locale): T | undefined {
  return rows.find((r) => r.locale === locale) ?? rows.find((r) => r.locale === DEFAULT_LOCALE);
}
