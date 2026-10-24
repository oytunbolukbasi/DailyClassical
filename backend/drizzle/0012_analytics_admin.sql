CREATE TABLE "admin_login_codes" (
	"email" text PRIMARY KEY NOT NULL,
	"code_hash" text NOT NULL,
	"expires_at" timestamp with time zone NOT NULL,
	"attempts" smallint DEFAULT 0 NOT NULL,
	"sent_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "app_install_days" (
	"install_id" uuid NOT NULL,
	"day" date NOT NULL,
	CONSTRAINT "app_install_days_install_id_day_pk" PRIMARY KEY("install_id","day")
);
--> statement-breakpoint
CREATE TABLE "app_installs" (
	"install_id" uuid PRIMARY KEY NOT NULL,
	"first_seen" date NOT NULL,
	"last_seen" date NOT NULL,
	"app_version" text,
	"locale" text,
	"is_test" boolean DEFAULT false NOT NULL
);
--> statement-breakpoint
CREATE TABLE "piece_activity" (
	"install_id" uuid NOT NULL,
	"piece_id" text NOT NULL,
	"day" date NOT NULL,
	"opens" integer DEFAULT 0 NOT NULL,
	"spotify_taps" integer DEFAULT 0 NOT NULL,
	CONSTRAINT "piece_activity_install_id_piece_id_day_pk" PRIMARY KEY("install_id","piece_id","day")
);
--> statement-breakpoint
ALTER TABLE "app_install_days" ADD CONSTRAINT "app_install_days_install_id_app_installs_install_id_fk" FOREIGN KEY ("install_id") REFERENCES "public"."app_installs"("install_id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "piece_activity" ADD CONSTRAINT "piece_activity_install_id_app_installs_install_id_fk" FOREIGN KEY ("install_id") REFERENCES "public"."app_installs"("install_id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "app_install_days_day_idx" ON "app_install_days" USING btree ("day");--> statement-breakpoint
CREATE INDEX "piece_activity_piece_idx" ON "piece_activity" USING btree ("piece_id","day");