import {
  boolean,
  date,
  integer,
  jsonb,
  pgEnum,
  pgTable,
  primaryKey,
  smallint,
  text,
  timestamp,
  uuid,
} from "drizzle-orm/pg-core";
import type { PieceDocument } from "../content/types.js";

/**
 * Content model
 * -------------
 * Language-neutral facts live on the base tables (pieces, recordings, paintings).
 * Everything a reader sees in a language lives in a *_localizations table keyed by
 * (id, locale). The long-form guide is one structured JSON document per locale
 * (PieceDocument), so the layout never depends on hand-tuned text.
 */

export const locales = ["en", "tr"] as const;
export type Locale = (typeof locales)[number];

export const localizationStatus = pgEnum("localization_status", ["draft", "review", "published"]);
export const recordingRole = pgEnum("recording_role", ["reference", "alternative"]);
export const era = pgEnum("era", ["baroque", "classical", "romantic", "late_romantic", "modern"]);

/** Language-neutral half of a composer portrait (the caption text is per locale). */
export type ComposerPortraitAsset = {
  imageUrl: string;
  sourceUrl: string | null;
  width: number | null;
  height: number | null;
  license: string | null;
  focalY: number; // 0–1, CSS object-position y for the cover crop
  year: string | null; // label: "1893"
};
/** Localized half: "Nikolai Kuznetsov, *Portrait of Tchaikovsky*, 1893. State Tretyakov Gallery, Moscow." */
export type ComposerPortraitCaption = { artist: string; title: string; collection: string | null };
export type ComposerFacts = { born: string | null; died: string | null; symphonies: string | null; bestKnownFor: string | null };

export const composers = pgTable("composers", {
  id: text("id").primaryKey(), // slug: "tchaikovsky"
  birthYear: smallint("birth_year"),
  deathYear: smallint("death_year"),
  sortName: text("sort_name").notNull(), // "Tchaikovsky, Pyotr Ilyich"
  era: era("era"),
  portrait: jsonb("portrait").$type<ComposerPortraitAsset>(), // null = no safely public-domain portrait
});

export const composerLocalizations = pgTable(
  "composer_localizations",
  {
    composerId: text("composer_id").notNull().references(() => composers.id, { onDelete: "cascade" }),
    locale: text("locale").notNull(),
    name: text("name").notNull(), // "Pyotr Ilyich Tchaikovsky" / "Pyotr İlyiç Çaykovski"
    shortName: text("short_name").notNull(), // "Tchaikovsky" / "Çaykovski"
    nationality: text("nationality"), // "Russian" / "Rus"
    facts: jsonb("facts").$type<ComposerFacts>(),
    bio: text("bio"), // three paragraphs separated by "\n\n"; [[glossary-id|surface]] and *italics*
    portraitCaption: jsonb("portrait_caption").$type<ComposerPortraitCaption>(),
  },
  (t) => [primaryKey({ columns: [t.composerId, t.locale] })],
);

export const pieces = pgTable("pieces", {
  id: text("id").primaryKey(), // slug: "tchaikovsky-symphony-6"
  composerId: text("composer_id").notNull().references(() => composers.id),
  catalogue: text("catalogue"), // "Op. 74"
  year: smallint("year").notNull(),
  durationMin: smallint("duration_min").notNull(),
  movementCount: smallint("movement_count").notNull(),
  era: era("era").notNull(),
  isPublished: boolean("is_published").notNull().default(false),
  createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
  updatedAt: timestamp("updated_at", { withTimezone: true }).notNull().defaultNow(),
});

export const pieceLocalizations = pgTable(
  "piece_localizations",
  {
    pieceId: text("piece_id").notNull().references(() => pieces.id, { onDelete: "cascade" }),
    locale: text("locale").notNull(),
    status: localizationStatus("status").notNull().default("draft"),
    title: text("title").notNull(), // "Symphony No. 6 in B minor, Op. 74, “Pathétique”"
    keyLabel: text("key_label"), // "B minor" / "Si minör"
    hook: text("hook").notNull(),
    document: jsonb("document").$type<PieceDocument>().notNull(),
    updatedAt: timestamp("updated_at", { withTimezone: true }).notNull().defaultNow(),
  },
  (t) => [primaryKey({ columns: [t.pieceId, t.locale] })],
);

export const recordings = pgTable("recordings", {
  id: uuid("id").primaryKey().defaultRandom(),
  pieceId: text("piece_id").notNull().references(() => pieces.id, { onDelete: "cascade" }),
  role: recordingRole("role").notNull(),
  sortOrder: smallint("sort_order").notNull().default(0),
  conductor: text("conductor").notNull(),
  orchestra: text("orchestra").notNull(),
  soloists: jsonb("soloists").$type<{ name: string; role: string }[]>(),
  chorus: text("chorus"),
  label: text("label"),
  recordedYear: text("recorded_year"), // as written in the source: "1962", "October 1962", "3–9 August 2007"
  releaseYear: smallint("release_year"),
  catalogueNumber: text("catalogue_number"),
  venue: text("venue"), // "Musikverein, Vienna"
  spotifyAlbumId: text("spotify_album_id"),
  /** Set by a human after checking credits and the Spotify link against the album. */
  verifiedAt: timestamp("verified_at", { withTimezone: true }),
});

export const paintings = pgTable("paintings", {
  id: uuid("id").primaryKey().defaultRandom(),
  pieceId: text("piece_id").notNull().unique().references(() => pieces.id, { onDelete: "cascade" }),
  artist: text("artist").notNull(),
  yearLabel: text("year_label").notNull(), // "1894", "c. 1932", "1910–1915"
  medium: text("medium"),
  imageUrl: text("image_url"), // our CDN copy
  sourceUrl: text("source_url"), // museum / Commons page
  width: integer("width"),
  height: integer("height"),
  rightsStatus: text("rights_status").notNull().default("unverified"), // public_domain | unverified | restricted
  rightsNote: text("rights_note"),
});

export const paintingLocalizations = pgTable(
  "painting_localizations",
  {
    paintingId: uuid("painting_id").notNull().references(() => paintings.id, { onDelete: "cascade" }),
    locale: text("locale").notNull(),
    title: text("title").notNull(),
    /** "exhibited 1812" / "1812'de sergilendi"; falls back to paintings.year_label. */
    yearLabel: text("year_label"),
    collection: text("collection").notNull(),
    pairingNote: text("pairing_note"),
  },
  (t) => [primaryKey({ columns: [t.paintingId, t.locale] })],
);

export const glossaryTerms = pgTable("glossary_terms", {
  id: text("id").primaryKey(), // slug of the English key: "sonata-form"
});

export const glossaryLocalizations = pgTable(
  "glossary_localizations",
  {
    termId: text("term_id").notNull().references(() => glossaryTerms.id, { onDelete: "cascade" }),
    locale: text("locale").notNull(),
    term: text("term").notNull(),
    definition: text("definition").notNull(),
  },
  (t) => [primaryKey({ columns: [t.termId, t.locale] })],
);

/** Which piece is "Today" on a given calendar date. Falls back to rotation when empty. */
export const dailySchedule = pgTable("daily_schedule", {
  day: date("day").primaryKey(),
  pieceId: text("piece_id").notNull().references(() => pieces.id),
});

// ---- Accounts (email + password only; favourites are the only signed-in feature) ----

export const users = pgTable("users", {
  id: uuid("id").primaryKey().defaultRandom(),
  email: text("email").notNull().unique(), // stored lower-cased
  passwordHash: text("password_hash").notNull(),
  locale: text("locale").notNull().default("en"),
  createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
  /** Set on password reset; tokens issued before it are rejected (signs out other devices). */
  passwordChangedAt: timestamp("password_changed_at", { withTimezone: true }),
  /** Null until the 6-digit code from the sign-up email is entered; unverified users can't sign in. */
  emailVerifiedAt: timestamp("email_verified_at", { withTimezone: true }),
  /**
   * Complimentary Premium (testers, press). App Store purchases stay on the Apple ID; this
   * only adds access for this account. Null = none; a far-future date = lifetime.
   */
  compPremiumUntil: timestamp("comp_premium_until", { withTimezone: true }),
});

/** One live sign-up code per user; only its hash is stored. */
export const emailVerificationCodes = pgTable("email_verification_codes", {
  userId: uuid("user_id").primaryKey().references(() => users.id, { onDelete: "cascade" }),
  codeHash: text("code_hash").notNull(),
  expiresAt: timestamp("expires_at", { withTimezone: true }).notNull(),
  attempts: smallint("attempts").notNull().default(0),
  sentAt: timestamp("sent_at", { withTimezone: true }).notNull().defaultNow(),
});

export const favourites = pgTable(
  "favourites",
  {
    userId: uuid("user_id").notNull().references(() => users.id, { onDelete: "cascade" }),
    pieceId: text("piece_id").notNull().references(() => pieces.id, { onDelete: "cascade" }),
    createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
  },
  (t) => [primaryKey({ columns: [t.userId, t.pieceId] })],
);

/**
 * Single-use password reset links. Only a SHA-256 hash of the token is stored, so a
 * database leak cannot be turned into account takeovers. Links expire after 30 minutes
 * (the app's "Check your email" copy depends on that number).
 */
export const passwordResetTokens = pgTable("password_reset_tokens", {
  id: uuid("id").primaryKey().defaultRandom(),
  userId: uuid("user_id").notNull().references(() => users.id, { onDelete: "cascade" }),
  tokenHash: text("token_hash").notNull().unique(),
  expiresAt: timestamp("expires_at", { withTimezone: true }).notNull(),
  usedAt: timestamp("used_at", { withTimezone: true }),
  createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
});
