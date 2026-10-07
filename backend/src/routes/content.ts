import { Hono } from "hono";
import { HTTPException } from "hono/http-exception";
import { z } from "zod";
import { getPiece, listComposers, listGlossary, listPublishedPieces, pieceIdForDay, scheduleUntil, widgetDays } from "../content/repository.js";
import { db } from "../db/client.js";
import { requestLocale } from "../lib/locale.js";
import { memo } from "../lib/memo.js";

/** Content queries are cached in-process for a minute (lib/memo.ts). */
const TTL = 60_000;

export const content = new Hono();

// Content changes rarely; let clients and any CDN cache briefly.
content.use("*", async (c, next) => {
  await next();
  if (c.res.status === 200) c.header("Cache-Control", "public, max-age=300, stale-while-revalidate=86400");
  c.header("Vary", "Accept-Language");
});

const day = z.string().regex(/^\d{4}-\d{2}-\d{2}$/);

/** The reader's calendar day from a YYYY-MM-DD query value, else the server's UTC date. */
const clientDay = (value: string | undefined) => {
  const parsed = day.safeParse(value);
  return parsed.success ? parsed.data : new Date().toISOString().slice(0, 10);
};

/** The client sends its own calendar date so "today" follows the user's time zone. */
content.get("/today", async (c) => {
  const d = clientDay(c.req.query("date"));
  const locale = requestLocale(c);
  const id = await memo(`day:${d}`, TTL, () => pieceIdForDay(db, d));
  const piece = id ? await memo(`piece:${id}:${locale}`, TTL, () => getPiece(db, id, locale)) : null;
  if (!piece) throw new HTTPException(404, { message: "no_piece" });
  return c.json({ date: d, piece });
});

/** Published pieces only (scheduled on or before `date`), newest first, each with its `publishDate`. */
content.get("/pieces", async (c) => {
  const locale = requestLocale(c), d = clientDay(c.req.query("date"));
  return c.json({ pieces: await memo(`published:${d}:${locale}`, TTL, () => listPublishedPieces(db, locale, d)) });
});

/** Past days up to and including `until`, oldest first: [{ day, pieceId }]. Today pages back through these. */
content.get("/schedule", async (c) => {
  const until = clientDay(c.req.query("until"));
  return c.json({ days: await memo(`schedule:${until}`, TTL, () => scheduleUntil(db, until)) });
});

/**
 * Home Screen widget feed: today (`date`) and the next `days - 1` days (default 4, at most 7), so the
 * widget can show pieces published after the app shipped and roll over at midnight on its own.
 */
content.get("/widget", async (c) => {
  const count = Math.min(7, Math.max(1, Number(c.req.query("days")) || 4));
  const locale = requestLocale(c), d = clientDay(c.req.query("date"));
  return c.json({ days: await memo(`widget:${d}:${count}:${locale}`, TTL, () => widgetDays(db, locale, d, count)) });
});

content.get("/pieces/:id", async (c) => {
  const id = c.req.param("id"), locale = requestLocale(c);
  const piece = await memo(`piece:${id}:${locale}`, TTL, () => getPiece(db, id, locale));
  if (!piece) throw new HTTPException(404, { message: "not_found" });
  return c.json(piece);
});

content.get("/glossary", async (c) => {
  const locale = requestLocale(c);
  return c.json({ terms: await memo(`glossary:${locale}`, TTL, () => listGlossary(db, locale)) });
});

content.get("/composers", async (c) => {
  const locale = requestLocale(c);
  return c.json({ composers: await memo(`composers:${locale}`, TTL, () => listComposers(db, locale)) });
});
