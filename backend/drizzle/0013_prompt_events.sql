CREATE TABLE "prompt_events" (
	"install_id" uuid NOT NULL,
	"prompt" text NOT NULL,
	"action" text NOT NULL,
	"day" date NOT NULL,
	"count" integer DEFAULT 0 NOT NULL,
	CONSTRAINT "prompt_events_install_id_prompt_action_day_pk" PRIMARY KEY("install_id","prompt","action","day")
);
--> statement-breakpoint
ALTER TABLE "prompt_events" ADD CONSTRAINT "prompt_events_install_id_app_installs_install_id_fk" FOREIGN KEY ("install_id") REFERENCES "public"."app_installs"("install_id") ON DELETE cascade ON UPDATE no action;