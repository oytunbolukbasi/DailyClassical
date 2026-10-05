import { Hono } from "hono";
import { HTTPException } from "hono/http-exception";
import { z } from "zod";
import { getPiece, listComposers, listGlossary, listPublishedPieces, pieceIdForDay, scheduleUntil } from "../content/repository.js";
import { db } from "../db/client.js";
import { requestLocale } from "../lib/locale.js";

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
  const id = await pieceIdForDay(db, d);
  const piece = id ? await getPiece(db, id, requestLocale(c)) : null;
  if (!piece) throw new HTTPException(404, { message: "no_piece" });
  return c.json({ date: d, piece });
});

/** Published pieces only (scheduled on or before `date`), newest first, each with its `publishDate`. */
content.get("/pieces", async (c) =>
  c.json({ pieces: await listPublishedPieces(db, requestLocale(c), clientDay(c.req.query("date"))) }));

/** Past days up to and including `until`, oldest first: [{ day, pieceId }]. Today pages back through these. */
content.get("/schedule", async (c) => c.json({ days: await scheduleUntil(db, clientDay(c.req.query("until"))) }));

content.get("/pieces/:id", async (c) => {
  const piece = await getPiece(db, c.req.param("id"), requestLocale(c));
  if (!piece) throw new HTTPException(404, { message: "not_found" });
  return c.json(piece);
});

content.get("/glossary", async (c) => c.json({ terms: await listGlossary(db, requestLocale(c)) }));

content.get("/composers", async (c) => c.json({ composers: await listComposers(db, requestLocale(c)) }));
