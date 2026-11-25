import {
  boolean,
  date,
  index,
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
export const era = pgEnum("era", ["renaissance", "baroque", "classical", "romantic", "late_romantic", "modern"]);

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
  // The day the app celebrates ("MM-DD", content/composers.yaml); null when unknown. basis: null = a
  // documented (Gregorian) birth date, "baptism", or "old_style" (the traditional Julian date).
  birthday: text("birthday"),
  birthdayBasis: text("birthday_basis"),
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
    birthdayNote: text("birthday_note"), // one or two sentences for the birthday sheet
    birthdayLine: text("birthday_line"), // "Born on this day in 1756, in Salzburg." (hand-written: Turkish suffixes)
    shortGenitive: text("short_genitive"), // TR only: "Mozart’ın", for "Mozart’ın doğum günü"
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
  form: text("form").notNull().default("symphony"), // PIECE_FORMS in src/content/types.ts
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
  conductor: text("conductor"), // null for solo / chamber recordings
  orchestra: text("orchestra"),
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
    short: text("short"), // one line for the glossary list and search results; null when the content has none
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
  /** Null for accounts created with Sign in with Apple (they can add one via password reset). */
  passwordHash: text("password_hash"),
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
  /** Sign in with Apple: the stable user id (`sub`) Apple issues for this app. */
  appleSub: text("apple_sub").unique(),
  /** Apple refresh token, kept only to revoke the Apple link when the account is deleted. */
  appleRefreshToken: text("apple_refresh_token"),
  /**
   * App Store Premium as RevenueCat reports it (webhook, routes/revenuecat.ts), for reading only:
   * the app unlocks Premium from the Apple ID, never from these. Null until a purchase is made
   * while signed in to this account. plan: monthly | lifetime; status: trial | active | cancelled |
   * billing_issue | expired | refunded (lib/revenuecat.ts).
   */
  premiumPlan: text("premium_plan"),
  premiumStatus: text("premium_status"),
  /** End of the current period; null for lifetime. */
  premiumExpiresAt: timestamp("premium_expires_at", { withTimezone: true }),
  /** Time of the event that set the state; older events arriving late are ignored. */
  premiumUpdatedAt: timestamp("premium_updated_at", { withTimezone: true }),
  /** True when the state came from a sandbox (TestFlight / Xcode) purchase. */
  premiumSandbox: boolean("premium_sandbox").notNull().default(false),
});

/** One live sign-up code per user; only its hash is stored. */
export const emailVerificationCodes = pgTable("email_verification_codes", {
  userId: uuid("user_id").primaryKey().references(() => users.id, { onDelete: "cascade" }),
  codeHash: text("code_hash").notNull(),
  expiresAt: timestamp("expires_at", { withTimezone: true }).notNull(),
  attempts: smallint("attempts").notNull().default(0),
  sentAt: timestamp("sent_at", { withTimezone: true }).notNull().defaultNow(),
});

/** A signed-in account's pending change of address: the code goes to the new address. */
export const emailChangeCodes = pgTable("email_change_codes", {
  userId: uuid("user_id").primaryKey().references(() => users.id, { onDelete: "cascade" }),
  newEmail: text("new_email").notNull(),
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

/**
 * Fixed-window request counters for the auth endpoints (src/lib/rate-limit.ts). One row per
 * action + subject; the key carries only a hash of the IP or email. Rows past expires_at are
 * stale and get deleted opportunistically.
 */
export const rateLimits = pgTable(
  "rate_limit",
  {
    key: text("key").primaryKey(), // "login:ip_email:<sha256 prefix>"
    windowStart: timestamp("window_start", { withTimezone: true }).notNull(),
    count: integer("count").notNull(),
    expiresAt: timestamp("expires_at", { withTimezone: true }).notNull(),
  },
  (t) => [index("rate_limit_expires_at_idx").on(t.expiresAt)],
);

// ---- Anonymous usage counts (POST /v1/events) and the admin page ----

/**
 * One row per app install. The id is a random UUID the app makes on first launch: it is not tied
 * to an account, a device identifier or an advertising id, and nothing here links it to a person.
 * Test builds (Xcode, TestFlight) are flagged so the admin page can leave them out.
 */
export const appInstalls = pgTable("app_installs", {
  installId: uuid("install_id").primaryKey(),
  firstSeen: date("first_seen").notNull(),
  lastSeen: date("last_seen").notNull(),
  appVersion: text("app_version"),
  locale: text("locale"),
  isTest: boolean("is_test").notNull().default(false),
});

/** Days an install opened the app (DAU / MAU). Rows older than 400 days are deleted. */
export const appInstallDays = pgTable(
  "app_install_days",
  {
    installId: uuid("install_id").notNull().references(() => appInstalls.installId, { onDelete: "cascade" }),
    day: date("day").notNull(),
  },
  (t) => [primaryKey({ columns: [t.installId, t.day] }), index("app_install_days_day_idx").on(t.day)],
);

/** Per install, piece and day: how often the piece page opened and "Open in Spotify" was tapped. */
export const pieceActivity = pgTable(
  "piece_activity",
  {
    installId: uuid("install_id").notNull().references(() => appInstalls.installId, { onDelete: "cascade" }),
    pieceId: text("piece_id").notNull(),
    day: date("day").notNull(),
    opens: integer("opens").notNull().default(0),
    spotifyTaps: integer("spotify_taps").notNull().default(0),
  },
  (t) => [primaryKey({ columns: [t.installId, t.pieceId, t.day] }), index("piece_activity_piece_idx").on(t.pieceId, t.day)],
);

/**
 * Per install, prompt, action and day: how often the rating card ("rate") or the widget tip
 * ("widget") was shown and answered ("shown", "yes", "later"). The admin page counts installs.
 */
export const promptEvents = pgTable(
  "prompt_events",
  {
    installId: uuid("install_id").notNull().references(() => appInstalls.installId, { onDelete: "cascade" }),
    prompt: text("prompt").notNull(),
    action: text("action").notNull(),
    day: date("day").notNull(),
    count: integer("count").notNull().default(0),
  },
  (t) => [primaryKey({ columns: [t.installId, t.prompt, t.action, t.day] })],
);

/**
 * MetricKit crash, hang, launch, CPU and disk-write reports (POST /v1/diagnostics). No install or
 * account id: versions, device model, a few figures and the call stack tree. `signature` groups
 * reports of the same fault (routes/diagnostics.ts). Rows older than 180 days are deleted.
 */
export const diagnosticReports = pgTable(
  "diagnostic_reports",
  {
    id: uuid("id").primaryKey().defaultRandom(),
    receivedAt: timestamp("received_at", { withTimezone: true }).notNull().defaultNow(),
    happenedAt: timestamp("happened_at", { withTimezone: true }),
    kind: text("kind").notNull(),
    signature: text("signature").notNull(),
    appVersion: text("app_version").notNull(),
    build: text("build").notNull(),
    osVersion: text("os_version").notNull(),
    device: text("device").notNull(),
    details: jsonb("details").notNull(),
    callStack: jsonb("call_stack"),
    isTest: boolean("is_test").notNull().default(false),
  },
  (t) => [index("diagnostic_reports_signature_idx").on(t.signature, t.receivedAt)],
);

/**
 * Copies of winning ad attribution postbacks (SKAdNetwork and AdAttributionKit) that iOS sends to
 * https://dailyclassical.co/.well-known/... (routes/attribution.ts): which ad network and campaign
 * (source identifier) an install came from, and how far it got (conversion value). No user data.
 */
export const adPostbacks = pgTable(
  "ad_postbacks",
  {
    id: uuid("id").primaryKey().defaultRandom(),
    receivedAt: timestamp("received_at", { withTimezone: true }).notNull().defaultNow(),
    framework: text("framework").notNull(),            // skadnetwork | adattributionkit
    adNetworkId: text("ad_network_id"),
    sourceIdentifier: text("source_identifier"),      // the campaign, as the ad network encoded it
    conversionType: text("conversion_type"),          // download | redownload | reengagement
    fineValue: integer("fine_value"),
    coarseValue: text("coarse_value"),
    postbackIndex: integer("postback_index"),         // 0 = first window (0–2 days), 1 and 2 later
    raw: jsonb("raw").notNull(),
  },
  (t) => [index("ad_postbacks_received_idx").on(t.receivedAt)],
);

/** One live sign-in code per admin address (ADMIN_EMAILS); only its keyed hash is stored. */
export const adminLoginCodes = pgTable("admin_login_codes", {
  email: text("email").primaryKey(),
  codeHash: text("code_hash").notNull(),
  expiresAt: timestamp("expires_at", { withTimezone: true }).notNull(),
  attempts: smallint("attempts").notNull().default(0),
  sentAt: timestamp("sent_at", { withTimezone: true }).notNull().defaultNow(),
});

/**
 * Every RevenueCat webhook event as received (routes/revenuecat.ts), keyed by RevenueCat's event id
 * so retries are stored once. user_id is set when the event names one of our accounts.
 */
export const revenuecatEvents = pgTable(
  "revenuecat_events",
  {
    id: text("id").primaryKey(),
    receivedAt: timestamp("received_at", { withTimezone: true }).notNull().defaultNow(),
    type: text("type").notNull(),
    appUserId: text("app_user_id"),
    userId: uuid("user_id").references(() => users.id, { onDelete: "set null" }),
    productId: text("product_id"),
    environment: text("environment"),
    raw: jsonb("raw").notNull(),
  },
  (t) => [index("revenuecat_events_user_idx").on(t.userId)],
);

/**
 * Clicks on dailyclassical.co/app (routes/app-link.ts), with the link's UTM tags. No address or
 * device id: `visitor` is a keyed hash of address, user agent and day, so it only tells repeat
 * clicks apart within one day. Link previews (bots) are stored but left out of the counts.
 */
export const linkClicks = pgTable(
  "link_clicks",
  {
    id: uuid("id").primaryKey().defaultRandom(),
    at: timestamp("at", { withTimezone: true }).notNull().defaultNow(),
    source: text("source"),
    medium: text("medium"),
    campaign: text("campaign"),
    content: text("content"),
    ct: text("ct").notNull(),                 // the App Store campaign token sent on
    device: text("device").notNull(),         // ios | android | desktop | bot
    inApp: text("in_app"),                    // instagram, facebook, … (in-app browser)
    referrer: text("referrer"),               // host only
    visitor: text("visitor").notNull(),
  },
  (t) => [index("link_clicks_at_idx").on(t.at)],
);

/**
 * Push notifications from our own server (lib/apns.ts, routes/push.ts). One row per APNs device
 * token: the app sends it when the reader has allowed notifications (the permission is asked only
 * in the reminder flow). `environment` is where the token is valid: Xcode builds get sandbox
 * tokens, TestFlight and App Store builds production ones. A token Apple reports as no longer
 * valid is deleted.
 */
export const pushDevices = pgTable(
  "push_devices",
  {
    token: text("token").primaryKey(),
    environment: text("environment").notNull(),   // production | sandbox
    installId: uuid("install_id"),
    userId: uuid("user_id").references(() => users.id, { onDelete: "set null" }),
    locale: text("locale").notNull(),             // en | tr
    isPremium: boolean("is_premium").notNull().default(false),
    appVersion: text("app_version"),
    isTest: boolean("is_test").notNull().default(false),
    createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
    updatedAt: timestamp("updated_at", { withTimezone: true }).notNull().defaultNow(),
  },
  (t) => [index("push_devices_user_idx").on(t.userId)],
);

/**
 * A push sent from /admin/messages: the same message in each language (a device gets its
 * language's text; a language left empty is not sent), an optional link (dailyclassical://… or
 * https://…) and image. `status`: scheduled → sending → sent, or cancelled. The sender takes a
 * campaign with one UPDATE … WHERE status = 'scheduled', so two instances never both send it.
 */
export const pushCampaigns = pgTable(
  "push_campaigns",
  {
    id: uuid("id").primaryKey().defaultRandom(),
    createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
    createdBy: text("created_by").notNull(),
    titleEn: text("title_en"),
    bodyEn: text("body_en"),
    titleTr: text("title_tr"),
    bodyTr: text("body_tr"),
    link: text("link"),
    imageUrl: text("image_url"),
    audience: text("audience").notNull(),         // all | free | premium
    testOnly: boolean("test_only").notNull().default(false),
    sendAt: timestamp("send_at", { withTimezone: true }).notNull(),
    status: text("status").notNull().default("scheduled"),
    sentAt: timestamp("sent_at", { withTimezone: true }),
    sentCount: integer("sent_count").notNull().default(0),
    failedCount: integer("failed_count").notNull().default(0),
    openedCount: integer("opened_count").notNull().default(0),
  },
  (t) => [index("push_campaigns_status_idx").on(t.status, t.sendAt)],
);

/**
 * In-app messages: a card the app shows once per message when it opens (GET /v1/messages),
 * between `startsAt` and `endsAt`, to its audience and from `minAppVersion`. Text per language;
 * a language left empty is not shown in that language.
 */
export const inAppMessages = pgTable("in_app_messages", {
  id: uuid("id").primaryKey().defaultRandom(),
  createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
  createdBy: text("created_by").notNull(),
  titleEn: text("title_en"),
  bodyEn: text("body_en"),
  buttonEn: text("button_en"),
  titleTr: text("title_tr"),
  bodyTr: text("body_tr"),
  buttonTr: text("button_tr"),
  link: text("link"),
  imageUrl: text("image_url"),
  audience: text("audience").notNull(),           // all | free | premium
  testOnly: boolean("test_only").notNull().default(false),
  minAppVersion: text("min_app_version"),
  startsAt: timestamp("starts_at", { withTimezone: true }).notNull(),
  endsAt: timestamp("ends_at", { withTimezone: true }),
  active: boolean("active").notNull().default(true),
  shownCount: integer("shown_count").notNull().default(0),
  tappedCount: integer("tapped_count").notNull().default(0),
});
