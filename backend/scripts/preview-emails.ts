import { mkdirSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import { passwordResetEmail, verificationCodeEmail, welcomeEmail } from "../src/lib/email-templates.js";

/** Renders every transactional email in EN and TR to design/emails/ for review. */
const out = join(dirname(fileURLToPath(import.meta.url)), "../../design/emails");
mkdirSync(out, { recursive: true });
for (const locale of ["en", "tr"] as const) {
  writeFileSync(join(out, `verification-code.${locale}.html`), verificationCodeEmail(locale, "482913").html);
  writeFileSync(join(out, `password-reset.${locale}.html`), passwordResetEmail(locale, "https://api.dailyclassical.co/reset-password?token=example").html);
  writeFileSync(join(out, `welcome.${locale}.html`), welcomeEmail(locale).html);
}
console.log(`✓ previews in ${out}`);
