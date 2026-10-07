import { z } from "zod";

const schema = z.object({
  NODE_ENV: z.enum(["development", "production", "test"]).default("development"),
  PORT: z.coerce.number().default(3000),
  DATABASE_URL: z.string().url(),
  /** Unpooled Neon URL, used only by migrations. */
  DATABASE_URL_UNPOOLED: z.string().url().optional(),
  JWT_SECRET: z.string().min(32),
  /** Base URL for painting images (R2/S3/CDN). */
  ASSETS_BASE_URL: z.string().url().optional(),
  /** Resend API key (transactional email). Optional in development: emails are logged instead. */
  RESEND_API_KEY: z.string().optional().transform((v) => v?.trim() || undefined),
  EMAIL_FROM: z.string().default("DailyClassical <hello@dailyclassical.co>"),
  /** Public base URL of this API; used for links in emails (reset page). */
  PUBLIC_API_URL: z.string().url().default("https://api.dailyclassical.co"),
  /**
   * App versions for GET /v1/config. Builds older than MIN_APP_VERSION show a required-update
   * screen (raise it only when new content or APIs truly need a newer app); builds older than
   * LATEST_APP_VERSION offer the update once. Unset = no prompt.
   */
  MIN_APP_VERSION: z.string().regex(/^\d+(\.\d+){0,2}$/).optional(),
  LATEST_APP_VERSION: z.string().regex(/^\d+(\.\d+){0,2}$/).optional(),
  /** App Store page, opened by the update prompts. */
  APP_STORE_URL: z.string().url().optional(),
}).superRefine((e, ctx) => {
  if (e.NODE_ENV === "production" && !e.RESEND_API_KEY) {
    ctx.addIssue({ code: "custom", path: ["RESEND_API_KEY"], message: "required in production" });
  }
});

export const env = schema.parse(process.env);
