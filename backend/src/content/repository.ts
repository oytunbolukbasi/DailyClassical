import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { and, asc, eq, inArray, lte } from "drizzle-orm";
import type { DB } from "../db/client.js";
import {
  composerLocalizations,
  composers,
  dailySchedule,
  glossaryLocalizations,
  paintingLocalizations,
  paintings,
  pieceLocalizations,
  pieces,
  recordings,
  type ComposerFacts,
  type ComposerPortraitAsset,
  type ComposerPortraitCaption,
  type Locale,
} from "../db/schema.js";
import { DEFAULT_LOCALE, pick } from "../lib/locale.js";
import { publishDates, type ScheduledDay } from "./schedule.js";

const localesFor = (locale: Locale) => [...new Set([locale, DEFAULT_LOCALE])];

/**
 * Attribution of a freely licensed (non-PD) image, from the manifest (content/composers.yaml
 * `credit_line` / `license_url`): `creditLine` is the text the licence requires, shown after the caption.
 */
export function imageCredit(key: string, imageUrl: string | null, locale: string) {
  const e = imageManifest.images[key];
  const ok = e && e.source === imageUrl;
  return {
    creditLine: (ok && (e.credit?.[locale] ?? e.credit?.[DEFAULT_LOCALE])) || null,
    licenseUrl: (ok && e.licenseUrl) || null,
  };
}

/** backend/public/images/manifest.json, written by scripts/optimize-images.ts (`npm run images`). */
export type ImageManifestFile = { path: string; width: number; height: number; bytes: number; hash: string };
export type ImageManifestEntry = {
  source: string; color: string; hero: ImageManifestFile; thumb: ImageManifestFile;
  /** Required attribution per locale and licence deed, for freely licensed (non-PD) images. */
  credit?: Record<string, string>; licenseUrl?: string;
};
export type ImageManifest = { version: 1; images: Record<string, ImageManifestEntry> };

const imageManifest: ImageManifest = (() => {
  try {
    return JSON.parse(readFileSync(fileURLToPath(new URL("../../public/images/manifest.json", import.meta.url)), "utf8"));
  } catch {
    return { version: 1, images: {} };
  }
})();
/** Our optimized copies: served by this API at /images (or a CDN via ASSETS_BASE_URL); `?v=` busts the immutable cache. */
const imagesBase = (process.env.ASSETS_BASE_URL ?? `${process.env.PUBLIC_API_URL ?? "https://api.dailyclassical.co"}/images`).replace(/\/$/, "");
const imageFileUrl = (f: ImageManifestFile) => `${imagesBase}/${f.path}?v=${f.hash}`;

/**
 * Image fields of a painting (`paintings/<pieceId>`) or portrait (`composers/<composerId>`):
 * hero + thumb URLs, the hero's pixel size and an average colour for the placeholder. Falls back to
 * the stored original (Commons) URL and size when the image has not been optimized yet.
 */
export function imageFields(key: string, fallback: { imageUrl: string | null; width: number | null; height: number | null }) {
  const e = imageManifest.images[key];
  if (!e || e.source !== fallback.imageUrl) {
    return { imageUrl: fallback.imageUrl, thumbUrl: fallback.imageUrl, width: fallback.width, height: fallback.height, placeholderColor: null };
  }
  return { imageUrl: imageFileUrl(e.hero), thumbUrl: imageFileUrl(e.thumb), width: e.hero.width, height: e.hero.height, placeholderColor: e.color };
}

export function spotifyUrl(albumId: string | null) {
  return albumId ? `https://open.spotify.com/album/${albumId}` : null;
}

/** Library rows and Today header: everything except the long-form guide. */
export async function listPieces(db: DB, locale: Locale, ids?: string[]) {
  const ls = localesFor(locale);
  const where = ids ? and(eq(pieces.isPublished, true), inArray(pieces.id, ids)) : eq(pieces.isPublished, true);
  const base = await db.select().from(pieces).where(where).orderBy(asc(pieces.year));
  if (base.length === 0) return [];
  const pieceIds = base.map((p) => p.id);
  const composerIds = [...new Set(base.map((p) => p.composerId))];

  const [pl, cl, pt, ptl] = await Promise.all([
    db.select({
      pieceId: pieceLocalizations.pieceId, locale: pieceLocalizations.locale, title: pieceLocalizations.title,
      keyLabel: pieceLocalizations.keyLabel, hook: pieceLocalizations.hook,
    }).from(pieceLocalizations).where(and(inArray(pieceLocalizations.pieceId, pieceIds), inArray(pieceLocalizations.locale, ls))),
    db.select().from(composerLocalizations).where(and(inArray(composerLocalizations.composerId, composerIds), inArray(composerLocalizations.locale, ls))),
    db.select().from(paintings).where(inArray(paintings.pieceId, pieceIds)),
    db.select().from(paintingLocalizations).where(inArray(paintingLocalizations.locale, ls)),
  ]);

  return base.flatMap((p) => {
    const l = pick(pl.filter((r) => r.pieceId === p.id), locale);
    const c = pick(cl.filter((r) => r.composerId === p.composerId), locale);
    if (!l || !c) return [];
    const painting = pt.find((r) => r.pieceId === p.id);
    const paintingL = painting && pick(ptl.filter((r) => r.paintingId === painting.id), locale);
    return [{
      id: p.id,
      contentLocale: l.locale,
      composer: { id: p.composerId, name: c.name, shortName: c.shortName },
      title: l.title,
      catalogue: p.catalogue,
      keyLabel: l.keyLabel,
      year: p.year,
      era: p.era,
      durationMin: p.durationMin,
      movementCount: p.movementCount,
      hook: l.hook,
      painting: painting && paintingL ? {
        artist: painting.artist,
        title: paintingL.title,
        yearLabel: paintingL.yearLabel ?? painting.yearLabel,
        collection: paintingL.collection,
        pairingNote: paintingL.pairingNote,
        medium: painting.medium,
        ...imageFields(`paintings/${p.id}`, painting),
        sourceUrl: painting.sourceUrl,
        rightsStatus: painting.rightsStatus,
      } : null,
    }];
  });
}

export type PieceSummary = Awaited<ReturnType<typeof listPieces>>[number];

export async function getPiece(db: DB, id: string, locale: Locale) {
  const [summary] = await listPieces(db, locale, [id]);
  if (!summary) return null;
  const ls = localesFor(locale);
  const [docRows, recs] = await Promise.all([
    db.select({ locale: pieceLocalizations.locale, document: pieceLocalizations.document })
      .from(pieceLocalizations)
      .where(and(eq(pieceLocalizations.pieceId, id), inArray(pieceLocalizations.locale, ls))),
    db.select().from(recordings).where(eq(recordings.pieceId, id)).orderBy(asc(recordings.role), asc(recordings.sortOrder)),
  ]);
  const doc = pick(docRows, locale)!;
  return {
    ...summary,
    document: doc.document,
    recordings: recs.map((r) => ({
      id: r.id,
      role: r.role,
      conductor: r.conductor,
      orchestra: r.orchestra,
      soloists: r.soloists ?? [],
      chorus: r.chorus,
      label: r.label,
      catalogueNumber: r.catalogueNumber,
      venue: r.venue,
      recordedYear: r.recordedYear,
      releaseYear: r.releaseYear,
      spotifyUrl: spotifyUrl(r.spotifyAlbumId),
    })),
  };
}

/** Scheduled piece for `day`, or a stable rotation through the published catalogue. */
export async function pieceIdForDay(db: DB, day: string): Promise<string | null> {
  const [scheduled] = await db.select().from(dailySchedule).where(eq(dailySchedule.day, day));
  if (scheduled) return scheduled.pieceId;
  const all = await db.select({ id: pieces.id }).from(pieces).where(eq(pieces.isPublished, true)).orderBy(asc(pieces.id));
  if (all.length === 0) return null;
  const dayNumber = Math.floor(Date.parse(`${day}T00:00:00Z`) / 86_400_000);
  return all[dayNumber % all.length]!.id;
}

/**
 * Days up to and including `until` (the reader's today), oldest first. The last entry is always
 * `until` itself, so a day missing from daily_schedule still pages to the rotation's piece.
 */
export async function scheduleUntil(db: DB, until: string): Promise<ScheduledDay[]> {
  const rows = await db.select({ day: dailySchedule.day, pieceId: dailySchedule.pieceId })
    .from(dailySchedule).where(lte(dailySchedule.day, until)).orderBy(asc(dailySchedule.day));
  if (rows.at(-1)?.day !== until) {
    const id = await pieceIdForDay(db, until);
    if (id) rows.push({ day: until, pieceId: id });
  }
  return rows;
}

/** Published pieces (scheduled on or before `today`) with their publish date, newest first. */
export async function listPublishedPieces(db: DB, locale: Locale, today: string) {
  const dates = publishDates(await scheduleUntil(db, today), today);
  if (dates.size === 0) return [];
  const list = await listPieces(db, locale, [...dates.keys()]);
  return list
    .map((p) => ({ ...p, publishDate: dates.get(p.id)! }))
    .sort((a, b) => b.publishDate.localeCompare(a.publishDate));
}

export async function listGlossary(db: DB, locale: Locale) {
  const rows = await db.select().from(glossaryLocalizations).where(inArray(glossaryLocalizations.locale, localesFor(locale)));
  const ids = [...new Set(rows.map((r) => r.termId))];
  return ids
    .map((id) => pick(rows.filter((r) => r.termId === id), locale)!)
    .map((r) => ({ id: r.termId, term: r.term, definition: r.definition }))
    .sort((a, b) => a.term.localeCompare(b.term, locale));
}

export async function listComposers(db: DB, locale: Locale) {
  const [base, ls] = await Promise.all([
    db.select().from(composers),
    db.select().from(composerLocalizations).where(inArray(composerLocalizations.locale, localesFor(locale))),
  ]);
  return base
    .map((c) => {
      const rows = ls.filter((r) => r.composerId === c.id);
      const l = pick(rows, locale);
      const en = rows.find((r) => r.locale === DEFAULT_LOCALE);
      return composerResponse({
        id: c.id, sortName: c.sortName, birthYear: c.birthYear, deathYear: c.deathYear, era: c.era, portrait: c.portrait,
        name: l?.name, shortName: l?.shortName,
        // Each field group falls back to English on its own, so a partial translation never blanks the sheet.
        nationality: l?.nationality ?? en?.nationality, facts: l?.facts ?? en?.facts, bio: l?.bio ?? en?.bio,
        portraitCaption: l?.portraitCaption ?? en?.portraitCaption, locale,
      });
    })
    .sort((a, b) => a.shortName.localeCompare(b.shortName, locale));
}

export const composerFactKeys = ["born", "died", "symphonies", "bestKnownFor"] as const;

/** GET /composers item; also used by scripts/export-fixtures.ts so the fixtures match the API. */
export function composerResponse(c: {
  id: string; sortName: string; birthYear: number | null; deathYear: number | null; era: string | null;
  portrait: ComposerPortraitAsset | null; name?: string | null; shortName?: string | null;
  nationality?: string | null; facts?: ComposerFacts | null; bio?: string | null; portraitCaption?: ComposerPortraitCaption | null;
  locale?: string;
}) {
  const facts = composerFactKeys.flatMap((label) => {
    const value = c.facts?.[label];
    return value ? [{ label, value }] : [];
  });
  const p = c.portrait;
  const caption = c.portraitCaption;
  return {
    id: c.id,
    name: c.name ?? c.sortName,
    shortName: c.shortName ?? c.sortName,
    birthYear: c.birthYear,
    deathYear: c.deathYear,
    era: c.era,
    nationality: c.nationality ?? null,
    facts, // [{ label: "born" | "died" | "symphonies" | "bestKnownFor", value }], in display order
    bio: c.bio ?? null,
    portrait: p && caption
      ? {
          ...imageFields(`composers/${c.id}`, p), sourceUrl: p.sourceUrl, focalY: p.focalY,
          artist: caption.artist, title: caption.title, year: p.year, collection: caption.collection, license: p.license,
          ...imageCredit(`composers/${c.id}`, p.imageUrl, c.locale ?? DEFAULT_LOCALE),
        }
      : null,
  };
}
