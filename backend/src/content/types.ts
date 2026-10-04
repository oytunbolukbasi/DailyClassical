/**
 * Shared shape of a parsed piece. The same JSON is stored in
 * piece_localizations.document and returned by the API, so the iOS
 * models mirror this file (ios/DailyClassical/Core/Models/PieceDocument.swift).
 *
 * Inline text fields ("rich" strings) may contain:
 *   [[term-id|surface text]]  a tappable glossary term
 *   *emphasis*                italic (titles of works, dynamics such as *pppppp*)
 */
export type Rich = string;

export interface PieceDocument {
  bigPicture: { facts: Rich[]; inOneLine: Rich | null };
  movements: Movement[];
  threads: Thread[];
}

export interface Movement {
  index: number; // 1-based
  numeral: string; // "I"
  heading: string; // text after the numeral in the section heading: "Molto allegro"
  title: string | null; // Berlioz / Mahler style named movements
  tempo: string | null;
  key: string | null;
  metre: string | null;
  durationSec: number | null;
  durationApprox: boolean;
  summary: Rich | null;
  mainIdeas: MainIdea[];
  stops: ListeningStop[];
  notice: Rich[];
  notes: Note[]; // "In this recording", "A hidden trick", …
}

export interface MainIdea {
  name: string | null; // "Theme 1, unrest"
  description: Rich;
}

export interface ListeningStop {
  /** Seconds from the start of the movement in the reference recording. */
  startSec: number | null;
  endSec: number | null;
  approximate: boolean;
  /** Shown instead of a time ("Mid-development") or after it ("and again shortly after"). */
  label: string | null;
  hear: Rich;
  happening: Rich;
}

export interface Note {
  title: string;
  body: Rich;
}

export interface Thread {
  title: string | null;
  body: Rich;
}

export interface PieceMeta {
  id: string;
  composer: string;
  composerDisplay: string | null;
  title: string;
  catalogue: string | null;
  key: string | null;
  year: number;
  durationMin: number;
  movementCount: number;
  hook: string;
  referenceRecording: RecordingMeta;
  alsoRecommended: RecordingMeta[];
  painting: PaintingMeta;
}

export interface Soloist {
  name: string;
  role: string; // "soprano", "horn", …
}

export interface RecordingMeta {
  conductor: string;
  orchestra: string;
  soloists: Soloist[];
  chorus: string | null;
  label: string | null;
  catalogueNumber: string | null;
  /** Recording date as written in the source ("October 1962", "3–9 August 2007"). */
  recorded: string | null;
  venue: string | null;
  releaseYear: number | null;
  /** Display year shown next to the recording (usually the release year). */
  year: number | string | null;
  spotifyUrl: string | null;
}

export interface PaintingMeta {
  artist: string;
  title: string;
  year: string;
  collection: string;
  pairingNote: string | null;
  rightsFlag: string | null;
}

/** One entry of content/paintings.yaml (image asset + licence), keyed by piece id. */
export interface PaintingAsset {
  image_url?: string | null;
  source_url?: string | null;
  commons_page?: string | null;
  width?: number | null;
  height?: number | null;
  medium?: string | null;
  license?: string | null;
  credit_line?: string | null;
  rights_status?: "public_domain" | "unverified" | "restricted" | null;
}

export interface ParsedPiece {
  meta: PieceMeta;
  document: PieceDocument;
}

export interface GlossaryEntry {
  id: string;
  key: string; // original English key
  term: string;
  definition: string;
}

export interface ParsedContent {
  locale: string;
  pieces: ParsedPiece[];
  glossary: GlossaryEntry[];
}
