import { existsSync, mkdirSync, readFileSync, rmSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import { parse as parseYaml } from "yaml";
import { normalizeRich, slugify } from "../src/content/parse.js";
import { composerResponse } from "../src/content/repository.js";
import type { PaintingAsset, ParsedContent, RecordingMeta } from "../src/content/types.js";

/**
 * content/build/<locale>.json → ios/DailyClassical/Resources/Fixtures/<locale>/*.json,
 * shaped exactly like the API responses, so the app runs (and previews render)
 * without a backend. Run after `npm run content:build`.
 */
const here = dirname(fileURLToPath(import.meta.url));
const contentDir = join(here, "../../content");
const out = join(here, "../../ios/DailyClassical/Resources/Fixtures");

type Localized = Record<string, string>;
type Composer = {
  id: string; match: string; sort_name: string; era: string; born?: number; died?: number; names: Record<string, { name: string; short: string }>;
  nationality?: Localized;
  facts?: { born?: Localized; died?: Localized; symphonies?: Localized; best_known_for?: Localized };
  bio?: Localized;
  portrait?: {
    artist: string | Localized; title: Localized; year: string | number | null; collection: Localized | null;
    image_url: string; source_url: string | null; width: number | null; height: number | null;
    license: string | null; focal_y: number | null;
  } | null;
};
/** Per-locale value of a {en, tr} field (English fallback, as the API does); a plain string is language-neutral. */
const loc = (v: string | Localized | null | undefined, locale: string): string | null =>
  v == null ? null : typeof v === "string" ? v : (v[locale] ?? v.en ?? null);
const composers = parseYaml(readFileSync(join(contentDir, "composers.yaml"), "utf8")) as Composer[];
const assetsPath = join(contentDir, "paintings.yaml");
const assets = (existsSync(assetsPath) ? parseYaml(readFileSync(assetsPath, "utf8")) : {}) as Record<string, PaintingAsset>;
const en = JSON.parse(readFileSync(join(contentDir, "build/en.json"), "utf8")) as ParsedContent;

const albumId = (u: string | null) => u?.match(/album\/([A-Za-z0-9]+)/)?.[1] ?? null;

rmSync(out, { recursive: true, force: true });
for (const locale of ["en", "tr"]) {
  const path = join(contentDir, `build/${locale}.json`);
  if (!existsSync(path)) continue;
  const content = JSON.parse(readFileSync(path, "utf8")) as ParsedContent;
  const dir = join(out, locale);
  mkdirSync(dir, { recursive: true });

  const summaries = en.pieces.map(({ meta: base }) => {
    const local = content.pieces.find((p) => p.meta.id === base.id) ?? en.pieces.find((p) => p.meta.id === base.id)!;
    const m = local.meta;
    const composer = composers.find((c) => c.match === base.composer)!;
    const names = composer.names[locale] ?? composer.names.en!;
    const asset = assets[base.id] ?? {};
    const recording = (r: RecordingMeta, i: number) => ({
      id: `${base.id}-${i}`, role: i === 0 ? "reference" : "alternative", conductor: r.conductor, orchestra: r.orchestra,
      soloists: r.soloists, chorus: r.chorus, label: r.label, catalogueNumber: r.catalogueNumber, venue: r.venue,
      recordedYear: r.recorded ?? (r.year === null ? null : String(r.year)), releaseYear: r.releaseYear,
      spotifyUrl: albumId(r.spotifyUrl) ? `https://open.spotify.com/album/${albumId(r.spotifyUrl)}` : null,
    });
    const summary = {
      id: base.id, contentLocale: content.pieces.includes(local) ? locale : "en",
      composer: { id: composer.id, name: names.name, shortName: names.short },
      title: m.title, catalogue: base.catalogue, keyLabel: m.key, year: base.year, era: composer.era,
      durationMin: base.durationMin, movementCount: base.movementCount, hook: m.hook,
      painting: {
        artist: base.painting.artist, title: m.painting.title, yearLabel: m.painting.year,
        collection: m.painting.collection, pairingNote: m.painting.pairingNote, medium: asset.medium ?? null,
        imageUrl: asset.image_url ?? null, sourceUrl: asset.source_url ?? null,
        width: asset.width ?? null, height: asset.height ?? null,
        rightsStatus: asset.rights_status ?? (base.painting.rightsFlag ? "unverified" : "public_domain"),
      },
    };
    const recordings = [base.referenceRecording, ...base.alsoRecommended].map(recording);
    writeFileSync(join(dir, `piece-${base.id}.json`), JSON.stringify({ ...summary, document: local.document, recordings }));
    return summary;
  });
  writeFileSync(join(dir, "pieces.json"), JSON.stringify(summaries));
  writeFileSync(join(dir, "composers.json"), JSON.stringify(composers.map((c) => {
    const n = c.names[locale] ?? c.names.en!;
    const p = c.portrait;
    const bio = loc(c.bio, locale);
    const artist = p ? loc(p.artist, locale) : null;
    const title = p ? loc(p.title, locale) : null;
    return composerResponse({
      id: c.id, sortName: c.sort_name, birthYear: c.born ?? null, deathYear: c.died ?? null, era: c.era,
      portrait: p?.image_url
        ? { imageUrl: p.image_url, sourceUrl: p.source_url ?? null, width: p.width ?? null, height: p.height ?? null,
            license: p.license ?? null, focalY: p.focal_y ?? 0.5, year: p.year == null ? null : String(p.year) }
        : null,
      name: n.name, shortName: n.short,
      nationality: loc(c.nationality, locale),
      facts: c.facts
        ? { born: loc(c.facts.born, locale), died: loc(c.facts.died, locale), symphonies: loc(c.facts.symphonies, locale), bestKnownFor: loc(c.facts.best_known_for, locale) }
        : null,
      bio: bio ? normalizeRich(bio) : null,
      portraitCaption: p && artist && title ? { artist, title, collection: loc(p.collection, locale) } : null,
    });
  }).sort((a, b) => a.shortName.localeCompare(b.shortName, locale))));

  const glossary = (content.glossary.length ? content.glossary : en.glossary)
    .map((g) => ({ id: g.id || slugify(g.key), term: g.term, definition: g.definition }))
    .sort((a, b) => a.term.localeCompare(b.term, locale));
  writeFileSync(join(dir, "glossary.json"), JSON.stringify(glossary));
  console.log(`✓ fixtures/${locale}: ${summaries.length} pieces, ${glossary.length} terms`);
}
