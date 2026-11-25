CREATE TABLE "in_app_messages" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"created_by" text NOT NULL,
	"title_en" text,
	"body_en" text,
	"button_en" text,
	"title_tr" text,
	"body_tr" text,
	"button_tr" text,
	"link" text,
	"image_url" text,
	"audience" text NOT NULL,
	"test_only" boolean DEFAULT false NOT NULL,
	"min_app_version" text,
	"starts_at" timestamp with time zone NOT NULL,
	"ends_at" timestamp with time zone,
	"active" boolean DEFAULT true NOT NULL,
	"shown_count" integer DEFAULT 0 NOT NULL,
	"tapped_count" integer DEFAULT 0 NOT NULL
);
--> statement-breakpoint
CREATE TABLE "push_campaigns" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"created_by" text NOT NULL,
	"title_en" text,
	"body_en" text,
	"title_tr" text,
	"body_tr" text,
	"link" text,
	"image_url" text,
	"audience" text NOT NULL,
	"test_only" boolean DEFAULT false NOT NULL,
	"send_at" timestamp with time zone NOT NULL,
	"status" text DEFAULT 'scheduled' NOT NULL,
	"sent_at" timestamp with time zone,
	"sent_count" integer DEFAULT 0 NOT NULL,
	"failed_count" integer DEFAULT 0 NOT NULL,
	"opened_count" integer DEFAULT 0 NOT NULL
);
--> statement-breakpoint
CREATE TABLE "push_devices" (
	"token" text PRIMARY KEY NOT NULL,
	"environment" text NOT NULL,
	"install_id" uuid,
	"user_id" uuid,
	"locale" text NOT NULL,
	"is_premium" boolean DEFAULT false NOT NULL,
	"app_version" text,
	"is_test" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
ALTER TABLE "push_devices" ADD CONSTRAINT "push_devices_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "push_campaigns_status_idx" ON "push_campaigns" USING btree ("status","send_at");--> statement-breakpoint
CREATE INDEX "push_devices_user_idx" ON "push_devices" USING btree ("user_id");