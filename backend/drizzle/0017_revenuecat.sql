CREATE TABLE "revenuecat_events" (
	"id" text PRIMARY KEY NOT NULL,
	"received_at" timestamp with time zone DEFAULT now() NOT NULL,
	"type" text NOT NULL,
	"app_user_id" text,
	"user_id" uuid,
	"product_id" text,
	"environment" text,
	"raw" jsonb NOT NULL
);
--> statement-breakpoint
ALTER TABLE "users" ADD COLUMN "premium_plan" text;--> statement-breakpoint
ALTER TABLE "users" ADD COLUMN "premium_status" text;--> statement-breakpoint
ALTER TABLE "users" ADD COLUMN "premium_expires_at" timestamp with time zone;--> statement-breakpoint
ALTER TABLE "users" ADD COLUMN "premium_updated_at" timestamp with time zone;--> statement-breakpoint
ALTER TABLE "users" ADD COLUMN "premium_sandbox" boolean DEFAULT false NOT NULL;--> statement-breakpoint
ALTER TABLE "revenuecat_events" ADD CONSTRAINT "revenuecat_events_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "revenuecat_events_user_idx" ON "revenuecat_events" USING btree ("user_id");