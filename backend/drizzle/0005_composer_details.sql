ALTER TABLE "composer_localizations" ADD COLUMN "nationality" text;--> statement-breakpoint
ALTER TABLE "composer_localizations" ADD COLUMN "facts" jsonb;--> statement-breakpoint
ALTER TABLE "composer_localizations" ADD COLUMN "portrait_caption" jsonb;--> statement-breakpoint
ALTER TABLE "composers" ADD COLUMN "era" "era";--> statement-breakpoint
ALTER TABLE "composers" ADD COLUMN "portrait" jsonb;