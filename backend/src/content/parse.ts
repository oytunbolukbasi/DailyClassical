import { parse as parseYaml } from "yaml";
import type {
  GlossaryEntry,
  ListeningStop,
  MainIdea,
  Movement,
  Note,
  ParsedContent,
  ParsedPiece,
  PieceMeta,
  RecordingMeta,
  Soloist,
  Thread,
} from "./types.js";

/**
 * Parser for the launch-content markdown (content/<locale>/*.md).
 * The English and Turkish files share one structure; only the fixed
 * labels differ, so every label is matched against both languages.
 */

const LABELS = {
  bigPicture: ["The big picture", "Genel bakış"],
  movements: ["Movements", "Bölümler"],
  threads: ["Threads", "Bağlayan ipler"],
  glossary: ["Glossary", "Sözlük"],
  summary: ["Summary", "Özet"],
  mainIdeas: ["Main ideas", "Ana fikirler"],
  stops: ["Listening stops", "Dinleme durakları"],
  notice: ["Things to notice", "Dikkat edilecekler"],
  inOneLine: ["In one line", "Tek cümleyle"],
};

const COLUMN_ALIASES: Record<string, keyof Pick<Movement, "title" | "tempo" | "key" | "metre"> | "duration" | "titleOrTempo"> = {
  tempo: "tempo",
  key: "key",
  ton: "key",
  metre: "metre",
  "ölçü": "metre",
  duration: "duration",
  "süre": "duration",
  title: "title",
  "başlık": "title",
  "title or tempo": "titleOrTempo",
  "başlık veya tempo": "titleOrTempo",
};

const is = (text: string, labels: string[]) =>
  labels.some((l) => text.trim().toLocaleLowerCase("en") === l.toLocaleLowerCase("en"));

export function slugify(s: string): string {
  return s
    .normalize("NFKD")
    .replace(/[̀-ͯ]/g, "")
    .replace(/ı/g, "i")
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-|-$/g, "");
}

/** Straight quotes → typographic: "Pathétique" → “Pathétique”, Viyana'da → Viyana’da. */
export function smartQuotes(s: string): string {
  return s
    .replace(/(^|[\s(\[|—–-])"/g, "$1“")
    .replace(/"/g, "”")
    .replace(/(^|[\s(\[|—–-])'/g, "$1‘")
    .replace(/'/g, "’");
}

/** "[[sonata form]]" → "[[sonata-form|sonata form]]"; "[[coda|koda]]" → "[[coda|koda]]". */
export function normalizeRich(s: string): string {
  return smartQuotes(s.trim()).replace(/\[\[([^\]|]+)(?:\|([^\]]+))?\]\]/g, (_, key: string, surface?: string) => {
    return `[[${slugify(key)}|${(surface ?? key).trim()}]]`;
  });
}

export function glossaryRefs(s: string): string[] {
  return [...s.matchAll(/\[\[([^\]|]+)\|/g)].map((m) => m[1]!);
}

/** "7:30" → 450, "1:02:05" → 3725. */
export function parseClock(s: string): number | null {
  const m = s.trim().match(/^(\d+):(\d{2})(?::(\d{2}))?$/);
  if (!m) return null;
  const [a, b, c] = [m[1], m[2], m[3]].map((x) => (x === undefined ? undefined : Number(x)));
  return c === undefined ? a! * 60 + b! : a! * 3600 + b! * 60 + c;
}

/**
 * Listening-stop time cell. Handles "≈ 4:30", "≈ 9:30–10:30", "≈ 9:30 to 10:30",
 * "≈ 12:30 and again shortly after", "Mid-development", "Last minute".
 */
export function parseStopTime(cell: string): Pick<ListeningStop, "startSec" | "endSec" | "approximate" | "label"> {
  let s = cell.trim();
  const approximate = s.startsWith("≈");
  s = s.replace(/^≈\s*/, "");
  const range = s.match(/^(\d+:\d{2}(?::\d{2})?)\s*(?:–|-|to)\s*(\d+:\d{2}(?::\d{2})?)(.*)$/);
  if (range) {
    const rest = range[3]!.trim();
    return { startSec: parseClock(range[1]!), endSec: parseClock(range[2]!), approximate, label: rest || null };
  }
  const single = s.match(/^(\d+:\d{2}(?::\d{2})?)(.*)$/);
  if (single) {
    const rest = single[2]!.trim();
    return { startSec: parseClock(single[1]!), endSec: null, approximate, label: rest || null };
  }
  return { startSec: null, endSec: null, approximate, label: s };
}

/** Splits a table row on "|", ignoring the "|" inside [[key|surface]] glossary marks. */
function splitRow(line: string): string[] {
  const cells: string[] = [];
  let cell = "";
  let depth = 0;
  const s = line.trim().replace(/^\|/, "").replace(/\|$/, "");
  for (let i = 0; i < s.length; i++) {
    if (s.startsWith("[[", i)) depth++;
    else if (s.startsWith("]]", i) && depth > 0) depth--;
    if (s[i] === "|" && depth === 0) {
      cells.push(cell.trim());
      cell = "";
    } else cell += s[i];
  }
  cells.push(cell.trim());
  return cells;
}

/** Parses a markdown table starting at lines[i]; returns header, rows and the next index. */
function readTable(lines: string[], i: number) {
  const header = splitRow(lines[i]!);
  i += 2; // skip the --- row
  const rows: string[][] = [];
  while (i < lines.length && lines[i]!.trim().startsWith("|")) rows.push(splitRow(lines[i++]!));
  return { header, rows, next: i };
}

interface Block {
  heading: string;
  lines: string[];
}

function splitBlocks(lines: string[], prefix: string): Block[] {
  const blocks: Block[] = [];
  let current: Block | null = null;
  for (const line of lines) {
    if (line.startsWith(prefix) && !line.startsWith(prefix + "#")) {
      current = { heading: line.slice(prefix.length).trim(), lines: [] };
      blocks.push(current);
    } else current?.lines.push(line);
  }
  return blocks;
}

const optString = (v: unknown): string | null => (v === undefined || v === null ? null : String(v));

function toSoloist(v: unknown): Soloist {
  if (v && typeof v === "object") {
    const o = v as Record<string, unknown>;
    return { name: String(o.name), role: String(o.role ?? "") };
  }
  throw new Error(`Soloist must be {name, role}, got ${JSON.stringify(v)}`);
}

function toRecording(r: Record<string, unknown>): RecordingMeta {
  const release = r.release_year;
  return {
    conductor: String(r.conductor),
    orchestra: String(r.orchestra),
    soloists: Array.isArray(r.soloists) ? r.soloists.map(toSoloist) : [],
    chorus: optString(r.chorus),
    label: optString(r.label),
    catalogueNumber: optString(r.catalogue_number),
    recorded: optString(r.recorded),
    venue: optString(r.venue),
    releaseYear: release === undefined || release === null ? null : Number(release),
    year: (r.year as number | string) ?? null,
    spotifyUrl: optString(r.spotify_url),
  };
}

function parseMeta(yamlText: string): PieceMeta {
  const y = parseYaml(yamlText) as Record<string, any>;
  return {
    id: y.id,
    composer: y.composer,
    composerDisplay: y.composer_display ?? null,
    title: smartQuotes(String(y.title)),
    catalogue: y.catalogue ?? null,
    key: y.key ?? null,
    year: Number(y.year),
    durationMin: Number(y.duration_min),
    movementCount: Number(y.movement_count),
    hook: smartQuotes(String(y.hook)),
    referenceRecording: toRecording(y.reference_recording),
    alsoRecommended: (y.also_recommended ?? []).map(toRecording),
    painting: {
      artist: y.painting.artist,
      title: smartQuotes(String(y.painting.title)),
      year: String(y.painting.year),
      collection: y.painting.collection,
      pairingNote: y.painting.pairing_note ? smartQuotes(String(y.painting.pairing_note)) : null,
      rightsFlag: y.painting.rights_flag ?? null,
    },
  };
}

const BOLD_PARA = /^\*\*(.+?)\*\*\s*(.*)$/;

function parseMovementBody(m: Movement, lines: string[]) {
  let mode: "none" | "ideas" | "stops" | "notice" = "none";
  for (let i = 0; i < lines.length; i++) {
    const line = lines[i]!.trim();
    if (!line) continue;

    if (line.startsWith("|") && mode === "stops") {
      const t = readTable(lines, i);
      for (const [time, hear, happening] of t.rows) {
        m.stops.push({ ...parseStopTime(time ?? ""), hear: normalizeRich(hear ?? ""), happening: normalizeRich(happening ?? "") });
      }
      i = t.next - 1;
      continue;
    }

    const bold = line.match(BOLD_PARA);
    if (bold) {
      const label = bold[1]!.replace(/\.$/, "");
      const rest = bold[2]!;
      if (is(label, LABELS.summary)) { m.summary = normalizeRich(rest); mode = "none"; }
      else if (is(label, LABELS.mainIdeas)) mode = "ideas";
      else if (is(label, LABELS.stops)) mode = "stops";
      else if (is(label, LABELS.notice)) mode = "notice";
      else { m.notes.push({ title: smartQuotes(label), body: normalizeRich(rest) } satisfies Note); mode = "none"; }
      continue;
    }

    if (mode === "ideas" && line.startsWith("- ")) {
      const text = line.slice(2);
      const colon = text.indexOf(":");
      const idea: MainIdea =
        colon > 0 && colon < 48 && !text.slice(0, colon).includes("[[")
          ? { name: smartQuotes(text.slice(0, colon).trim()), description: normalizeRich(text.slice(colon + 1)) }
          : { name: null, description: normalizeRich(text) };
      m.mainIdeas.push(idea);
    } else if (mode === "notice" && /^\d+\.\s/.test(line)) {
      m.notice.push(normalizeRich(line.replace(/^\d+\.\s+/, "")));
    }
  }
}

function parseMovementTable(lines: string[], movements: Map<string, Movement>) {
  const start = lines.findIndex((l) => l.trim().startsWith("|"));
  if (start < 0) return;
  const { header, rows } = readTable(lines, start);
  const cols = header.map((h) => COLUMN_ALIASES[h.toLocaleLowerCase("tr").trim()] ?? COLUMN_ALIASES[h.toLowerCase().trim()]);
  rows.forEach((row, idx) => {
    const numeral = row[0]!;
    const m = blankMovement(idx + 1, numeral, "");
    cols.forEach((col, c) => {
      const v = row[c]?.trim() || null;
      if (!col || !v) return;
      if (col === "duration") {
        m.durationApprox = v.startsWith("≈");
        m.durationSec = parseClock(v.replace(/^≈\s*/, ""));
      } else if (col === "titleOrTempo") {
        m.title = v;
      } else m[col] = v;
    });
    movements.set(numeral, m);
  });
}

function blankMovement(index: number, numeral: string, heading: string): Movement {
  return {
    index, numeral, heading,
    title: null, tempo: null, key: null, metre: null,
    durationSec: null, durationApprox: false,
    summary: null, mainIdeas: [], stops: [], notice: [], notes: [],
  };
}

function parsePiece(block: Block): ParsedPiece {
  const text = block.lines.join("\n");
  const yamlMatch = text.match(/```yaml\n([\s\S]*?)```/);
  if (!yamlMatch) throw new Error(`No yaml block in "${block.heading}"`);
  const meta = parseMeta(yamlMatch[1]!);

  const facts: string[] = [];
  let inOneLine: string | null = null;
  const movements = new Map<string, Movement>();
  const threads: Thread[] = [];

  for (const sec of splitBlocks(block.lines, "### ")) {
    if (is(sec.heading, LABELS.bigPicture)) {
      for (const l of sec.lines) {
        if (!l.startsWith("- ")) continue;
        const t = l.slice(2).trim();
        const lead = LABELS.inOneLine.find((p) => t.toLocaleLowerCase("tr").startsWith(p.toLocaleLowerCase("tr")));
        if (lead) inOneLine = normalizeRich(t.slice(lead.length).replace(/^\s*:/, ""));
        else facts.push(normalizeRich(t));
      }
    } else if (is(sec.heading, LABELS.movements)) {
      parseMovementTable(sec.lines, movements);
    } else if (is(sec.heading, LABELS.threads)) {
      for (const l of sec.lines) {
        if (!l.startsWith("- ")) continue;
        const t = l.slice(2).trim();
        const b = t.match(BOLD_PARA);
        threads.push(b ? { title: smartQuotes(b[1]!.replace(/\.$/, "")), body: normalizeRich(b[2]!) } : { title: null, body: normalizeRich(t) });
      }
    } else {
      const hm = sec.heading.match(/^([IVX]+)\.\s+(.*)$/);
      if (!hm) throw new Error(`Unknown section "${sec.heading}" in ${meta.id}`);
      const [, numeral, heading] = hm as unknown as [string, string, string];
      const m = movements.get(numeral) ?? blankMovement(movements.size + 1, numeral, heading);
      m.heading = heading;
      movements.set(numeral, m);
      parseMovementBody(m, sec.lines);
    }
  }

  const list = [...movements.values()].sort((a, b) => a.index - b.index);
  if (list.length !== meta.movementCount) {
    throw new Error(`${meta.id}: movement_count ${meta.movementCount} but found ${list.length}`);
  }
  return { meta, document: { bigPicture: { facts, inOneLine }, movements: list, threads } };
}

function parseGlossary(block: Block): GlossaryEntry[] {
  const start = block.lines.findIndex((l) => l.trim().startsWith("|"));
  const { header, rows } = readTable(block.lines, start);
  const threeCol = header.length === 3; // Turkish: Key | Terim | Tanım
  return rows.map((r) => {
    const key = r[0]!;
    return { id: slugify(key), key, term: smartQuotes(threeCol ? r[1]! : key), definition: smartQuotes(threeCol ? r[2]! : r[1]!) };
  });
}

export function parseContent(markdown: string, locale: string): ParsedContent {
  const lines = markdown.replace(/\r\n/g, "\n").split("\n");
  const pieces: ParsedPiece[] = [];
  let glossary: GlossaryEntry[] = [];
  for (const block of splitBlocks(lines, "## ")) {
    if (/^\d+\.\s/.test(block.heading)) pieces.push(parsePiece(block));
    else if (is(block.heading, LABELS.glossary)) glossary = parseGlossary(block);
  }
  return { locale, pieces, glossary };
}

/** Problems that should block publishing: missing glossary terms, empty movements. */
export function validateContent(c: ParsedContent): string[] {
  const problems: string[] = [];
  const ids = new Set(c.glossary.map((g) => g.id));
  for (const { meta, document } of c.pieces) {
    const texts = [
      ...document.bigPicture.facts,
      document.bigPicture.inOneLine ?? "",
      ...document.threads.map((t) => t.body),
      ...document.movements.flatMap((m) => [
        m.summary ?? "",
        ...m.mainIdeas.map((i) => i.description),
        ...m.stops.flatMap((s) => [s.hear, s.happening]),
        ...m.notice,
        ...m.notes.map((n) => n.body),
      ]),
    ];
    for (const ref of texts.flatMap(glossaryRefs)) {
      if (!ids.has(ref)) problems.push(`${c.locale}/${meta.id}: glossary term "${ref}" is not defined`);
    }
    for (const m of document.movements) {
      if (m.stops.length === 0) problems.push(`${c.locale}/${meta.id}: movement ${m.numeral} has no listening stops`);
    }
  }
  return [...new Set(problems)];
}
