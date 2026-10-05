import { execFileSync } from "node:child_process";
import { createHash } from "node:crypto";
import { copyFileSync, existsSync, mkdirSync, readdirSync, readFileSync, rmSync, statSync, writeFileSync } from "node:fs";
import { dirname, extname, join } from "node:path";
import { fileURLToPath } from "node:url";
import { isMap, parseDocument, type Document } from "yaml";
import type { ImageManifest, ImageManifestEntry } from "../src/content/repository.js";

/**
 * `npm run images` — painting + composer portrait derivatives (macOS: uses scripts/image-tool.swift).
 *
 * 1. Downloads each vetted original (content/paintings.yaml `image_url`, content/composers.yaml
 *    `portrait.image_url`) ONCE into content/images/.originals/ (git-ignored; re-fetched only when the
 *    yaml URL changes or with --refresh).
 * 2. Writes two sRGB, metadata-free JPEGs per image:
 *      hero   short side ≤ 1080 px, long side ≤ 1800 px, q 0.6  (full-width heroes at 3×, artwork viewer)
 *      thumb  short side ≤ 256 px, long side ≤ 640 px, q 0.75 (64/44/40 pt list thumbnails at 3×)
 *    to backend/public/images/<kind>/<id>-<variant>.jpg (served by the API at /images/…, immutable)
 *    and copies them into ios/DailyClassical/Resources/Artwork/ (bundled, so first launch is instant).
 * 3. Writes manifest.json next to both copies (pixel sizes, bytes, content hash, average colour) and
 *    records the same facts in the yaml (`hero`, `thumb`, `placeholder_color`).
 *
 * Run `npm run fixtures` afterwards so the bundled fixtures carry the new URLs.
 */
const here = dirname(fileURLToPath(import.meta.url));
const repo = join(here, "../..");
const contentDir = join(repo, "content");
const originalsDir = join(contentDir, "images/.originals");
const publicDir = join(repo, "backend/public/images");
const bundleDir = join(repo, "ios/DailyClassical/Resources/Artwork");
const toolSource = join(here, "image-tool.swift");
const toolBinary = join(originalsDir, ".bin/image-tool");

const VARIANTS = {
  hero: { short: 1080, long: 1800, quality: 0.6 },
  thumb: { short: 256, long: 640, quality: 0.75 },
} as const;
type Variant = keyof typeof VARIANTS;
const refresh = process.argv.includes("--refresh");
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
  const existing = readdirSync(dir).find((f) => f.startsWith(`${job.id}.`) && !f.endsWith(".url"));
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

const manifest: ImageManifest = { version: 1, images: {} };
let originalBytes = 0;
for (const kind of ["paintings", "composers"]) {
  rmSync(join(publicDir, kind), { recursive: true, force: true });
  mkdirSync(join(publicDir, kind), { recursive: true });
}

for (const job of jobs) {
  const src = await original(job);
  originalBytes += statSync(src).size;
  const variants = Object.keys(VARIANTS) as Variant[];
  const files = variants.map((v) => `${job.kind}/${job.id}-${v}.jpg`);
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
  console.log(`✓ ${job.kind}/${job.id}: ${result.width}×${result.height} → hero ${entry.hero.width}×${entry.hero.height} ${kb(entry.hero.bytes)}, thumb ${entry.thumb.width}×${entry.thumb.height} ${kb(entry.thumb.bytes)}, ${result.color}`);
}

writeFileSync(join(publicDir, "manifest.json"), `${JSON.stringify(manifest, null, 2)}\n`);
writeFileSync(paintings.path, paintings.doc.toString({ lineWidth: 0 }));
writeFileSync(composers.path, composers.doc.toString({ lineWidth: 0 }));

// Bundle copy for the app (folder reference Resources/Artwork in ios/project.yml).
rmSync(bundleDir, { recursive: true, force: true });
for (const entry of Object.values(manifest.images)) {
  for (const v of Object.keys(VARIANTS) as Variant[]) {
    const dest = join(bundleDir, entry[v].path);
    mkdirSync(dirname(dest), { recursive: true });
    copyFileSync(join(publicDir, entry[v].path), dest);
  }
}
copyFileSync(join(publicDir, "manifest.json"), join(bundleDir, "manifest.json"));

// --- report ---------------------------------------------------------------------------------------
function kb(n: number) { return `${Math.round(n / 1024)} KB`; }
const all = Object.values(manifest.images);
const sum = (v: Variant) => all.reduce((s, e) => s + e[v].bytes, 0);
console.log(
  `\n${all.length} images. Originals ${(originalBytes / 1e6).toFixed(1)} MB (avg ${kb(originalBytes / all.length)}).` +
  ` Hero ${(sum("hero") / 1e6).toFixed(2)} MB (avg ${kb(sum("hero") / all.length)}),` +
  ` thumb ${(sum("thumb") / 1e6).toFixed(2)} MB (avg ${kb(sum("thumb") / all.length)}),` +
  ` total ${((sum("hero") + sum("thumb")) / 1e6).toFixed(2)} MB bundled + served.`,
);
