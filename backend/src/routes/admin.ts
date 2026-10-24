import { Hono, type Context } from "hono";
import { deleteCookie, getCookie, setCookie } from "hono/cookie";
import { html, raw } from "hono/html";
import type { HtmlEscapedString } from "hono/utils/html";
import { jwtVerify, SignJWT } from "jose";
import { sql } from "../db/client.js";
import { env } from "../env.js";
import { sendAdminCodeEmail } from "../lib/email.js";
import { enforceRateLimit } from "../lib/rate-limit.js";
import { CODE_TTL_MS, checkCode, generateCode, hashCode, RESEND_COOLDOWN_MS } from "../lib/verification-code.js";

/**
 * dailyclassical.co/admin: the content dashboard (Turkish). Sign-in is a 6-digit code emailed to
 * an address listed in ADMIN_EMAILS; the session is a signed cookie scoped to /admin. Shows app
 * usage (anonymous counts from routes/events.ts, test builds left out), what was and will be
 * "Today", and the catalogue with its paintings, reference recordings and reads.
 */
export const admin = new Hono();

const COOKIE = "dc_admin";
const AUDIENCE = "dailyclassical-admin";
const SESSION_DAYS = 7;
const secret = new TextEncoder().encode(env.JWT_SECRET);
const TZ = "Europe/Istanbul";

admin.use("/admin/*", noStore);
admin.use("/admin", noStore);
async function noStore(c: Context, next: () => Promise<void>) {
  await next();
  c.header("Cache-Control", "no-store");
  c.header("X-Robots-Tag", "noindex, nofollow");
}

const isAdmin = (email: string) => env.ADMIN_EMAILS.includes(email.trim().toLowerCase());

async function sessionEmail(c: Context): Promise<string | null> {
  const token = getCookie(c, COOKIE);
  if (!token) return null;
  try {
    const { payload } = await jwtVerify(token, secret, { audience: AUDIENCE });
    return payload.sub && isAdmin(payload.sub) ? payload.sub : null;
  } catch {
    return null;
  }
}

// ---- Sign-in ----

admin.get("/admin", async (c) => {
  if (env.ADMIN_EMAILS.length === 0) return c.html(page("Yönetim", closedView()), 404);
  const email = await sessionEmail(c);
  if (!email) return c.html(page("Giriş", loginView()));
  return c.html(page("Yönetim", await dashboardView(email)));
});

admin.post("/admin/login", async (c) => {
  const form = await c.req.parseBody();
  const email = String(form.email ?? "").trim().toLowerCase();
  if (!/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(email)) return c.html(page("Giriş", loginView("Geçerli bir e-posta adresi girin.")), 400);
  await enforceRateLimit(c, "adminLogin", email);
  // Same answer whether or not the address is an admin, so the page can't be used to probe.
  if (isAdmin(email)) {
    const [row] = await sql<{ sent_at: Date | string }[]>`select sent_at from admin_login_codes where email = ${email}`;
    if (!row || Date.now() - new Date(row.sent_at).getTime() > RESEND_COOLDOWN_MS) {
      const code = generateCode();
      await sql`
        insert into admin_login_codes (email, code_hash, expires_at, attempts, sent_at)
        values (${email}, ${hashCode(code)}, ${new Date(Date.now() + CODE_TTL_MS).toISOString()}::timestamptz, 0, now())
        on conflict (email) do update set code_hash = excluded.code_hash, expires_at = excluded.expires_at,
          attempts = 0, sent_at = now()`;
      await sendAdminCodeEmail(email, code).catch((e) => console.error("admin code email", e));
    }
  }
  return c.html(page("Kod", codeView(email)));
});

admin.post("/admin/verify", async (c) => {
  await enforceRateLimit(c, "adminVerify");
  const form = await c.req.parseBody();
  const email = String(form.email ?? "").trim().toLowerCase();
  const code = String(form.code ?? "").replace(/\D/g, "");
  const [row] = await sql<{ code_hash: string; expires_at: Date | string; attempts: number }[]>`
    select code_hash, expires_at, attempts from admin_login_codes where email = ${email}`;
  const result = row && isAdmin(email) ? checkCode(code, { codeHash: row.code_hash, expiresAt: new Date(row.expires_at), attempts: row.attempts }) : "wrong";
  if (result !== "ok") {
    if (row) await sql`update admin_login_codes set attempts = attempts + 1 where email = ${email}`;
    const message = result === "expired" ? "Kodun süresi doldu; yeni kod isteyin."
      : result === "too_many_attempts" ? "Çok fazla deneme; yeni kod isteyin." : "Kod hatalı.";
    return c.html(page("Kod", codeView(email, message)), 400);
  }
  await sql`delete from admin_login_codes where email = ${email}`;
  const token = await new SignJWT({}).setProtectedHeader({ alg: "HS256" }).setSubject(email)
    .setAudience(AUDIENCE).setIssuedAt().setExpirationTime(`${SESSION_DAYS}d`).sign(secret);
  setCookie(c, COOKIE, token, {
    path: "/admin", httpOnly: true, sameSite: "Strict", secure: env.NODE_ENV === "production",
    maxAge: SESSION_DAYS * 86_400,
  });
  return c.redirect("/admin", 303);
});

admin.post("/admin/logout", (c) => {
  deleteCookie(c, COOKIE, { path: "/admin" });
  return c.redirect("/admin", 303);
});

// ---- Data ----

type Recording = { conductor: string | null; orchestra: string | null; chorus: string | null; soloists: { name: string }[] | null; release_year: number | null; spotify_album_id: string | null };
type PieceRow = Recording & { piece_id: string; title: string | null; composer: string | null; artist: string | null; painting_title: string | null; readers: number; opens: number; taps: number };
type ScheduleRow = PieceRow & { day: string };
type CatalogueRow = PieceRow & { form: string; next_day: string | null; last_day: string | null; times_scheduled: number };

const todayIn = (tz: string) => new Intl.DateTimeFormat("en-CA", { timeZone: tz }).format(new Date());

async function loadDashboard() {
  const today = todayIn(TZ);
  const [kpi] = await sql<{ dau: number; dau_yesterday: number; mau: number; wau: number; installs: number; new_7d: number; accounts: number; favourites: number }[]>`
    with real_days as (
      select d.install_id, d.day from app_install_days d join app_installs i using (install_id) where not i.is_test
    )
    select
      (select count(*) from real_days where day = ${today}::date)::int as dau,
      (select count(*) from real_days where day = ${today}::date - 1)::int as dau_yesterday,
      (select count(distinct install_id) from real_days where day > ${today}::date - 7)::int as wau,
      (select count(distinct install_id) from real_days where day > ${today}::date - 30)::int as mau,
      (select count(*) from app_installs where not is_test)::int as installs,
      (select count(*) from app_installs where not is_test and first_seen > ${today}::date - 7)::int as new_7d,
      (select count(*) from users where email_verified_at is not null or apple_sub is not null)::int as accounts,
      (select count(*) from favourites)::int as favourites`;
  const series = await sql<{ day: string; n: number }[]>`
    select g::date::text as day, count(i.install_id)::int as n
    from generate_series(${today}::date - 29, ${today}::date, interval '1 day') g
    left join app_install_days d on d.day = g::date
    left join app_installs i on i.install_id = d.install_id and not i.is_test
    group by g order by g`;
  const pieceColumns = sql`
    pl.title, cl.short_name as composer, p.artist, ptl.title as painting_title,
    r.conductor, r.orchestra, r.chorus, r.soloists, r.release_year, r.spotify_album_id`;
  const pieceJoins = (pieceId: ReturnType<typeof sql>) => sql`
    join pieces pc on pc.id = ${pieceId}
    left join piece_localizations pl on pl.piece_id = pc.id and pl.locale = 'tr'
    left join composer_localizations cl on cl.composer_id = pc.composer_id and cl.locale = 'tr'
    left join paintings p on p.piece_id = pc.id
    left join painting_localizations ptl on ptl.painting_id = p.id and ptl.locale = 'tr'
    left join recordings r on r.piece_id = pc.id and r.role = 'reference'`;
  const schedule = await sql<ScheduleRow[]>`
    select s.day::text as day, s.piece_id, ${pieceColumns},
      coalesce(a.readers, 0)::int as readers, coalesce(a.opens, 0)::int as opens, coalesce(a.taps, 0)::int as taps
    from daily_schedule s
    ${pieceJoins(sql`s.piece_id`)}
    left join lateral (
      select count(*) filter (where pa.opens > 0) as readers, sum(pa.opens) as opens, sum(pa.spotify_taps) as taps
      from piece_activity pa join app_installs i using (install_id)
      where not i.is_test and pa.piece_id = s.piece_id and pa.day = s.day
    ) a on true
    where s.day between ${today}::date - 14 and ${today}::date + 14
    order by s.day`;
  const catalogue = await sql<CatalogueRow[]>`
    select pc.id as piece_id, pc.form, ${pieceColumns},
      (select min(day)::text from daily_schedule where piece_id = pc.id and day >= ${today}::date) as next_day,
      (select max(day)::text from daily_schedule where piece_id = pc.id and day < ${today}::date) as last_day,
      (select count(*) from daily_schedule where piece_id = pc.id and day < ${today}::date)::int as times_scheduled,
      coalesce(t.readers, 0)::int as readers, coalesce(t.opens, 0)::int as opens, coalesce(t.taps, 0)::int as taps
    from (select id from pieces) base
    ${pieceJoins(sql`base.id`)}
    left join lateral (
      select count(distinct pa.install_id) filter (where pa.opens > 0) as readers, sum(pa.opens) as opens, sum(pa.spotify_taps) as taps
      from piece_activity pa join app_installs i using (install_id)
      where not i.is_test and pa.piece_id = pc.id
    ) t on true
    order by readers desc, next_day nulls last, pc.id`;
  return { today, kpi: kpi!, series, schedule, catalogue };
}

// ---- Views ----

const fmt = new Intl.NumberFormat("tr-TR");
const dayLabel = (d: string) =>
  new Intl.DateTimeFormat("tr-TR", { day: "numeric", month: "short", weekday: "short", timeZone: "UTC" }).format(new Date(`${d}T00:00:00Z`));

function recordingLabel(r: Recording): string {
  const who = [...(r.soloists ?? []).map((s) => s.name)];
  if (r.conductor && !who.includes(r.conductor)) who.push(r.conductor);
  const ensemble = r.orchestra ?? r.chorus;
  return [who.join(" / "), ensemble].filter(Boolean).join(" · ") + (r.release_year ? `, ${r.release_year}` : "");
}

function pieceCell(r: PieceRow) {
  return html`<div class="t">${r.title ?? r.piece_id}</div><div class="m">${r.composer ?? ""}</div>`;
}
function paintingCell(r: PieceRow) {
  return r.artist ? html`<div>${r.painting_title ?? ""}</div><div class="m">${r.artist}</div>` : html`<span class="m">—</span>`;
}
function recordingCell(r: PieceRow) {
  const label = recordingLabel(r);
  return r.spotify_album_id
    ? html`<a href="https://open.spotify.com/album/${r.spotify_album_id}" target="_blank" rel="noopener">${label}</a>`
    : html`${label || "—"}`;
}
const num = (n: number) => html`<td class="n">${n ? fmt.format(n) : html`<span class="m">0</span>`}</td>`;

function chart(series: { day: string; n: number }[]) {
  const w = 720, h = 160, gap = 2, bw = w / series.length - gap;
  const max = Math.max(1, ...series.map((s) => s.n));
  const bars = series.map((s, i) => {
    const bh = s.n ? Math.max(2, (s.n / max) * (h - 20)) : 0;
    const x = i * (bw + gap), y = h - bh;
    return `<g class="bar"><rect class="hit" x="${x}" y="0" width="${bw + gap}" height="${h}"/>`
      + (bh ? `<path d="M${x},${h} V${y + 4} q0,-4 4,-4 h${bw - 8} q4,0 4,4 V${h} Z"/>` : "")
      + `<title>${dayLabel(s.day)}: ${fmt.format(s.n)} aktif kullanıcı</title></g>`;
  }).join("");
  return raw(`<svg viewBox="0 0 ${w} ${h + 18}" role="img" aria-label="Son 30 günde günlük aktif kullanıcı" class="chart">
    <line x1="0" y1="${h + 0.5}" x2="${w}" y2="${h + 0.5}" class="axis"/>${bars}
    <text x="0" y="${h + 14}" class="tick">${dayLabel(series[0]!.day)}</text>
    <text x="${w}" y="${h + 14}" class="tick" text-anchor="end">${dayLabel(series.at(-1)!.day)}</text>
    <text x="0" y="10" class="tick">en çok ${fmt.format(max)}</text></svg>`);
}

async function dashboardView(email: string) {
  const { today, kpi, series, schedule, catalogue } = await loadDashboard();
  const tile = (label: string, value: number, note?: string) =>
    html`<div class="tile"><div class="k">${label}</div><div class="v">${fmt.format(value)}</div>${note ? html`<div class="m">${note}</div>` : ""}</div>`;
  return html`
    <header class="top">
      <div><div class="brand" lang="en">DailyClassical</div><h1>Yönetim</h1></div>
      <form method="post" action="/admin/logout"><span class="m">${email}</span> <button class="link">Çıkış</button></form>
    </header>

    <section>
      <h2>Kullanıcılar</h2>
      <div class="tiles">
        ${tile("Günlük aktif", kpi.dau, `dün ${fmt.format(kpi.dau_yesterday)}`)}
        ${tile("Haftalık aktif", kpi.wau, "son 7 gün")}
        ${tile("Aylık aktif", kpi.mau, "son 30 gün")}
        ${tile("Toplam kullanıcı", kpi.installs, `son 7 günde ${fmt.format(kpi.new_7d)} yeni`)}
        ${tile("Hesap açan", kpi.accounts, `${fmt.format(kpi.favourites)} favori`)}
      </div>
      <div class="card">
        <div class="ct">Günlük aktif kullanıcı, son 30 gün</div>
        ${chart(series)}
      </div>
      <p class="m small">Kullanıcı = uygulamanın bir kurulumu (anonim). Xcode ve TestFlight build'leri sayılmaz. Gün, kullanıcının kendi tarihine göre.</p>
    </section>

    <section>
      <h2>Takvim <span class="m">bugün ${dayLabel(today)}, ±14 gün</span></h2>
      <div class="scroll"><table>
        <thead><tr><th>Gün</th><th>Eser</th><th>Tablo</th><th>Referans kayıt</th><th class="n">Okuyan</th><th class="n">Açılış</th><th class="n">Spotify</th></tr></thead>
        <tbody>${schedule.map((r) => html`<tr class="${r.day === today ? "today" : r.day > today ? "future" : ""}">
          <td class="day">${dayLabel(r.day)}</td><td>${pieceCell(r)}</td><td>${paintingCell(r)}</td><td>${recordingCell(r)}</td>
          ${num(r.readers)}${num(r.opens)}${num(r.taps)}</tr>`)}
        </tbody></table></div>
      <p class="m small">Okuyan, açılış ve Spotify o günün sayıları (eserin Bugün olduğu gün).</p>
    </section>

    <section>
      <h2>Katalog <span class="m">${fmt.format(catalogue.length)} eser</span></h2>
      <div class="scroll"><table>
        <thead><tr><th>Eser</th><th>Tür</th><th>Tablo</th><th>Referans kayıt</th><th>Takvim</th><th class="n">Okuyan</th><th class="n">Açılış</th><th class="n">Spotify</th></tr></thead>
        <tbody>${catalogue.map((r) => html`<tr>
          <td>${pieceCell(r)}</td><td class="m">${r.form}</td><td>${paintingCell(r)}</td><td>${recordingCell(r)}</td>
          <td class="day">${r.next_day ? html`sıradaki ${dayLabel(r.next_day)}` : r.last_day ? html`son ${dayLabel(r.last_day)}` : html`<span class="m">takvimde yok</span>`}${r.times_scheduled > 1 ? html`<div class="m">${r.times_scheduled} kez gösterildi</div>` : ""}</td>
          ${num(r.readers)}${num(r.opens)}${num(r.taps)}</tr>`)}
        </tbody></table></div>
      <p class="m small">Okuyan: eseri en az bir kez açan kullanıcı sayısı (tüm zamanlar). Spotify: "Spotify'da aç" dokunuşları.</p>
    </section>`;
}

function loginView(error?: string) {
  return html`<main class="narrow">
    <div class="brand" lang="en">DailyClassical</div><h1>Yönetim</h1>
    <form method="post" action="/admin/login" class="stack">
      <label for="email">E-posta</label>
      <input id="email" name="email" type="email" autocomplete="email" required autofocus>
      ${error ? html`<p class="err">${error}</p>` : ""}
      <button class="primary">Kod gönder</button>
    </form></main>`;
}

function codeView(email: string, error?: string) {
  return html`<main class="narrow">
    <div class="brand" lang="en">DailyClassical</div><h1>Kodu girin</h1>
    <p class="m">${email} yönetici adresiyse, 6 haneli bir kod gönderdik. Kod 10 dakika geçerli.</p>
    <form method="post" action="/admin/verify" class="stack">
      <input type="hidden" name="email" value="${email}">
      <label for="code">Kod</label>
      <input id="code" name="code" inputmode="numeric" autocomplete="one-time-code" pattern="[0-9 ]{6,7}" maxlength="7" required autofocus>
      ${error ? html`<p class="err">${error}</p>` : ""}
      <button class="primary">Giriş yap</button>
    </form>
    <form method="post" action="/admin/login"><input type="hidden" name="email" value="${email}"><button class="link">Yeni kod gönder</button></form>
  </main>`;
}

function closedView() {
  return html`<main class="narrow"><div class="brand" lang="en">DailyClassical</div><h1>Yönetim kapalı</h1>
    <p class="m">Sunucuda ADMIN_EMAILS tanımlı değil.</p></main>`;
}

function page(title: string, body: HtmlEscapedString | Promise<HtmlEscapedString>) {
  return html`<!doctype html><html lang="tr"><head><meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="robots" content="noindex, nofollow">
  <title>${title} · DailyClassical</title>
  <style>${raw(CSS)}</style></head><body>${body}</body></html>`;
}

const CSS = `
@font-face{font-family:Literata;font-weight:400 600;font-display:swap;src:url(/assets/fonts/literata-latin.woff2) format("woff2");unicode-range:U+0000-00FF,U+0131,U+0152-0153,U+2000-206F}
@font-face{font-family:Literata;font-weight:400 600;font-display:swap;src:url(/assets/fonts/literata-latin-ext.woff2) format("woff2");unicode-range:U+0100-02BA,U+1E00-1E9F}
:root{--bg:#F5F2EC;--surface:#FFFFFF;--ink:#1E1B17;--ink2:#5E5852;--ink3:#7A736B;--rule:rgba(30,27,23,.12);--accent:#6B4A2B;--onaccent:#FFFFFF;--today:rgba(107,74,43,.08);--danger:#B3261E}
@media (prefers-color-scheme:dark){:root{--bg:#111010;--surface:#1C1A18;--ink:#F0EBE3;--ink2:#B3ABA1;--ink3:#8F887F;--rule:rgba(240,235,227,.12);--accent:#D4AE84;--onaccent:#1E1B17;--today:rgba(212,174,132,.10);--danger:#F28B82}}
*{box-sizing:border-box}
body{margin:0;background:var(--bg);color:var(--ink);font:15px/1.45 -apple-system,BlinkMacSystemFont,"Segoe UI",Helvetica,Arial,sans-serif;padding:24px 16px 64px}
body>*{max-width:1200px;margin-left:auto;margin-right:auto}
h1,h2{font-family:Literata,Georgia,serif;font-weight:500;margin:0}
h1{font-size:32px;line-height:1.15}
h2{font-size:22px;margin:40px 0 14px;display:flex;gap:12px;align-items:baseline;flex-wrap:wrap}
h2 .m{font:13px -apple-system,system-ui,sans-serif}
.brand{font:600 12px -apple-system,system-ui,sans-serif;letter-spacing:.1em;text-transform:uppercase;color:var(--ink2);margin-bottom:4px}
.m{color:var(--ink2)}
.small{font-size:13px;margin:10px 0 0}
a{color:var(--accent)}
.top{display:flex;justify-content:space-between;align-items:flex-end;gap:16px;flex-wrap:wrap}
.tiles{display:grid;grid-template-columns:repeat(auto-fit,minmax(170px,1fr));gap:12px}
.tile,.card{background:var(--surface);border-radius:16px;box-shadow:0 0 0 .5px var(--rule);padding:16px 18px}
.tile .k{font-size:13px;color:var(--ink2)}
.tile .v{font:500 34px/1.2 Literata,Georgia,serif;font-variant-numeric:tabular-nums;margin:4px 0 2px}
.tile .m{font-size:13px}
.card{margin-top:12px}
.ct{font-size:13px;color:var(--ink2);margin-bottom:8px}
.chart{width:100%;height:auto;display:block}
.chart path{fill:var(--accent)}
.chart .hit{fill:transparent}
.chart .bar:hover path{opacity:.75}
.chart .axis{stroke:var(--rule)}
.chart .tick{font:11px -apple-system,system-ui,sans-serif;fill:var(--ink3)}
.scroll{overflow-x:auto;background:var(--surface);border-radius:16px;box-shadow:0 0 0 .5px var(--rule)}
table{width:100%;border-collapse:collapse;font-size:14px}
th,td{text-align:left;padding:10px 14px;border-bottom:.5px solid var(--rule);vertical-align:top}
th{font-size:12px;font-weight:600;color:var(--ink2);white-space:nowrap}
tbody tr:last-child td{border-bottom:0}
td.n,th.n{text-align:right;font-variant-numeric:tabular-nums;white-space:nowrap}
td.day{white-space:nowrap}
tr.today td{background:var(--today)}
tr.today td.day{font-weight:600}
tr.future td{color:var(--ink2)}
.t{font-family:Literata,Georgia,serif;font-size:15px}
td:has(.t){min-width:220px}
td:has(a){min-width:200px}
.narrow{max-width:380px;margin-top:12vh}
.stack{display:flex;flex-direction:column;gap:8px;margin-top:24px}
label{font-size:13px;color:var(--ink2)}
input{font:inherit;font-size:17px;padding:12px 14px;border-radius:12px;border:0;box-shadow:inset 0 0 0 .5px var(--rule);background:var(--surface);color:var(--ink)}
button{font:inherit;cursor:pointer}
.primary{margin-top:8px;height:48px;border:0;border-radius:24px;background:var(--accent);color:var(--onaccent);font-weight:600}
.link{border:0;background:none;color:var(--accent);padding:8px 0;min-height:44px}
.err{color:var(--danger);margin:0}
`;
