import { Hono } from "hono";
import { HTTPException } from "hono/http-exception";
import { z } from "zod";
import { getPiece, listComposers, listGlossary, listPieces, pieceIdForDay } from "../content/repository.js";
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

/** The client sends its own calendar date so "today" follows the user's time zone. */
content.get("/today", async (c) => {
  const date = day.safeParse(c.req.query("date"));
  const d = date.success ? date.data : new Date().toISOString().slice(0, 10);
  const id = await pieceIdForDay(db, d);
  const piece = id ? await getPiece(db, id, requestLocale(c)) : null;
  if (!piece) throw new HTTPException(404, { message: "no_piece" });
  return c.json({ date: d, piece });
});

content.get("/pieces", async (c) => c.json({ pieces: await listPieces(db, requestLocale(c)) }));

content.get("/pieces/:id", async (c) => {
  const piece = await getPiece(db, c.req.param("id"), requestLocale(c));
  if (!piece) throw new HTTPException(404, { message: "not_found" });
  return c.json(piece);
});

content.get("/glossary", async (c) => c.json({ terms: await listGlossary(db, requestLocale(c)) }));

content.get("/composers", async (c) => c.json({ composers: await listComposers(db, requestLocale(c)) }));
