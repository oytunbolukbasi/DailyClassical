CREATE TABLE "push_test_devices" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"email" text NOT NULL,
	"invite_hash" text NOT NULL,
	"invited_by" text NOT NULL,
	"invited_at" timestamp with time zone DEFAULT now() NOT NULL,
	"expires_at" timestamp with time zone NOT NULL,
	"verified_at" timestamp with time zone,
	"install_id" uuid,
	"push_token" text,
	"device" text,
	"app_version" text,
	CONSTRAINT "push_test_devices_invite_hash_unique" UNIQUE("invite_hash")
);
