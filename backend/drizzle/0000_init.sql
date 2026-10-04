CREATE TYPE "public"."era" AS ENUM('baroque', 'classical', 'romantic', 'late_romantic', 'modern');--> statement-breakpoint
CREATE TYPE "public"."localization_status" AS ENUM('draft', 'review', 'published');--> statement-breakpoint
CREATE TYPE "public"."recording_role" AS ENUM('reference', 'alternative');--> statement-breakpoint
CREATE TABLE "composer_localizations" (
	"composer_id" text NOT NULL,
	"locale" text NOT NULL,
	"name" text NOT NULL,
	"short_name" text NOT NULL,
	"bio" text,
	CONSTRAINT "composer_localizations_composer_id_locale_pk" PRIMARY KEY("composer_id","locale")
);
--> statement-breakpoint
CREATE TABLE "composers" (
	"id" text PRIMARY KEY NOT NULL,
	"birth_year" smallint,
	"death_year" smallint,
	"sort_name" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE "daily_schedule" (
	"day" date PRIMARY KEY NOT NULL,
	"piece_id" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE "favourites" (
	"user_id" uuid NOT NULL,
	"piece_id" text NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "favourites_user_id_piece_id_pk" PRIMARY KEY("user_id","piece_id")
);
--> statement-breakpoint
CREATE TABLE "glossary_localizations" (
	"term_id" text NOT NULL,
	"locale" text NOT NULL,
	"term" text NOT NULL,
	"definition" text NOT NULL,
	CONSTRAINT "glossary_localizations_term_id_locale_pk" PRIMARY KEY("term_id","locale")
);
--> statement-breakpoint
CREATE TABLE "glossary_terms" (
	"id" text PRIMARY KEY NOT NULL
);
--> statement-breakpoint
CREATE TABLE "painting_localizations" (
	"painting_id" uuid NOT NULL,
	"locale" text NOT NULL,
	"title" text NOT NULL,
	"collection" text NOT NULL,
	"pairing_note" text,
	CONSTRAINT "painting_localizations_painting_id_locale_pk" PRIMARY KEY("painting_id","locale")
);
--> statement-breakpoint
CREATE TABLE "paintings" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"piece_id" text NOT NULL,
	"artist" text NOT NULL,
	"year_label" text NOT NULL,
	"medium" text,
	"image_url" text,
	"source_url" text,
	"width" integer,
	"height" integer,
	"rights_status" text DEFAULT 'unverified' NOT NULL,
	"rights_note" text,
	CONSTRAINT "paintings_piece_id_unique" UNIQUE("piece_id")
);
--> statement-breakpoint
CREATE TABLE "piece_localizations" (
	"piece_id" text NOT NULL,
	"locale" text NOT NULL,
	"status" "localization_status" DEFAULT 'draft' NOT NULL,
	"title" text NOT NULL,
	"key_label" text,
	"hook" text NOT NULL,
	"document" jsonb NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "piece_localizations_piece_id_locale_pk" PRIMARY KEY("piece_id","locale")
);
--> statement-breakpoint
CREATE TABLE "pieces" (
	"id" text PRIMARY KEY NOT NULL,
	"composer_id" text NOT NULL,
	"catalogue" text,
	"year" smallint NOT NULL,
	"duration_min" smallint NOT NULL,
	"movement_count" smallint NOT NULL,
	"era" "era" NOT NULL,
	"is_published" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "recordings" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"piece_id" text NOT NULL,
	"role" "recording_role" NOT NULL,
	"sort_order" smallint DEFAULT 0 NOT NULL,
	"conductor" text NOT NULL,
	"orchestra" text NOT NULL,
	"soloists" jsonb,
	"chorus" text,
	"label" text,
	"recorded_year" text,
	"release_year" smallint,
	"catalogue_number" text,
	"spotify_album_id" text,
	"verified_at" timestamp with time zone
);
--> statement-breakpoint
CREATE TABLE "users" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"email" text NOT NULL,
	"password_hash" text NOT NULL,
	"locale" text DEFAULT 'en' NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "users_email_unique" UNIQUE("email")
);
--> statement-breakpoint
ALTER TABLE "composer_localizations" ADD CONSTRAINT "composer_localizations_composer_id_composers_id_fk" FOREIGN KEY ("composer_id") REFERENCES "public"."composers"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "daily_schedule" ADD CONSTRAINT "daily_schedule_piece_id_pieces_id_fk" FOREIGN KEY ("piece_id") REFERENCES "public"."pieces"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "favourites" ADD CONSTRAINT "favourites_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "favourites" ADD CONSTRAINT "favourites_piece_id_pieces_id_fk" FOREIGN KEY ("piece_id") REFERENCES "public"."pieces"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "glossary_localizations" ADD CONSTRAINT "glossary_localizations_term_id_glossary_terms_id_fk" FOREIGN KEY ("term_id") REFERENCES "public"."glossary_terms"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "painting_localizations" ADD CONSTRAINT "painting_localizations_painting_id_paintings_id_fk" FOREIGN KEY ("painting_id") REFERENCES "public"."paintings"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "paintings" ADD CONSTRAINT "paintings_piece_id_pieces_id_fk" FOREIGN KEY ("piece_id") REFERENCES "public"."pieces"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "piece_localizations" ADD CONSTRAINT "piece_localizations_piece_id_pieces_id_fk" FOREIGN KEY ("piece_id") REFERENCES "public"."pieces"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "pieces" ADD CONSTRAINT "pieces_composer_id_composers_id_fk" FOREIGN KEY ("composer_id") REFERENCES "public"."composers"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "recordings" ADD CONSTRAINT "recordings_piece_id_pieces_id_fk" FOREIGN KEY ("piece_id") REFERENCES "public"."pieces"("id") ON DELETE cascade ON UPDATE no action;