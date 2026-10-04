import type { Locale } from "../db/schema.js";
import { env } from "../env.js";
import { type EmailContent, passwordResetEmail, verificationCodeEmail, welcomeEmail } from "./email-templates.js";
import { CODE_TTL_MS } from "./verification-code.js";

/** The reset page is served by this API (GET /reset-password) until there is a website. */
export function passwordResetLink(token: string, locale: Locale): string {
  const url = new URL("/reset-password", env.PUBLIC_API_URL);
  url.searchParams.set("token", token);
  url.searchParams.set("lang", locale);
  return url.toString();
}

/**
 * Sends through Resend's HTTP API. Without RESEND_API_KEY (development) the email is
 * logged instead. Throws on a non-2xx response so callers can log the failure.
 */
async function send(to: string, content: EmailContent): Promise<void> {
  if (!env.RESEND_API_KEY) {
    console.info(`[email:dev] to=${to} subject="${content.subject}"\n${content.text}`);
    return;
  }
  const res = await fetch("https://api.resend.com/emails", {
    method: "POST",
    headers: { Authorization: `Bearer ${env.RESEND_API_KEY}`, "Content-Type": "application/json" },
    body: JSON.stringify({ from: env.EMAIL_FROM, to: [to], subject: content.subject, html: content.html, text: content.text }),
    signal: AbortSignal.timeout(10_000),
  });
  if (!res.ok) {
    throw new Error(`resend ${res.status}: ${(await res.text().catch(() => "")).slice(0, 300)}`);
  }
}

export function sendPasswordResetEmail(to: string, token: string, locale: Locale): Promise<void> {
  return send(to, passwordResetEmail(locale, passwordResetLink(token, locale)));
}

export function sendWelcomeEmail(to: string, locale: Locale): Promise<void> {
  return send(to, welcomeEmail(locale));
}

export function sendVerificationCodeEmail(to: string, code: string, locale: Locale): Promise<void> {
  return send(to, verificationCodeEmail(locale, code, CODE_TTL_MS / 60_000));
}
