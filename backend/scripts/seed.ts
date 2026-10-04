import { existsSync, readFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import { eq } from "drizzle-orm";
import { drizzle } from "drizzle-orm/postgres-js";
import postgres from "postgres";
import { parse as parseYaml } from "yaml";
import * as s from "../src/db/schema.js";
import { normalizeRich } from "../src/content/parse.js";
import type { PaintingAsset, ParsedContent } from "../src/content/types.js";

/**
 * Idempotent seed: content/build/<locale>.json (run `npm run content:build` first)
 * + content/composers.yaml → Postgres. English is required; other locales are
 * layered on top and fall back to English per field group at read time.
 */

const root = join(dirname(fileURLToPath(import.meta.url)), "../../content");
const url = process.env.DATABASE_URL_UNPOOLED ?? process.env.DATABASE_URL;
if (!url) throw new Error("DATABASE_URL is not set");
const sql = postgres(url, { max: 1, ssl: "require" });
const db = drizzle(sql, { schema: s });

type Localized = Record<string, string>;
type ComposerEntry = {
  id: string; match: string; sort_name: string; born: number; died: number;
  era: (typeof s.era.enumValues)[number];
  names: Record<string, { name: string; short: string }>;
  nationality?: Localized;
  facts?: { born?: Localized; died?: Localized; symphonies?: Localized; best_known_for?: Localized };
  bio?: Localized;
  portrait?: {
    artist: string | Localized; title: Localized; year: string | number | null; collection: Localized | null;
    image_url: string; source_url: string | null; width: number | null; height: number | null;
    license: string | null; focal_y: number | null;
  } | null;
};
const composers = parseYaml(readFileSync(join(root, "composers.yaml"), "utf8")) as ComposerEntry[];
/** Per-locale value of a {en, tr} field; a plain string is language-neutral. */
const loc = (v: string | Localized | null | undefined, locale: string): string | null =>
  v == null ? null : typeof v === "string" ? v : (v[locale] ?? null);
const assetsPath = join(root, "paintings.yaml");
const assets = (existsSync(assetsPath) ? parseYaml(readFileSync(assetsPath, "utf8")) : {}) as Record<string, PaintingAsset>;

const load = (locale: string): ParsedContent | null => {
  const p = join(root, "build", `${locale}.json`);
  return existsSync(p) ? JSON.parse(readFileSync(p, "utf8")) : null;
};
const en = load("en");
if (!en) throw new Error("content/build/en.json missing; run `npm run content:build`");
const translations = s.locales.filter((l) => l !== "en").map(load).filter((c): c is ParsedContent => c !== null);

const albumId = (u: string | null) => u?.match(/open\.spotify\.com\/album\/([A-Za-z0-9]+)/)?.[1] ?? null;

await db.transaction(async (tx) => {
  for (const c of composers) {
    const p = c.portrait;
    const portrait: s.ComposerPortraitAsset | null = p?.image_url
      ? { imageUrl: p.image_url, sourceUrl: p.source_url ?? null, width: p.width ?? null, height: p.height ?? null,
          license: p.license ?? null, focalY: p.focal_y ?? 0.5, year: p.year == null ? null : String(p.year) }
      : null;
    const base = { sortName: c.sort_name, birthYear: c.born, deathYear: c.died, era: c.era, portrait };
    await tx.insert(s.composers).values({ id: c.id, ...base })
      .onConflictDoUpdate({ target: s.composers.id, set: base });
    for (const [locale, n] of Object.entries(c.names)) {
      const f = c.facts;
      const facts: s.ComposerFacts | null = f
        ? { born: loc(f.born, locale), died: loc(f.died, locale), symphonies: loc(f.symphonies, locale), bestKnownFor: loc(f.best_known_for, locale) }
        : null;
      const hasFacts = facts && Object.values(facts).some((v) => v !== null);
      const bio = loc(c.bio, locale);
      const title = p ? loc(p.title, locale) : null;
      const artist = p ? loc(p.artist, locale) : null;
      const row = {
        name: n.name, shortName: n.short,
        nationality: loc(c.nationality, locale),
        facts: hasFacts ? facts : null,
        bio: bio ? normalizeRich(bio) : null,
        portraitCaption: p && artist && title ? { artist, title, collection: loc(p.collection, locale) } : null,
      };
      await tx.insert(s.composerLocalizations).values({ composerId: c.id, locale, ...row })
        .onConflictDoUpdate({ target: [s.composerLocalizations.composerId, s.composerLocalizations.locale], set: row });
    }
  }

  for (const content of [en, ...translations]) {
    for (const g of content.glossary) {
      await tx.insert(s.glossaryTerms).values({ id: g.id }).onConflictDoNothing();
      await tx.insert(s.glossaryLocalizations).values({ termId: g.id, locale: content.locale, term: g.term, definition: g.definition })
        .onConflictDoUpdate({ target: [s.glossaryLocalizations.termId, s.glossaryLocalizations.locale], set: { term: g.term, definition: g.definition } });
    }
  }

  for (const { meta, document } of en.pieces) {
    const composer = composers.find((c) => c.match === meta.composer);
    if (!composer) throw new Error(`No composers.yaml entry for "${meta.composer}"`);
    const base = {
      composerId: composer.id, catalogue: meta.catalogue, year: meta.year, durationMin: meta.durationMin,
      movementCount: meta.movementCount, era: composer.era, isPublished: true, updatedAt: new Date(),
    };
    await tx.insert(s.pieces).values({ id: meta.id, ...base }).onConflictDoUpdate({ target: s.pieces.id, set: base });

    // Recordings and painting are replaced wholesale from the source of truth.
    await tx.delete(s.recordings).where(eq(s.recordings.pieceId, meta.id));
    const recs = [meta.referenceRecording, ...meta.alsoRecommended];
    await tx.insert(s.recordings).values(recs.map((r, i) => ({
      pieceId: meta.id, role: i === 0 ? ("reference" as const) : ("alternative" as const), sortOrder: i,
      conductor: r.conductor, orchestra: r.orchestra, soloists: r.soloists, chorus: r.chorus, label: r.label,
      recordedYear: r.recorded ?? (r.year === null ? null : String(r.year)), releaseYear: r.releaseYear,
      catalogueNumber: r.catalogueNumber, venue: r.venue, spotifyAlbumId: albumId(r.spotifyUrl),
    })));

    await tx.delete(s.paintings).where(eq(s.paintings.pieceId, meta.id));
    const asset = assets[meta.id] ?? {};
    const [painting] = await tx.insert(s.paintings).values({
      pieceId: meta.id, artist: meta.painting.artist, yearLabel: meta.painting.year,
      medium: asset.medium ?? null, imageUrl: asset.image_url ?? null, sourceUrl: asset.source_url ?? null,
      width: asset.width ?? null, height: asset.height ?? null,
      rightsStatus: asset.rights_status ?? (meta.painting.rightsFlag ? "unverified" : "public_domain"),
      rightsNote: meta.painting.rightsFlag,
    }).returning({ id: s.paintings.id });

    for (const content of [en, ...translations]) {
      const p = content.pieces.find((x) => x.meta.id === meta.id);
      if (!p) continue;
      const loc = { title: p.meta.title, keyLabel: p.meta.key, hook: p.meta.hook, document: p.document, updatedAt: new Date() };
      await tx.insert(s.pieceLocalizations).values({ pieceId: meta.id, locale: content.locale, ...loc })
        .onConflictDoUpdate({ target: [s.pieceLocalizations.pieceId, s.pieceLocalizations.locale], set: loc });
      await tx.insert(s.paintingLocalizations).values({
        paintingId: painting!.id, locale: content.locale, title: p.meta.painting.title, yearLabel: p.meta.painting.year,
        collection: p.meta.painting.collection, pairingNote: p.meta.painting.pairingNote,
      });
    }
  }
});

console.log(`✓ seeded ${en.pieces.length} pieces (${["en", ...translations.map((t) => t.locale)].join(", ")})`);
await sql.end();
