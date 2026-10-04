import type { Locale } from "../db/schema.js";

/**
 * Transactional email in the app's language: paper, ink, umber; Literata headings (Georgia
 * fallback); the "d" mark from the app icon. Table layout + inline styles so Gmail and
 * Outlook render it; a prefers-color-scheme block gives Apple Mail / iOS Mail a dark version.
 */
export type EmailContent = { subject: string; html: string; text: string };

const escapeHtml = (s: string) =>
  s.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;").replace(/'/g, "&#39;");

const SERIF = "Literata,Georgia,'Times New Roman',serif";
const SANS = "-apple-system,BlinkMacSystemFont,'Segoe UI',Helvetica,Arial,sans-serif";

interface Block {
  heading: string;
  /** Already-escaped HTML paragraphs. */
  paragraphs: string[];
  code?: { value: string; caption: string };
  action?: { label: string; url: string };
  footnote?: string;
  preheader: string;
}

const footerCopy = {
  en: "You’re receiving this because of activity on your DailyClassical account.",
  tr: "Bu e-postayı DailyClassical hesabınızdaki bir işlem nedeniyle alıyorsunuz.",
};

function layout(lang: Locale, b: Block): string {
  const paragraphs = b.paragraphs
    .map((t) => `<p class="ink" style="margin:0 0 16px;font:17px/1.6 ${SERIF};color:#1E1B17;">${t}</p>`)
    .join("");

  // One digit per cell so clients can't reflow it and screen readers read it digit by digit.
  const code = b.code
    ? `<table role="presentation" cellpadding="0" cellspacing="0" style="margin:8px 0 12px;"><tr>${[...b.code.value]
        .map(
          (d) => `<td class="digit" style="width:44px;height:56px;border:1px solid rgba(30,27,23,0.12);border-radius:12px;background:#F5F2EC;text-align:center;vertical-align:middle;font:500 30px ${SERIF};color:#1E1B17;">${escapeHtml(d)}</td><td style="width:8px;"></td>`,
        )
        .join("")}</tr></table>
<p class="muted" style="margin:0 0 20px;font:13px/1.5 ${SANS};color:#5E5852;">${b.code.caption}</p>`
    : "";

  const action = b.action
    ? `<table role="presentation" cellpadding="0" cellspacing="0" style="margin:8px 0 20px;"><tr><td class="button" style="border-radius:999px;background:#6B4A2B;">
<a href="${escapeHtml(b.action.url)}" style="display:inline-block;padding:15px 28px;font:600 16px ${SANS};color:#FFFFFF;text-decoration:none;border-radius:999px;">${escapeHtml(b.action.label)}</a></td></tr></table>
<p class="muted" style="margin:0 0 20px;font:12px/1.5 ${SANS};color:#8A837B;word-break:break-all;"><a href="${escapeHtml(b.action.url)}" class="link" style="color:#6B4A2B;">${escapeHtml(b.action.url)}</a></p>`
    : "";

  const footnote = b.footnote
    ? `<p class="muted" style="margin:4px 0 0;padding-top:20px;border-top:1px solid rgba(30,27,23,0.12);font:13px/1.5 ${SANS};color:#8A837B;">${b.footnote}</p>`
    : "";

  return `<!doctype html>
<html lang="${lang}"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="color-scheme" content="light dark"><meta name="supported-color-schemes" content="light dark">
<title>${escapeHtml(b.heading)}</title>
<link href="https://fonts.googleapis.com/css2?family=Literata:opsz,wght@7..72,400;7..72,500&display=swap" rel="stylesheet">
<style>
  @media (prefers-color-scheme: dark) {
    body, .page { background:#111010 !important; }
    .card { background:#1C1A18 !important; border-color:rgba(240,235,227,0.12) !important; }
    .ink, h1 { color:#F0EBE3 !important; }
    .muted { color:#B3ABA1 !important; }
    .digit { background:#111010 !important; color:#F0EBE3 !important; border-color:rgba(240,235,227,0.16) !important; }
    .button { background:#D4AE84 !important; } .button a { color:#1E1B17 !important; }
    .link { color:#D4AE84 !important; }
    .mark { background:#1C1A18 !important; color:#F0EBE3 !important; border-color:rgba(240,235,227,0.16) !important; }
  }
  @media (max-width:480px) { .card-pad { padding:28px 22px !important; } .digit { width:38px !important; height:50px !important; font-size:26px !important; } }
</style></head>
<body style="margin:0;padding:0;background:#F5F2EC;">
<div style="display:none;max-height:0;overflow:hidden;opacity:0;">${escapeHtml(b.preheader)}</div>
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" class="page" style="background:#F5F2EC;"><tr><td align="center" style="padding:40px 16px;">
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="max-width:520px;">
<tr><td style="padding:0 4px 20px;">
  <table role="presentation" cellpadding="0" cellspacing="0"><tr>
    <td class="mark" style="width:34px;height:34px;border-radius:9px;border:1px solid rgba(30,27,23,0.12);background:#F5F2EC;text-align:center;vertical-align:middle;font:500 24px/34px ${SERIF};color:#1E1B17;">d</td>
    <td class="ink" style="padding-left:10px;font:500 16px ${SERIF};color:#1E1B17;" lang="en">daily classical</td>
  </tr></table>
</td></tr>
<tr><td class="card card-pad" style="background:#FFFFFF;border:1px solid rgba(30,27,23,0.12);border-radius:16px;padding:36px 32px;">
  <h1 style="margin:0 0 16px;font:500 28px/1.2 ${SERIF};color:#1E1B17;">${escapeHtml(b.heading)}</h1>
  ${paragraphs}${code}${action}${footnote}
</td></tr>
<tr><td class="muted" style="padding:20px 4px 0;font:12px/1.5 ${SANS};color:#8A837B;">${escapeHtml(footerCopy[lang])}<br><a href="https://dailyclassical.co" class="link" style="color:#6B4A2B;text-decoration:none;">dailyclassical.co</a></td></tr>
</table></td></tr></table>
</body></html>`;
}

const copy = {
  verify: {
    en: {
      subject: (code: string) => `${code} is your DailyClassical code`,
      heading: "Confirm your email",
      body: "Enter this code in DailyClassical to finish setting up your account.",
      caption: (minutes: number) => `The code expires in ${minutes} minutes.`,
      ignore: "If you didn’t try to sign up, you can ignore this email. No account will be created.",
    },
    tr: {
      subject: (code: string) => `DailyClassical kodunuz: ${code}`,
      heading: "E-postanızı doğrulayın",
      body: "Hesabınızı kurmayı tamamlamak için bu kodu DailyClassical’a girin.",
      caption: (minutes: number) => `Kod ${minutes} dakika geçerlidir.`,
      ignore: "Kaydolmaya siz çalışmadıysanız bu e-postayı yok sayabilirsiniz. Hesap oluşturulmaz.",
    },
  },
  reset: {
    en: {
      subject: "Reset your DailyClassical password",
      heading: "Choose a new password",
      body: "Someone asked to reset the password for your DailyClassical account. Use the button below to choose a new one. The link expires in 30 minutes.",
      action: "Choose a new password",
      ignore: "If you didn’t ask for this, you can ignore this email. Your password stays the same.",
    },
    tr: {
      subject: "DailyClassical şifrenizi sıfırlayın",
      heading: "Yeni bir şifre seçin",
      body: "DailyClassical hesabınızın şifresini sıfırlamak için bir istek aldık. Yeni bir şifre seçmek için aşağıdaki düğmeyi kullanın. Bağlantı 30 dakika geçerlidir.",
      action: "Yeni şifre seç",
      ignore: "Bu isteği siz yapmadıysanız bu e-postayı yok sayabilirsiniz. Şifreniz değişmez.",
    },
  },
  welcome: {
    en: {
      subject: "Welcome to DailyClassical",
      heading: "Welcome",
      body: "Your account is ready. Tap the heart on any piece to keep it in your Library; your favourites now follow you to every device where you sign in.",
      sign: "Tomorrow’s piece is already waiting.",
    },
    tr: {
      subject: "DailyClassical’a hoş geldiniz",
      heading: "Hoş geldiniz",
      body: "Hesabınız hazır. Herhangi bir eserdeki kalbe dokunarak onu Kitaplık’ta saklayabilirsiniz; favorileriniz artık giriş yaptığınız her cihazda sizinle.",
      sign: "Yarının eseri şimdiden hazır.",
    },
  },
} as const;

/** 6-digit email verification code (sign-up). */
export function verificationCodeEmail(locale: Locale, code: string, minutes = 10): EmailContent {
  const c = copy.verify[locale];
  return {
    subject: c.subject(code),
    html: layout(locale, {
      heading: c.heading,
      preheader: `${c.body} ${c.caption(minutes)}`,
      paragraphs: [escapeHtml(c.body)],
      code: { value: code, caption: escapeHtml(c.caption(minutes)) },
      footnote: escapeHtml(c.ignore),
    }),
    text: `${c.heading}\n\n${c.body}\n\n${code}\n\n${c.caption(minutes)}\n\n${c.ignore}\n\nDailyClassical · dailyclassical.co`,
  };
}

export function passwordResetEmail(locale: Locale, link: string): EmailContent {
  const c = copy.reset[locale];
  return {
    subject: c.subject,
    html: layout(locale, {
      heading: c.heading,
      preheader: c.body,
      paragraphs: [escapeHtml(c.body)],
      action: { label: c.action, url: link },
      footnote: escapeHtml(c.ignore),
    }),
    text: `${c.heading}\n\n${c.body}\n\n${link}\n\n${c.ignore}\n\nDailyClassical · dailyclassical.co`,
  };
}

export function welcomeEmail(locale: Locale): EmailContent {
  const c = copy.welcome[locale];
  return {
    subject: c.subject,
    html: layout(locale, {
      heading: c.heading,
      preheader: c.body,
      paragraphs: [escapeHtml(c.body), `<em>${escapeHtml(c.sign)}</em>`],
    }),
    text: `${c.heading}\n\n${c.body}\n\n${c.sign}\n\nDailyClassical · dailyclassical.co`,
  };
}
