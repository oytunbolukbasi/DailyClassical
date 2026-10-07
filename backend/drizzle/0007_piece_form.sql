ALTER TABLE "recordings" ALTER COLUMN "conductor" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "recordings" ALTER COLUMN "orchestra" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "pieces" ADD COLUMN "form" text DEFAULT 'symphony' NOT NULL;