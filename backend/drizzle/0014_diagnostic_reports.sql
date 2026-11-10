CREATE TABLE "diagnostic_reports" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"received_at" timestamp with time zone DEFAULT now() NOT NULL,
	"happened_at" timestamp with time zone,
	"kind" text NOT NULL,
	"signature" text NOT NULL,
	"app_version" text NOT NULL,
	"build" text NOT NULL,
	"os_version" text NOT NULL,
	"device" text NOT NULL,
	"details" jsonb NOT NULL,
	"call_stack" jsonb,
	"is_test" boolean DEFAULT false NOT NULL
);
--> statement-breakpoint
CREATE INDEX "diagnostic_reports_signature_idx" ON "diagnostic_reports" USING btree ("signature","received_at");