CREATE TABLE "ad_postbacks" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"received_at" timestamp with time zone DEFAULT now() NOT NULL,
	"framework" text NOT NULL,
	"ad_network_id" text,
	"source_identifier" text,
	"conversion_type" text,
	"fine_value" integer,
	"coarse_value" text,
	"postback_index" integer,
	"raw" jsonb NOT NULL
);
--> statement-breakpoint
CREATE INDEX "ad_postbacks_received_idx" ON "ad_postbacks" USING btree ("received_at");