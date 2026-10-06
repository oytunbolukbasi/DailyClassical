import { execFileSync } from "node:child_process";
import { createHash } from "node:crypto";
import { copyFileSync, existsSync, mkdirSync, readdirSync, readFileSync, rmSync, statSync, writeFileSync } from "node:fs";
import { dirname, extname, join, relative } from "node:path";
import { fileURLToPath } from "node:url";
import { isMap, parseDocument, type Document } from "yaml";
import type { ImageManifest, ImageManifestEntry } from "../src/content/repository.js";

/**
 * `npm run images` — painting + composer portrait derivatives (macOS: uses scripts/image-tool.swift).
 *
 * 1. Downloads each vetted original (content/paintings.yaml `image_url`, content/composers.yaml
 *    `portrait.image_url`) ONCE into content/images/.originals/ (git-ignored; re-fetched only when the
 *    yaml URL changes or with --refresh).
 * 2. Writes three sRGB, metadata-free HEICs per image (never upscaled beyond the original):
 *      hero   short side ≤ 1800 px, long side ≤ 3600 px, q 0.75  Today / piece header / portrait at 3×
 *                                                                (cover-cropped into a ~430×580 pt frame)
 *      thumb  short side ≤ 300 px,  long side ≤ 720 px,  q 0.75  64/44/40 pt list thumbnails, small/medium widgets
 *      full   long side ≤ 4000 px,                       q 0.8   artwork viewer pinch-zoom only
 *    to backend/public/images/<kind>/<id>-<variant>.heic (served by the API at /images/…, immutable,
 *    URLs carry ?v=<hash>). hero + thumb are also copied into ios/DailyClassical/Resources/Artwork/
 *    (bundled, so first launch is instant and offline); `full` is NOT bundled — the app downloads it on
 *    demand and keeps it in its disk cache.
 * 3. Writes manifest.json next to both copies (pixel sizes, bytes, content hash, average colour) and
 *    records the same facts in the yaml (`hero`, `thumb`, `full`, `placeholder_color`).
 * 4. Deletes derivatives no manifest entry points at (e.g. the old .jpg files), in both places.
 *
 * Colour-matched originals (manual step, none in use yet): a sharp but colour-cast gallery photo can be
 * colour-matched to a better-coloured reproduction ONCE by hand; the master then sits in the originals
 * cache as `<id>.jpg`, and the pipeline only reads it (its `<id>.url` holds the yaml `image_url`, so it is
 * not re-downloaded). Do NOT pass --refresh for such an id — that would replace the master with the raw
 * photo. To make the master (`<id>.source.jpg` / `<id>.reference.jpg` are never read as originals):
 *
 *     cd content/images/.originals/paintings
 *     curl -L -A "DailyClassical-image-pipeline/1.0" -o <id>.source.jpg "<new image_url>"   # raw photo
 *     # <id>.reference.jpg = the reproduction whose colour to match
 *     xcrun swift ../../../../backend/scripts/color-match.swift <id>.reference.jpg <id>.source.jpg <id>.jpg
 *     printf '%s' "<new image_url>" > <id>.url      # and set image_url/width/height in paintings.yaml
 *     cd ../../../../backend && npm run images -- --only <id> && npm run fixtures
 *
 * (color-match.swift: per-channel mean/std transfer in linear sRGB, JPEG q 0.95.)
 *
 * Re-running for ONE image (e.g. after changing its `image_url` in the yaml):
 *
 *     npm run images -- --only <id>      # a piece id (paintings) or composer id (portraits)
 *     npm run images -- --only <id> --refresh   # also re-download that original
 *     npm run fixtures                   # always afterwards, so the fixtures carry the new ?v= URLs
 *
 * `--only` may be repeated or comma-separated; `paintings/<id>` / `composers/<id>` picks one kind when a
 * piece and a composer share an id. Every other image keeps its files and manifest entry untouched.
 */
const here = dirname(fileURLToPath(import.meta.url));
const repo = join(here, "../..");
const contentDir = join(repo, "content");
const originalsDir = join(contentDir, "images/.originals");
const publicDir = join(repo, "backend/public/images");
const bundleDir = join(repo, "ios/DailyClassical/Resources/Artwork");
const toolSource = join(here, "image-tool.swift");
const toolBinary = join(originalsDir, ".bin/image-tool");

/** `short`/`long`: maximum pixel size of each side (0 = no limit). `bundled`: copied into the app. */
const VARIANTS = {
  hero: { short: 1800, long: 3600, quality: 0.75, bundled: true },
  thumb: { short: 300, long: 720, quality: 0.75, bundled: true },
  full: { short: 0, long: 4000, quality: 0.8, bundled: false },
} as const;
type Variant = keyof typeof VARIANTS;
const variants = Object.keys(VARIANTS) as Variant[];
const EXT = "heic";

const argv = process.argv.slice(2);
const refresh = argv.includes("--refresh");
const only = new Set(argv.flatMap((a, i) => (argv[i - 1] === "--only" ? a.split(",") : a.startsWith("--only=") ? a.slice(7).split(",") : [])).filter(Boolean));
if (argv.includes("--only") && only.size === 0) throw new Error("--only needs an id: npm run images -- --only <id>");
// Wikimedia asks automated clients for a descriptive User-Agent.
const USER_AGENT = "DailyClassical-image-pipeline/1.0 (https://dailyclassical.co)";

type Credit = { credit?: Record<string, string>; licenseUrl?: string };
type Job = { kind: "paintings" | "composers"; id: string; url: string; doc: Document; path: (string | number)[] } & Credit;

const load = (file: string) => {
  const path = join(contentDir, file);
  return { path, doc: parseDocument(readFileSync(path, "utf8")) };
};
const paintings = load("paintings.yaml");
const composers = load("composers.yaml");

const jobs: Job[] = [];
for (const [id, v] of Object.entries(paintings.doc.toJS() as Record<string, { image_url?: string | null }>)) {
  if (v?.image_url) jobs.push({ kind: "paintings", id, url: v.image_url, doc: paintings.doc, path: [id] });
}
type Portrait = { image_url?: string | null; credit_line?: string | Record<string, string> | null; license_url?: string | null };
(composers.doc.toJS() as { id: string; portrait?: Portrait | null }[]).forEach((c, i) => {
  const p = c.portrait;
  if (!p?.image_url) return;
  // Attribution for freely licensed (non-PD) portraits travels with the image to the API and the app.
  const credit = typeof p.credit_line === "string" ? { en: p.credit_line } : (p.credit_line ?? undefined);
  jobs.push({ kind: "composers", id: c.id, url: p.image_url, doc: composers.doc, path: [i, "portrait"], credit, licenseUrl: p.license_url ?? undefined });
});

const selected = (job: Job) => only.size === 0 || only.has(job.id) || only.has(`${job.kind}/${job.id}`);
const todo = jobs.filter(selected);
if (only.size > 0) {
  const unknown = [...only].filter((o) => !jobs.some((j) => j.id === o || `${j.kind}/${j.id}` === o));
  if (unknown.length) throw new Error(`--only: no painting or portrait with id ${unknown.join(", ")}`);
}

// --- image tool -----------------------------------------------------------------------------------
if (!existsSync(toolBinary) || statSync(toolBinary).mtimeMs < statSync(toolSource).mtimeMs) {
  mkdirSync(dirname(toolBinary), { recursive: true });
  console.log("compiling image-tool…");
  execFileSync("xcrun", ["swiftc", "-O", "-o", toolBinary, toolSource], { stdio: "inherit" });
}

// --- originals ------------------------------------------------------------------------------------
const sleep = (ms: number) => new Promise((r) => setTimeout(r, ms));

async function original(job: Job): Promise<string> {
  const dir = join(originalsDir, job.kind);
  mkdirSync(dir, { recursive: true });
  const marker = join(dir, `${job.id}.url`);
  // Exactly `<id>.<ext>`: `<id>.source.jpg` / `<id>.reference.jpg` (colour-match inputs) are not originals.
  const existing = readdirSync(dir).find((f) => f.startsWith(`${job.id}.`) && /^[a-z]+$/i.test(f.slice(job.id.length + 1)) && !f.endsWith(".url"));
  if (!refresh && existing && existsSync(marker) && readFileSync(marker, "utf8") === job.url) return join(dir, existing);

  for (let attempt = 1; ; attempt++) {
    const res = await fetch(job.url, { headers: { "User-Agent": USER_AGENT }, redirect: "follow" });
    if (res.ok) {
      const bytes = Buffer.from(await res.arrayBuffer());
      const ext = (extname(new URL(res.url).pathname) || ".jpg").toLowerCase();
      if (existing) rmSync(join(dir, existing));
      const file = join(dir, `${job.id}${ext}`);
      writeFileSync(file, bytes);
      writeFileSync(marker, job.url);
      console.log(`↓ ${job.kind}/${job.id}${ext} ${(bytes.length / 1e6).toFixed(1)} MB`);
      await sleep(1000);
      return file;
    }
    if ((res.status === 429 || res.status >= 500) && attempt < 5) {
      await sleep(5000 * attempt);
      continue;
    }
    throw new Error(`${job.url}: HTTP ${res.status}`);
  }
}

// --- derivatives ----------------------------------------------------------------------------------
type ToolResult = { width: number; height: number; color: string; outputs: { width: number; height: number; bytes: number }[] };

const manifestPath = join(publicDir, "manifest.json");
const previous: ImageManifest | null = existsSync(manifestPath) ? JSON.parse(readFileSync(manifestPath, "utf8")) : null;
// A partial run (--only) keeps every other entry; a full run rebuilds the manifest from the yaml.
const manifest: ImageManifest = {
  version: 2,
  images: only.size > 0 && previous?.version === 2
    ? Object.fromEntries(Object.entries(previous.images).filter(([key]) => jobs.some((j) => `${j.kind}/${j.id}` === key)))
    : {},
};
if (only.size > 0 && previous?.version !== 2) throw new Error("--only needs a current manifest: run `npm run images` once first");
let originalBytes = 0;

for (const job of todo) {
  const src = await original(job);
  originalBytes += statSync(src).size;
  const files = variants.map((v) => `${job.kind}/${job.id}-${v}.${EXT}`);
  mkdirSync(join(publicDir, job.kind), { recursive: true });
  const specs = variants.map((v, i) => `${join(publicDir, files[i]!)}:${VARIANTS[v].short}:${VARIANTS[v].long}:${VARIANTS[v].quality}`);
  const result = JSON.parse(execFileSync(toolBinary, [src, ...specs], { encoding: "utf8" })) as ToolResult;

  const entry = { source: job.url, color: result.color, ...(job.credit && { credit: job.credit }), ...(job.licenseUrl && { licenseUrl: job.licenseUrl }) } as ImageManifestEntry;
  variants.forEach((v, i) => {
    const out = result.outputs[i]!;
    const hash = createHash("sha256").update(readFileSync(join(publicDir, files[i]!))).digest("hex").slice(0, 10);
    entry[v] = { path: files[i]!, width: out.width, height: out.height, bytes: out.bytes, hash };
  });
  manifest.images[`${job.kind}/${job.id}`] = entry;

  // yaml: derivative facts next to the original's; fill the original size when the research left it null.
  const { doc, path } = job;
  if (doc.getIn([...path, "width"]) == null) doc.setIn([...path, "width"], result.width);
  if (doc.getIn([...path, "height"]) == null) doc.setIn([...path, "height"], result.height);
  for (const v of variants) {
    const node = doc.createNode({ width: entry[v].width, height: entry[v].height, bytes: entry[v].bytes });
    if (isMap(node)) node.flow = true;
    doc.setIn([...path, v], node);
  }
  doc.setIn([...path, "placeholder_color"], result.color);
  console.log(`✓ ${job.kind}/${job.id}: ${result.width}×${result.height} → ` +
    variants.map((v) => `${v} ${entry[v].width}×${entry[v].height} ${kb(entry[v].bytes)}`).join(", ") + `, ${result.color}`);
}

// Stable key order, so a partial run does not reshuffle the manifest diff.
manifest.images = Object.fromEntries(Object.entries(manifest.images).sort(([a], [b]) => a.localeCompare(b)));
writeFileSync(manifestPath, `${JSON.stringify(manifest, null, 2)}\n`);
writeFileSync(paintings.path, paintings.doc.toString({ lineWidth: 0 }));
writeFileSync(composers.path, composers.doc.toString({ lineWidth: 0 }));

// Bundle copy for the app (folder reference Resources/Artwork in ios/project.yml): bundled variants only.
for (const key of Object.keys(manifest.images)) {
  if (only.size > 0 && !todo.some((j) => `${j.kind}/${j.id}` === key)) continue;
  const entry = manifest.images[key]!;
  for (const v of variants.filter((v) => VARIANTS[v].bundled)) {
    const dest = join(bundleDir, entry[v].path);
    mkdirSync(dirname(dest), { recursive: true });
    copyFileSync(join(publicDir, entry[v].path), dest);
  }
}
copyFileSync(manifestPath, join(bundleDir, "manifest.json"));

// Remove every derivative the manifest no longer points at (old .jpg renditions, removed images, `full` in the bundle).
const keep = (root: string, bundled: boolean) => new Set(Object.values(manifest.images)
  .flatMap((e) => variants.filter((v) => !bundled || VARIANTS[v].bundled).map((v) => join(root, e[v].path))));
for (const [root, bundled] of [[publicDir, false], [bundleDir, true]] as const) {
  const wanted = keep(root, bundled);
  for (const kind of ["paintings", "composers"]) {
    const dir = join(root, kind);
    if (!existsSync(dir)) continue;
    for (const f of readdirSync(dir)) {
      const file = join(dir, f);
      if (!wanted.has(file)) { rmSync(file); console.log(`− ${relative(repo, file)}`); }
    }
  }
}

// --- report ---------------------------------------------------------------------------------------
function kb(n: number) { return `${Math.round(n / 1024)} KB`; }
const all = Object.values(manifest.images);
const sum = (v: Variant) => all.reduce((s, e) => s + e[v].bytes, 0);
const mb = (n: number) => `${(n / 1e6).toFixed(2)} MB`;
console.log(
  `\n${all.length} images${only.size ? ` (${todo.length} regenerated)` : ""}.` +
  (todo.length ? ` Originals ${(originalBytes / 1e6).toFixed(1)} MB (avg ${kb(originalBytes / todo.length)}).` : "") +
  variants.map((v) => ` ${v} ${mb(sum(v))} (avg ${kb(sum(v) / all.length)})`).join(",") +
  `. Bundled (hero + thumb): ${mb(sum("hero") + sum("thumb"))}.`,
);
