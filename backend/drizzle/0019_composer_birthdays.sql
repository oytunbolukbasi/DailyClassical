ALTER TABLE "composer_localizations" ADD COLUMN "birthday_note" text;--> statement-breakpoint
ALTER TABLE "composer_localizations" ADD COLUMN "birthday_line" text;--> statement-breakpoint
ALTER TABLE "composer_localizations" ADD COLUMN "short_genitive" text;--> statement-breakpoint
ALTER TABLE "composers" ADD COLUMN "birthday" text;--> statement-breakpoint
ALTER TABLE "composers" ADD COLUMN "birthday_basis" text;