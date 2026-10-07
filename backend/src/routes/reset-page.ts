import { eq } from "drizzle-orm";
import { Hono } from "hono";
import { db } from "../db/client.js";
import { type Locale, locales, passwordResetTokens } from "../db/schema.js";
import { requestLocale } from "../lib/locale.js";
import { hashResetToken, isResetTokenUsable } from "../lib/reset-token.js";

/**
 * GET /reset-password?token=…&lang=tr — the page the reset email links to (there is no
 * website yet). Self-contained HTML; the form posts JSON to /v1/auth/password-reset/confirm.
 */
export const resetPage = new Hono();

const copy = {
  en: {
    title: "Choose a new password",
    intro: "Enter a new password for your DailyClassical account.",
    password: "New password",
    confirm: "Repeat password",
    hint: "At least 8 characters.",
    submit: "Save password",
    tooShort: "Use at least 8 characters.",
    mismatch: "The passwords do not match.",
    generic: "Something went wrong. Please try again.",
    offline: "No connection. Check your internet and try again.",
    rateLimited: "Too many attempts. Please wait a moment and try again.",
    doneTitle: "Password changed",
    doneBody: "You can now sign in to DailyClassical with your new password. Other devices have been signed out.",
    expiredTitle: "This link has expired",
    expiredBody: "Reset links work once and expire after 30 minutes. In the app, tap “Forgot password?” on the sign-in screen to get a new one.",
  },
  tr: {
    title: "Yeni bir şifre seçin",
    intro: "DailyClassical hesabınız için yeni bir şifre girin.",
    password: "Yeni şifre",
    confirm: "Şifre tekrar",
    hint: "En az 8 karakter.",
    submit: "Şifreyi kaydet",
    tooShort: "En az 8 karakter kullanın.",
    mismatch: "Şifreler eşleşmiyor.",
    generic: "Bir şeyler ters gitti. Lütfen tekrar deneyin.",
    offline: "Bağlantı yok. İnternetinizi kontrol edip tekrar deneyin.",
    rateLimited: "Çok fazla deneme yaptınız. Lütfen biraz sonra tekrar deneyin.",
    doneTitle: "Şifreniz değişti",
    doneBody: "Artık yeni şifrenizle DailyClassical’a giriş yapabilirsiniz. Diğer cihazlardaki oturumlar kapatıldı.",
    expiredTitle: "Bu bağlantının süresi doldu",
    expiredBody: "Sıfırlama bağlantıları bir kez kullanılabilir ve 30 dakika sonra geçersiz olur. Yeni bir bağlantı için uygulamada giriş ekranındaki “Şifrenizi mi unuttunuz?” seçeneğine dokunun.",
  },
} as const satisfies Record<Locale, Record<string, string>>;

const esc = (s: string) => s.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;");

export function renderResetPage(locale: Locale, state: "form" | "expired"): string {
  const t = copy[locale];
  const messages = JSON.stringify({ tooShort: t.tooShort, mismatch: t.mismatch, generic: t.generic, offline: t.offline, rateLimited: t.rateLimited }).replace(/</g, "\\u003c");
  return `<!doctype html>
<html lang="${locale}">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="robots" content="noindex">
<title>${esc(t.title)} · DailyClassical</title>
<style>
:root{--bg:#F5F2EC;--surface:#FFFFFF;--ink:#1E1B17;--ink2:#5E5852;--ink3:#8A837B;--rule:rgba(30,27,23,.12);--accent:#6B4A2B;--on-accent:#FFFFFF;--danger:#B3261E;color-scheme:light dark}
@media (prefers-color-scheme:dark){:root{--bg:#111010;--surface:#1C1A18;--ink:#F0EBE3;--ink2:#B3ABA1;--ink3:#7D766E;--rule:rgba(240,235,227,.12);--accent:#D4AE84;--on-accent:#1E1B17;--danger:#F28B82}}
*{box-sizing:border-box}
body{margin:0;background:var(--bg);color:var(--ink);font:17px/1.5 -apple-system,BlinkMacSystemFont,"Segoe UI",Helvetica,Arial,sans-serif}
main{max-width:440px;margin:0 auto;padding:56px 24px 48px}
.brand{font-size:12px;font-weight:600;letter-spacing:.1em;text-transform:uppercase;color:var(--ink2);margin:0 0 28px}
h1{font:500 30px/1.15 Literata,Georgia,"Times New Roman",serif;letter-spacing:-.01em;margin:0 0 10px}
p{margin:0 0 22px;color:var(--ink2);font-size:15px}
.card{background:var(--surface);border-radius:16px;box-shadow:0 0 0 .5px var(--rule)}
label{display:flex;align-items:center;gap:12px;min-height:52px;padding:0 16px}
label+label{border-top:.5px solid var(--rule)}
label span{flex:0 0 112px;font-size:15px;color:var(--ink2)}
input{flex:1;min-width:0;border:0;background:transparent;color:var(--ink);font:inherit;caret-color:var(--accent);outline:none;padding:14px 0}
.hint{font-size:13px;color:var(--ink3);margin:14px 0 22px}
.hint.error{color:var(--danger)}
button{width:100%;height:52px;border:0;border-radius:999px;background:var(--accent);color:var(--on-accent);font:600 17px -apple-system,BlinkMacSystemFont,"Segoe UI",Helvetica,Arial,sans-serif;cursor:pointer}
button:disabled{opacity:.5;cursor:default}
[hidden]{display:none!important}
</style>
</head>
<body>
<main>
<p class="brand">DailyClassical</p>
<section id="form-state"${state === "form" ? "" : " hidden"}>
<h1>${esc(t.title)}</h1>
<p>${esc(t.intro)}</p>
<form id="form" novalidate>
<div class="card">
<label><span>${esc(t.password)}</span><input id="password" type="password" autocomplete="new-password" minlength="8" maxlength="200" required autofocus></label>
<label><span>${esc(t.confirm)}</span><input id="confirm" type="password" autocomplete="new-password" minlength="8" maxlength="200" required></label>
</div>
<p id="message" class="hint" role="status" aria-live="polite">${esc(t.hint)}</p>
<button id="submit" type="submit">${esc(t.submit)}</button>
</form>
</section>
<section id="done-state" hidden>
<h1>${esc(t.doneTitle)}</h1>
<p>${esc(t.doneBody)}</p>
</section>
<section id="expired-state"${state === "expired" ? "" : " hidden"}>
<h1>${esc(t.expiredTitle)}</h1>
<p>${esc(t.expiredBody)}</p>
</section>
</main>
<script>
(function () {
  var M = ${messages};
  var token = new URLSearchParams(location.search).get("token") || "";
  var form = document.getElementById("form");
  var msg = document.getElementById("message");
  var btn = document.getElementById("submit");
  function show(id) {
    ["form-state", "done-state", "expired-state"].forEach(function (s) { document.getElementById(s).hidden = s !== id; });
  }
  function error(text) { msg.textContent = text; msg.classList.add("error"); }
  form.addEventListener("submit", function (e) {
    e.preventDefault();
    var pw = document.getElementById("password").value;
    var confirm = document.getElementById("confirm").value;
    if (pw.length < 8) return error(M.tooShort);
    if (pw !== confirm) return error(M.mismatch);
    btn.disabled = true;
    fetch("/v1/auth/password-reset/confirm", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ token: token, password: pw })
    }).then(function (res) {
      if (res.status === 204) return show("done-state");
      return res.json().catch(function () { return {}; }).then(function (body) {
        if (body && body.error === "invalid_or_expired_token") return show("expired-state");
        if (res.status === 429) return error(M.rateLimited);
        error(M.generic);
      });
    }).catch(function () { error(M.offline); }).finally(function () { btn.disabled = false; });
  });
})();
</script>
</body>
</html>`;
}

function pageLocale(lang: string | undefined, fallback: Locale): Locale {
  const l = lang?.toLowerCase().split("-")[0];
  return l && (locales as readonly string[]).includes(l) ? (l as Locale) : fallback;
}

resetPage.get("/reset-password", async (c) => {
  const locale = pageLocale(c.req.query("lang"), requestLocale(c));
  const token = c.req.query("token") ?? "";
  let usable = false;
  if (token.length >= 16 && token.length <= 200) {
    const [row] = await db
      .select({ expiresAt: passwordResetTokens.expiresAt, usedAt: passwordResetTokens.usedAt })
      .from(passwordResetTokens)
      .where(eq(passwordResetTokens.tokenHash, hashResetToken(token)));
    usable = !!row && isResetTokenUsable(row);
  }
  c.header("Cache-Control", "no-store");
  c.header("Referrer-Policy", "no-referrer");
  c.header(
    "Content-Security-Policy",
    "default-src 'none'; style-src 'unsafe-inline'; script-src 'unsafe-inline'; connect-src 'self'; form-action 'self'; base-uri 'none'; frame-ancestors 'none'",
  );
  return c.html(renderResetPage(locale, usable ? "form" : "expired"));
});
