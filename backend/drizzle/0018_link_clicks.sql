CREATE TABLE "link_clicks" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"at" timestamp with time zone DEFAULT now() NOT NULL,
	"source" text,
	"medium" text,
	"campaign" text,
	"content" text,
	"ct" text NOT NULL,
	"device" text NOT NULL,
	"in_app" text,
	"referrer" text,
	"visitor" text NOT NULL
);
--> statement-breakpoint
CREATE INDEX "link_clicks_at_idx" ON "link_clicks" USING btree ("at");