import { Hono, type Context } from "hono";
import { html, raw } from "hono/html";
import { sql } from "../db/client.js";
import { apnsConfigured, apnsEnvironments } from "../lib/apns.js";
import { sendTestDeviceInviteEmail } from "../lib/email.js";
import { sendCampaign } from "../lib/push-sender.js";
import { generateResetToken, hashResetToken } from "../lib/reset-token.js";
import { headerView, page, sessionEmail, TZ } from "./admin.js";

/**
 * /admin/messages: push notifications and in-app messages (no third party; routes/push.ts,
 * lib/push-sender.ts). A push is written in Turkish and English (a reader gets their app
 * language's text), goes now or at a set time (Istanbul time) to everyone, free readers or
 * Premium readers, or only to test devices (TestFlight and Xcode builds). In-app messages are a
 * card the app shows once, between a start and an optional end.
 */
export const adminMessages = new Hono();

adminMessages.use("/admin/messages/*", noStore);
adminMessages.use("/admin/messages", noStore);
async function noStore(c: Context, next: () => Promise<void>) {
  await next();
  c.header("Cache-Control", "no-store");
  c.header("X-Robots-Tag", "noindex, nofollow");
}

type Audience = "all" | "free" | "premium";
const AUDIENCES: Record<Audience, string> = { all: "Herkes", free: "Premium olmayanlar", premium: "Premium olanlar" };
const STATUS: Record<string, string> = { scheduled: "Zamanlandı", sending: "Gönderiliyor", sent: "Gönderildi", cancelled: "İptal edildi", failed: "Hata" };

type Campaign = {
  id: string; created_at: string; created_by: string; title_en: string | null; body_en: string | null; title_tr: string | null; body_tr: string | null;
  link: string | null; image_url: string | null; audience: Audience; test_only: boolean; send_at: string; status: string;
  sent_count: number; failed_count: number; opened_count: number;
};
type Message = {
  id: string; created_at: string; title_en: string | null; body_en: string | null; button_en: string | null;
  title_tr: string | null; body_tr: string | null; button_tr: string | null; link: string | null; image_url: string | null;
  audience: Audience; test_only: boolean; min_app_version: string | null; starts_at: string; ends_at: string | null; active: boolean;
  shown_count: number; tapped_count: number;
};

const fmt = new Intl.NumberFormat("tr-TR");
/** "1.10" after "1.4"; anything that isn't a version ("?") last. */
export function compareVersions(a: string, b: string): number {
  const parse = (v: string) => (/^\d+(\.\d+)*$/.test(v) ? v.split(".").map(Number) : null);
  const x = parse(a), y = parse(b);
  if (!x || !y) return x ? 1 : y ? -1 : 0;
  for (let i = 0; i < Math.max(x.length, y.length); i++) {
    const d = (x[i] ?? 0) - (y[i] ?? 0);
    if (d) return d;
  }
  return 0;
}
const when = (t: string | Date) => new Intl.DateTimeFormat("tr-TR", { timeZone: TZ, day: "numeric", month: "short", hour: "2-digit", minute: "2-digit" }).format(new Date(t));
/** A datetime-local value is Istanbul time (UTC+3 all year since 2016). */
const fromLocal = (v: string) => (/^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}$/.test(v) ? new Date(`${v}:00+03:00`) : null);
const toLocal = (d: Date) => new Date(d.getTime() + 3 * 3_600_000).toISOString().slice(0, 16);

const text = (v: unknown, max: number) => {
  const s = String(v ?? "").replace(/\r\n/g, "\n").trim();
  return s ? s.slice(0, max) : null;
};
/** Links the app opens: its own (dailyclassical://…) or a web page. */
const linkOf = (v: unknown) => {
  const s = text(v, 500);
  return s && /^(dailyclassical:\/\/[a-z]+(\/[A-Za-z0-9-]+)?|https:\/\/\S+)$/.test(s) ? s : s ? undefined : null;
};
const imageOf = (v: unknown) => {
  const s = text(v, 500);
  return s && /^https:\/\/\S+$/.test(s) ? s : s ? undefined : null;
};
/** App screens a push or card can open (the app's dailyclassical:// links, RootView.open). */
const APP_LINKS: [string, string][] = [
  ["dailyclassical://premium", "Premium ekranı"],
  ["dailyclassical://today", "Bugün"],
  ["dailyclassical://discover", "Keşfet (1.5+)"],
  ["dailyclassical://composers", "Keşfet › Besteciler (1.5+)"],
  ["dailyclassical://eras", "Keşfet › Dönemler (1.5+)"],
  ["dailyclassical://forms", "Keşfet › Türler (1.5+)"],
];
const audienceOf = (v: unknown): Audience => (v === "free" || v === "premium" ? v : "all");

async function requireAdmin(c: Context): Promise<string | null> {
  return sessionEmail(c);
}

// ---- Pages ----

adminMessages.get("/admin/messages", async (c) => {
  const email = await requireAdmin(c);
  if (!email) return c.redirect("/admin", 303);
  return c.html(page("Engage", await messagesView(email, c.req.query("ok"), c.req.query("err"))));
});

type PushForm = { titleTr: string | null; bodyTr: string | null; titleEn: string | null; bodyEn: string | null; link: string | null; image: string | null; audience: Audience };

/** The push form, checked; a Turkish error message when something is missing or malformed. */
function readPush(f: Record<string, unknown>): PushForm | string {
  const t = { titleTr: text(f.title_tr, 100), bodyTr: text(f.body_tr, 300), titleEn: text(f.title_en, 100), bodyEn: text(f.body_en, 300) };
  const link = linkOf(f.link === "__custom" ? f.link_custom : f.link);
  const image = imageOf(f.image);
  const tr = !!(t.titleTr && t.bodyTr), en = !!(t.titleEn && t.bodyEn);
  return !tr && !en ? "Bir dilde başlık ve metin gerekli."
    : (t.titleTr || t.bodyTr) && !tr ? "Türkçe başlık ve metin birlikte yazılmalı."
    : (t.titleEn || t.bodyEn) && !en ? "İngilizce başlık ve metin birlikte yazılmalı."
    : link === undefined ? "Link dailyclassical:// ya da https:// ile başlamalı."
    : image === undefined ? "Görsel adresi https:// ile başlamalı."
    : { ...t, link, image, audience: audienceOf(f.audience) };
}

adminMessages.post("/admin/messages/push", async (c) => {
  const email = await requireAdmin(c);
  if (!email) return c.redirect("/admin", 303);
  const f = await c.req.parseBody();
  const p = readPush(f);
  const sendAt = f.when === "later" ? fromLocal(String(f.send_at ?? "")) : new Date();
  const err = typeof p === "string" ? p : !sendAt ? "Gönderim zamanı seçin." : null;
  if (err || typeof p === "string") return c.redirect(`/admin/messages?err=${encodeURIComponent(err!)}#push`, 303);
  await sql`
    insert into push_campaigns (created_by, title_en, body_en, title_tr, body_tr, link, image_url, audience, test_only, send_at)
    values (${email}, ${p.titleEn}, ${p.bodyEn}, ${p.titleTr}, ${p.bodyTr}, ${p.link}, ${p.image},
            ${p.audience}, false, ${sendAt!.toISOString()}::timestamptz)`;
  const ok = f.when === "later" ? "Push zamanlandı." : apnsConfigured() ? "Push gönderim sırasına alındı; bir dakika içinde gider." : "Push kaydedildi; APNs anahtarı tanımlı olmadığı için gönderilmeyecek.";
  return c.redirect(`/admin/messages?ok=${encodeURIComponent(ok)}#history`, 303);
});

/**
 * "Test cihazlarına şimdi gönder": right away to the verified test devices, no scheduling. Called
 * from the page with fetch, so the form keeps what was typed; answers { ok } or { error }. The
 * send is kept (test_only, for the open count) but not listed with the campaigns.
 */
adminMessages.post("/admin/messages/push/test", async (c) => {
  const email = await requireAdmin(c);
  if (!email) return c.json({ error: "Oturum kapanmış; sayfayı yenileyip yeniden girin." }, 401);
  const p = readPush(await c.req.parseBody());
  if (typeof p === "string") return c.json({ error: p }, 400);
  if (!apnsConfigured()) return c.json({ error: "APNs anahtarı sunucuda tanımlı değil; push gönderilemez." }, 400);
  const [row] = await sql<{ id: string }[]>`
    insert into push_campaigns (created_by, title_en, body_en, title_tr, body_tr, link, image_url, audience, test_only, send_at, status)
    values (${email}, ${p.titleEn}, ${p.bodyEn}, ${p.titleTr}, ${p.bodyTr}, ${p.link}, ${p.image}, ${p.audience}, true, now(), 'sending')
    returning id`;
  const r = await sendCampaign({ id: row!.id, title_en: p.titleEn, body_en: p.bodyEn, title_tr: p.titleTr, body_tr: p.bodyTr,
    link: p.link, image_url: p.image, audience: p.audience, test_only: true });
  await sql`update push_campaigns set status = 'sent', sent_at = now(), sent_count = ${r.sent}, failed_count = ${r.failed} where id = ${row!.id}`;
  if (r.sent + r.failed === 0) return c.json({ error: "Gönderilecek test cihazı yok: davet edilen cihaz doğrulanmış ve bildirime izin vermiş olmalı." }, 400);
  if (r.sent === 0) return c.json({ error: `${r.failed} test cihazına gönderilemedi.` }, 502);
  return c.json({ ok: `${r.sent} test cihazına gönderildi${r.failed ? `, ${r.failed} hata` : ""}.` });
});

// ---- Test devices ----

const INVITE_DAYS = 7;

adminMessages.post("/admin/messages/test-devices", async (c) => {
  const admin = await requireAdmin(c);
  if (!admin) return c.redirect("/admin", 303);
  const f = await c.req.parseBody();
  const to = String(f.email ?? "").trim().toLowerCase();
  if (!/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(to)) return c.redirect(`/admin/messages?err=${encodeURIComponent("Geçerli bir e-posta adresi girin.")}#test-devices`, 303);
  const invite = generateResetToken();
  await sql`
    insert into push_test_devices (email, invite_hash, invited_by, expires_at)
    values (${to}, ${hashResetToken(invite)}, ${admin}, now() + ${INVITE_DAYS} * interval '1 day')`;
  // The address the admin page was opened on (www.dailyclassical.co in production).
  const here = new URL(c.req.url);
  const origin = here.hostname === "localhost" ? here.origin : `https://${here.host}`;  // TLS ends at the proxy
  const link = `${origin}/test-device/${invite}`;
  try {
    await sendTestDeviceInviteEmail(to, link, INVITE_DAYS);
  } catch (e) {
    console.error("test device invite email", e);
    return c.redirect(`/admin/messages?err=${encodeURIComponent("Davet kaydedildi ama e-posta gönderilemedi.")}#test-devices`, 303);
  }
  return c.redirect(`/admin/messages?ok=${encodeURIComponent(`${to} adresine davet gönderildi.`)}#test-devices`, 303);
});

adminMessages.post("/admin/messages/test-devices/:id/remove", async (c) => {
  if (!(await requireAdmin(c))) return c.redirect("/admin", 303);
  const id = c.req.param("id");
  if (/^[0-9a-f-]{36}$/.test(id)) await sql`delete from push_test_devices where id = ${id}`;
  return c.redirect(`/admin/messages?ok=${encodeURIComponent("Test cihazı kaldırıldı.")}#test-devices`, 303);
});

/**
 * The invite link from the email. Opened on the iPhone it hands the invite to the app; anywhere
 * else it says to open it on the iPhone.
 */
adminMessages.get("/test-device/:invite", (c) => {
  const invite = c.req.param("invite");
  if (!/^[A-Za-z0-9_-]{20,100}$/.test(invite)) return c.notFound();
  const app = `dailyclassical://test-device/${invite}`;
  c.header("Cache-Control", "no-store");
  c.header("X-Robots-Tag", "noindex, nofollow");
  c.header("Referrer-Policy", "no-referrer");
  return c.html(page("Test cihazı", html`<main class="narrow">
    <a class="wordmark" href="/" lang="en" style="margin-bottom:28px"><span class="icon" aria-hidden="true">d</span><span>DailyClassical</span></a>
    <h1>Test cihazı</h1>
    <p class="m">Bu bağlantıyı DailyClassical'ın kurulu olduğu iPhone'da açın. Uygulama açılır ve cihazı test cihazı olarak doğrular; bildirim izni sorulursa izin verin.</p>
    <a class="primary btn" href="${app}" style="display:flex;align-items:center;justify-content:center;text-decoration:none;margin-top:24px">DailyClassical'da aç</a>
    <script>${raw(`if (/iPhone|iPad/.test(navigator.userAgent)) location.href = ${JSON.stringify(app)};`)}</script>
  </main>`));
});

adminMessages.post("/admin/messages/push/:id/cancel", async (c) => {
  if (!(await requireAdmin(c))) return c.redirect("/admin", 303);
  const id = c.req.param("id");
  if (/^[0-9a-f-]{36}$/.test(id)) await sql`update push_campaigns set status = 'cancelled' where id = ${id} and status = 'scheduled'`;
  return c.redirect(`/admin/messages?ok=${encodeURIComponent("Zamanlanmış push iptal edildi.")}#history`, 303);
});

type InAppForm = {
  titleTr: string | null; bodyTr: string | null; buttonTr: string | null; titleEn: string | null; bodyEn: string | null; buttonEn: string | null;
  link: string | null; image: string | null; audience: Audience; minVersion: string | null; startsAt: Date; endsAt: Date | null;
};

function readInApp(f: Record<string, unknown>): InAppForm | string {
  const t = {
    titleTr: text(f.title_tr, 80), bodyTr: text(f.body_tr, 400), buttonTr: text(f.button_tr, 30),
    titleEn: text(f.title_en, 80), bodyEn: text(f.body_en, 400), buttonEn: text(f.button_en, 30),
  };
  const link = linkOf(f.link === "__custom" ? f.link_custom : f.link);
  const image = imageOf(f.image);
  const startsAt = fromLocal(String(f.starts_at ?? "")) ?? new Date();
  const endsAt = fromLocal(String(f.ends_at ?? ""));
  const minVersion = text(f.min_version, 20);
  const tr = !!(t.titleTr && t.bodyTr), en = !!(t.titleEn && t.bodyEn);
  return !tr && !en ? "Bir dilde başlık ve metin gerekli."
    : link === undefined ? "Link dailyclassical:// ya da https:// ile başlamalı."
    : image === undefined ? "Görsel adresi https:// ile başlamalı."
    : minVersion && !/^\d+(\.\d+){0,2}$/.test(minVersion) ? "En düşük sürüm 1.4 gibi yazılmalı."
    : endsAt && endsAt <= startsAt ? "Bitiş başlangıçtan sonra olmalı."
    : { ...t, link, image, audience: audienceOf(f.audience), minVersion, startsAt, endsAt };
}

async function saveInApp(email: string, m: InAppForm, test: boolean) {
  await sql`
    insert into in_app_messages (created_by, title_en, body_en, button_en, title_tr, body_tr, button_tr, link, image_url,
                                 audience, test_only, min_app_version, starts_at, ends_at)
    values (${email}, ${m.titleEn}, ${m.bodyEn}, ${m.buttonEn}, ${m.titleTr}, ${m.bodyTr}, ${m.buttonTr}, ${m.link}, ${m.image},
            ${m.audience}, ${test}, ${m.minVersion}, ${m.startsAt.toISOString()}::timestamptz,
            ${m.endsAt ? m.endsAt.toISOString() : null}::timestamptz)`;
}

adminMessages.post("/admin/messages/inapp", async (c) => {
  const email = await requireAdmin(c);
  if (!email) return c.redirect("/admin", 303);
  const m = readInApp(await c.req.parseBody());
  if (typeof m === "string") return c.redirect(`/admin/messages?err=${encodeURIComponent(m)}#inapp`, 303);
  await saveInApp(email, m, false);
  return c.redirect(`/admin/messages?ok=${encodeURIComponent("Uygulama içi mesaj kaydedildi.")}#inapp-list`, 303);
});

/**
 * "Test cihazlarında göster": the card goes live now for the verified test devices only, for a
 * day; the previous test card is switched off. The app shows it the next time it comes forward.
 * Called with fetch like the push test; not listed with the messages.
 */
adminMessages.post("/admin/messages/inapp/test", async (c) => {
  const email = await requireAdmin(c);
  if (!email) return c.json({ error: "Oturum kapanmış; sayfayı yenileyip yeniden girin." }, 401);
  const m = readInApp(await c.req.parseBody());
  if (typeof m === "string") return c.json({ error: m }, 400);
  await sql`update in_app_messages set active = false where test_only and active`;
  await saveInApp(email, { ...m, minVersion: null, startsAt: new Date(Date.now() - 60_000), endsAt: new Date(Date.now() + 86_400_000) }, true);
  return c.json({ ok: "Test kartı hazır: uygulamayı arka plana alıp yeniden açın." });
});

adminMessages.post("/admin/messages/inapp/:id/toggle", async (c) => {
  if (!(await requireAdmin(c))) return c.redirect("/admin", 303);
  const id = c.req.param("id");
  if (/^[0-9a-f-]{36}$/.test(id)) await sql`update in_app_messages set active = not active where id = ${id}`;
  return c.redirect("/admin/messages#inapp-list", 303);
});

// ---- View ----

async function messagesView(email: string, ok?: string, err?: string) {
  const [devices] = await sql<{ total: number; reachable: number; tr: number; en: number; premium: number; test: number; sandbox: number }[]>`
    select count(*)::int as total,
      count(*) filter (where environment = any(${apnsEnvironments()}) and not is_test)::int as reachable,
      count(*) filter (where locale = 'tr' and not is_test)::int as tr,
      count(*) filter (where locale <> 'tr' and not is_test)::int as en,
      count(*) filter (where is_premium and not is_test)::int as premium,
      (select count(*) from push_test_devices where verified_at is not null)::int as test,
      count(*) filter (where environment = 'sandbox')::int as sandbox
    from push_devices`;
  // Readers per app version: each install's latest version from the anonymous usage counts
  // (routes/events.ts), by when it was last active; test builds left out. Push-reachable
  // devices per version beside it. An estimate: an install that never opened the app since
  // updating still counts under its old version.
  const versions = await sql<{ version: string; d7: number; d30: number; push: number }[]>`
    with v as (
      select coalesce(app_version, '?') as version,
        count(*) filter (where last_seen >= current_date - 6)::int as d7,
        count(*) filter (where last_seen >= current_date - 29)::int as d30
      from app_installs where not is_test group by 1
    ), p as (
      select coalesce(app_version, '?') as version, count(*)::int as push
      from push_devices where not is_test and environment = any(${apnsEnvironments()}) group by 1
    )
    select coalesce(v.version, p.version) as version, coalesce(v.d7, 0) as d7, coalesce(v.d30, 0) as d30, coalesce(p.push, 0) as push
    from v full join p on p.version = v.version
    where coalesce(v.d30, 0) > 0 or coalesce(p.push, 0) > 0`;
  versions.sort((a, b) => compareVersions(b.version, a.version));
  const campaigns = await sql<Campaign[]>`
    select id, created_at::text, created_by, title_en, body_en, title_tr, body_tr, link, image_url, audience, test_only,
           send_at::text, status, sent_count, failed_count, opened_count
    from push_campaigns where not test_only order by send_at desc limit 50`;
  const messages = await sql<Message[]>`
    select id, created_at::text, title_en, body_en, button_en, title_tr, body_tr, button_tr, link, image_url, audience, test_only,
           min_app_version, starts_at::text, ends_at::text, active, shown_count, tapped_count
    from in_app_messages where not test_only order by created_at desc limit 50`;
  const testDevices = await sql<{ id: string; email: string; invited_at: string; expires_at: string; verified_at: string | null; device: string | null; app_version: string | null; has_token: boolean }[]>`
    select t.id, t.email, t.invited_at::text, t.expires_at::text, t.verified_at::text, t.device, t.app_version,
      exists (select 1 from push_devices d where d.token = t.push_token or (t.install_id is not null and d.install_id = t.install_id)) as has_token
    from push_test_devices t order by t.invited_at desc limit 50`;
  const pieces = await sql<{ id: string; title: string | null; composer: string | null }[]>`
    select pc.id, pl.title, cl.short_name as composer from pieces pc
    left join piece_localizations pl on pl.piece_id = pc.id and pl.locale = 'tr'
    left join composer_localizations cl on cl.composer_id = pc.composer_id and cl.locale = 'tr'
    order by cl.short_name, pl.title`;
  const now = toLocal(new Date(Date.now() + 60 * 60_000));
  const tile = (label: string, value: number, note?: string) =>
    html`<div class="tile"><div class="k">${label}</div><div class="v">${fmt.format(value)}</div>${note ? html`<div class="m">${note}</div>` : ""}</div>`;
  const pct = (a: number, b: number) => (b ? `%${Math.round((a / b) * 100)}` : "—");
  const both = (tr: string | null, en: string | null) =>
    html`${tr ? html`<div><span class="lang">TR</span> ${tr}</div>` : ""}${en ? html`<div><span class="lang">EN</span> ${en}</div>` : ""}`;
  const audienceCell = (a: Audience, test: boolean) => html`${AUDIENCES[a]}${test ? html`<div class="pill">yalnız test</div>` : ""}`;
  /** Where a tap leads: an app screen, a piece, or a web page (then the field below). */
  const linkPicker = () => html`<label class="grow">Deeplink
            <select name="link" data-link>
              <option value="">Yok (uygulama açılır)</option>
              <optgroup label="Uygulama">
                ${APP_LINKS.map(([v, l]) => html`<option value="${v}">${l}</option>`)}
              </optgroup>
              <optgroup label="Eser">
                ${pieces.map((p) => html`<option value="dailyclassical://piece/${p.id}">${p.composer ?? ""} · ${p.title ?? p.id}</option>`)}
              </optgroup>
              <option value="__custom">Web bağlantısı (https)…</option>
            </select>
          </label>
          <label class="grow link-custom">Web adresi <input name="link_custom" placeholder="https://www.dailyclassical.co/…"></label>`;

  return html`
    ${headerView(email, "messages")}
    <style>${raw(CSS)}</style>
    ${ok || err ? html`<div class="flash ${err ? "bad" : "ok"}" role="status" aria-live="polite">${err ?? ok}<button type="button" class="x" aria-label="Kapat">×</button></div>` : ""}

    <section>
      <h2>Bildirim alan cihazlar <span class="m">bildirime izin vermiş, 1.4 ve sonrası</span></h2>
      <div class="tiles">
        ${tile("Ulaşılabilir", devices!.reachable, "test cihazları hariç")}
        ${tile("Türkçe", devices!.tr)}
        ${tile("İngilizce", devices!.en)}
        ${tile("Premium", devices!.premium, pct(devices!.premium, devices!.tr + devices!.en))}
        ${tile("Test cihazı", devices!.test, "davetle doğrulanmış")}
      </div>
      ${!apnsConfigured() ? html`<p class="note">APNs anahtarı sunucuda tanımlı değil (APNS_KEY_ID, APNS_PRIVATE_KEY): push'lar kaydedilir ama gönderilmez.</p>` : ""}
      ${devices!.sandbox ? html`<p class="small m">${fmt.format(devices!.sandbox)} cihaz Xcode build'i (sandbox); anahtarımız yalnız Production olduğu için bunlara push gitmez.</p>` : ""}
    </section>

    <section id="versions">
      <h2>Sürümler <span class="m">son 30 günde açılan kurulumlar, en son açıldığı sürüme göre (tahmini)</span></h2>
      ${versions.length === 0 ? html`<p class="m">Henüz veri yok.</p>` : html`
      <div class="scroll"><table>
        <thead><tr><th>Sürüm</th><th class="n">Son 7 gün</th><th class="n">Son 30 gün</th><th class="n">Pay</th><th class="n">Bildirim alan</th></tr></thead>
        <tbody>${versions.map((v) => html`<tr>
          <td>${v.version}</td>
          <td class="n">${fmt.format(v.d7)}</td>
          <td class="n">${fmt.format(v.d30)}</td>
          <td class="n">${pct(v.d30, versions.reduce((a, x) => a + x.d30, 0))}</td>
          <td class="n">${fmt.format(v.push)}</td>
        </tr>`)}</tbody></table></div>`}
    </section>

    <section id="push">
      <h2>Yeni push</h2>
      <form class="card compose" method="post" action="/admin/messages/push">
        <div class="cols">
          <fieldset>
            <legend>Türkçe</legend>
            <label>Başlık <input name="title_tr" maxlength="100" data-p="title" placeholder="DailyClassical Premium ile daha iyi"></label>
            <label>Metin <textarea name="body_tr" maxlength="300" rows="3" data-p="body" placeholder="Geçmiş eserlerin tamamı, arama ve her günün tablosu duvar kâğıdı olarak."></textarea></label>
          </fieldset>
          <fieldset>
            <legend>İngilizce</legend>
            <label>Başlık <input name="title_en" maxlength="100" placeholder="Better with DailyClassical Premium"></label>
            <label>Metin <textarea name="body_en" maxlength="300" rows="3" placeholder="Every past piece, search, and each day's painting as a wallpaper."></textarea></label>
          </fieldset>
          <aside class="preview" aria-label="Önizleme">
            <div class="ct">Önizleme (Türkçe)</div>
            <div class="notif">
              <span class="appicon" aria-hidden="true">d</span>
              <div class="nt"><div class="nh"><b>DailyClassical</b><span>şimdi</span></div>
                <div class="ntitle" id="p-title">Başlık</div><div class="nbody" id="p-body">Metin</div></div>
              <img id="p-image" alt="" hidden>
            </div>
            <div class="testsend">
              <button type="button" class="secondary" data-test="/admin/messages/push/test">Test cihazlarına şimdi gönder</button>
              <span class="m small">${fmt.format(devices!.test)} cihaz</span>
            </div>
          </aside>
        </div>
        <div class="row">
          ${linkPicker()}
          <label class="grow">Görsel <input name="image" data-p="image" placeholder="https://www.dailyclassical.co/images/…jpg"></label>
        </div>
        <div class="foot">
          <label>Kime <select name="audience">${(Object.keys(AUDIENCES) as Audience[]).map((a) => html`<option value="${a}">${AUDIENCES[a]}</option>`)}</select></label>
          <label>Ne zaman <select name="when" data-when><option value="now">Hemen</option><option value="later">Zamanla</option></select></label>
          <label class="when-at">Saat <input type="datetime-local" name="send_at" value="${now}"></label>
          <button class="primary end" data-confirm="Bu push seçilen kitledeki gerçek kullanıcılara gidecek. Emin misiniz?">Kullanıcılara gönder</button>
        </div>
      </form>
    </section>

    <section id="history">
      <h2>Push'lar <span class="m">son 50</span></h2>
      ${campaigns.length === 0 ? html`<p class="m">Henüz push yok.</p>` : html`
      <div class="scroll"><table>
        <thead><tr><th>Zaman</th><th>Mesaj</th><th>Kime</th><th>Durum</th><th class="n">Giden</th><th class="n">Açılan</th><th></th></tr></thead>
        <tbody>${campaigns.map((x) => html`<tr>
          <td class="day">${when(x.send_at)}</td>
          <td class="msg">${both(x.title_tr && `${x.title_tr} — ${x.body_tr}`, x.title_en && `${x.title_en} — ${x.body_en}`)}
            ${x.link ? html`<div class="m small"><code>${x.link}</code></div>` : ""}</td>
          <td>${audienceCell(x.audience, x.test_only)}</td>
          <td>${STATUS[x.status] ?? x.status}</td>
          <td class="n">${x.status === "sent" ? html`${fmt.format(x.sent_count)}${x.failed_count ? html`<div class="m small">${fmt.format(x.failed_count)} hata</div>` : ""}` : "—"}</td>
          <td class="n">${x.status === "sent" ? html`${fmt.format(x.opened_count)}<div class="m small">${pct(x.opened_count, x.sent_count)}</div>` : "—"}</td>
          <td>${x.status === "scheduled" ? html`<form method="post" action="/admin/messages/push/${x.id}/cancel"><button class="link">İptal</button></form>` : ""}</td>
        </tr>`)}</tbody></table></div>`}
    </section>

    <section id="test-devices">
      <h2>Test cihazları</h2>
      <form class="card compose invite" method="post" action="/admin/messages/test-devices">
        <div class="row">
          <label class="grow">E-posta <input type="email" name="email" required placeholder="ad@ornek.com"></label>
          <button class="primary">Davet gönder</button>
        </div>
      </form>
      ${testDevices.length === 0 ? "" : html`
      <div class="scroll" style="margin-top:12px"><table>
        <thead><tr><th>E-posta</th><th>Durum</th><th>Cihaz</th><th>Bildirim</th><th></th></tr></thead>
        <tbody>${testDevices.map((t) => html`<tr>
          <td>${t.email}<div class="m small">davet ${when(t.invited_at)}</div></td>
          <td>${t.verified_at ? html`Doğrulandı<div class="m small">${when(t.verified_at)}</div>`
            : new Date(t.expires_at) < new Date() ? "Süresi doldu" : html`Bekliyor<div class="m small">${when(t.expires_at)}'e kadar</div>`}</td>
          <td>${t.device ?? "—"}${t.app_version ? html`<div class="m small">${t.app_version}</div>` : ""}</td>
          <td>${t.verified_at ? (t.has_token ? "İzin var" : "İzin yok") : "—"}</td>
          <td><form method="post" action="/admin/messages/test-devices/${t.id}/remove"><button class="link">Kaldır</button></form></td>
        </tr>`)}</tbody></table></div>`}
    </section>

    <section id="inapp">
      <h2>Yeni uygulama içi mesaj</h2>
      <form class="card compose" method="post" action="/admin/messages/inapp">
        <div class="cols">
          <fieldset>
            <legend>Türkçe</legend>
            <label>Başlık <input name="title_tr" maxlength="80" data-q="title" placeholder="Black Friday"></label>
            <label>Metin <textarea name="body_tr" maxlength="400" rows="4" data-q="body"></textarea></label>
            <label>Buton <input name="button_tr" maxlength="30" data-q="button" placeholder="Premium'a bak"></label>
          </fieldset>
          <fieldset>
            <legend>İngilizce</legend>
            <label>Başlık <input name="title_en" maxlength="80"></label>
            <label>Metin <textarea name="body_en" maxlength="400" rows="4"></textarea></label>
            <label>Buton <input name="button_en" maxlength="30" placeholder="See Premium"></label>
          </fieldset>
          <aside class="preview" aria-label="Önizleme">
            <div class="ct">Önizleme (Türkçe)</div>
            <div class="iam">
              <img id="q-image" alt="" hidden>
              <div class="iamt" id="q-title">Başlık</div>
              <div class="iamb" id="q-body">Metin</div>
              <div class="iambtn" id="q-button" hidden>Buton</div>
              <div class="iamclose">Kapat</div>
            </div>
            <div class="testsend">
              <button type="button" class="secondary" data-test="/admin/messages/inapp/test">Test cihazlarında göster</button>
              <span class="m small">${fmt.format(devices!.test)} cihaz</span>
            </div>
          </aside>
        </div>
        <div class="row">
          ${linkPicker()}
          <label class="grow">Görsel <input name="image" data-q="image" placeholder="https://www.dailyclassical.co/images/…jpg"></label>
        </div>
        <div class="foot">
          <label>Kime <select name="audience">${(Object.keys(AUDIENCES) as Audience[]).map((a) => html`<option value="${a}">${AUDIENCES[a]}</option>`)}</select></label>
          <label>En düşük sürüm <input name="min_version" placeholder="1.4" size="5"></label>
          <label>Başlangıç <input type="datetime-local" name="starts_at" value="${toLocal(new Date())}"></label>
          <label>Bitiş <input type="datetime-local" name="ends_at"></label>
          <button class="primary end" data-confirm="Bu kart seçilen kitledeki gerçek kullanıcılara gösterilecek. Emin misiniz?">Kullanıcılar için yayınla</button>
        </div>
      </form>
    </section>

    <section id="inapp-list">
      <h2>Uygulama içi mesajlar <span class="m">son 50</span></h2>
      ${messages.length === 0 ? html`<p class="m">Henüz mesaj yok.</p>` : html`
      <div class="scroll"><table>
        <thead><tr><th>Yayın</th><th>Mesaj</th><th>Kime</th><th>Durum</th><th class="n">Gösterim</th><th class="n">Tıklama</th><th></th></tr></thead>
        <tbody>${messages.map((m) => {
          const live = m.active && new Date(m.starts_at) <= new Date() && (!m.ends_at || new Date(m.ends_at) > new Date());
          const state = !m.active ? "Kapalı" : live ? "Yayında" : m.ends_at && new Date(m.ends_at) <= new Date() ? "Bitti" : "Bekliyor";
          return html`<tr>
          <td class="day">${when(m.starts_at)}${m.ends_at ? html`<div class="m small">→ ${when(m.ends_at)}</div>` : ""}</td>
          <td class="msg">${both(m.title_tr && `${m.title_tr} — ${m.body_tr}`, m.title_en && `${m.title_en} — ${m.body_en}`)}
            ${m.link ? html`<div class="m small"><code>${m.link}</code></div>` : ""}</td>
          <td>${audienceCell(m.audience, m.test_only)}${m.min_app_version ? html`<div class="m small">${m.min_app_version}+</div>` : ""}</td>
          <td>${state}</td>
          <td class="n">${fmt.format(m.shown_count)}</td>
          <td class="n">${fmt.format(m.tapped_count)}<div class="m small">${pct(m.tapped_count, m.shown_count)}</div></td>
          <td><form method="post" action="/admin/messages/inapp/${m.id}/toggle"><button class="link">${m.active ? "Kapat" : "Aç"}</button></form></td>
        </tr>`;
        })}</tbody></table></div>`}
    </section>
    <script>${raw(JS)}</script>`;
}

const CSS = `
.flash{position:fixed;top:16px;right:16px;z-index:50;max-width:min(440px,calc(100% - 32px));margin:0;display:flex;align-items:center;gap:12px;
  padding:12px 10px 12px 18px;border-radius:22px;font-size:14px;line-height:1.35;background:var(--ink);color:var(--bg);
  box-shadow:0 10px 30px rgba(0,0,0,.22);animation:flash-in .25s ease-out;transition:opacity .3s,transform .3s}
.flash.bad{background:var(--danger);color:#fff}
.flash.out{opacity:0;transform:translateY(-8px)}
.flash .x{border:0;background:none;color:inherit;opacity:.7;font-size:20px;line-height:1;width:28px;height:28px;cursor:pointer;flex:none}
@keyframes flash-in{from{opacity:0;transform:translateY(-8px)}to{opacity:1;transform:none}}
@media (max-width:560px){.flash{left:16px;right:16px;max-width:none}}
.compose{display:flex;flex-direction:column;gap:14px;padding:18px}
.compose .cols{display:grid;grid-template-columns:1fr 1fr minmax(260px,320px);gap:16px}
@media (max-width:900px){.compose .cols{grid-template-columns:1fr}}
.compose fieldset{border:0;margin:0;padding:0;display:flex;flex-direction:column;gap:10px;min-width:0}
.compose legend{font:500 16px Literata,Georgia,serif;margin-bottom:6px;padding:0}
.compose label{display:flex;flex-direction:column;gap:4px}
.compose input:not([type=checkbox]):not([type=radio]),.compose textarea,.compose select{font:inherit;font-size:15px;padding:9px 11px;border-radius:10px;border:0;box-shadow:inset 0 0 0 .5px var(--rule);background:var(--bg);color:var(--ink);width:100%;min-width:0}
.compose textarea{resize:vertical}
.compose .row{display:flex;flex-wrap:wrap;gap:12px;align-items:flex-end}
.compose .row label{flex:0 1 auto}
.compose .row .grow{flex:1 1 260px}
.compose .row input[type=datetime-local]{width:auto}
.compose label.check{flex-direction:row;align-items:center;gap:8px;font-size:14px;color:var(--ink);padding:9px 0}
.compose .primary{align-self:flex-start;padding:0 22px;height:44px}
.preview{min-width:0}
.notif{display:grid;grid-template-columns:38px 1fr auto;gap:10px;align-items:start;padding:12px;border-radius:22px;background:rgba(127,127,127,.14);backdrop-filter:blur(20px)}
.appicon{width:38px;height:38px;border-radius:9px;background:#F5F2EC;box-shadow:inset 0 0 0 1px rgba(30,27,23,.12);display:flex;align-items:center;justify-content:center;font:500 28px/1 Literata,Georgia,serif;color:#1E1B17;padding-bottom:3px}
.nt{min-width:0;font-size:14px;line-height:1.3}
.nh{display:flex;justify-content:space-between;gap:8px;font-size:12px;color:var(--ink2)}
.nh b{color:var(--ink);font-weight:600}
.ntitle{font-weight:600;margin-top:2px}
.nbody{white-space:pre-wrap;display:-webkit-box;-webkit-line-clamp:4;-webkit-box-orient:vertical;overflow:hidden}
.notif img{width:38px;height:38px;border-radius:8px;object-fit:cover}
.iam{background:var(--bg);border-radius:24px;padding:18px;box-shadow:0 0 0 .5px var(--rule);display:flex;flex-direction:column;gap:8px;text-align:center}
.iam img{width:100%;aspect-ratio:4/3;object-fit:cover;border-radius:14px}
.iamt{font:500 22px/1.2 Literata,Georgia,serif}
.iamb{font-size:15px;color:var(--ink2);white-space:pre-wrap}
.iambtn{margin-top:6px;height:44px;border-radius:22px;background:var(--accent);color:var(--onaccent);font-weight:600;display:flex;align-items:center;justify-content:center}
.iamclose{font-size:14px;color:var(--ink2)}
.msg{min-width:280px;max-width:520px}
.msg div+div{margin-top:4px}
.lang{display:inline-block;font-size:10px;font-weight:700;letter-spacing:.04em;color:var(--ink2);box-shadow:inset 0 0 0 .5px var(--rule);border-radius:4px;padding:0 4px;margin-right:4px;vertical-align:1px}
.pill{display:inline-block;margin-top:4px;font-size:11px;padding:1px 7px;border-radius:10px;background:var(--today);color:var(--accent)}
.link{border:0;background:none;color:var(--accent);padding:0;font-size:14px}
td .link{min-height:0;height:auto;line-height:inherit}
.secondary{height:40px;padding:0 18px;border-radius:20px;border:0;background:var(--today);color:var(--accent);font-weight:600;box-shadow:inset 0 0 0 1px var(--accent)}
.compose .foot{display:flex;flex-wrap:wrap;gap:12px;align-items:flex-end;padding-top:14px;border-top:.5px solid var(--rule)}
.compose .foot label{flex:0 1 auto}
.compose .foot input,.compose .foot select{height:40px;padding-top:0;padding-bottom:0}
.compose .foot input[type=datetime-local]{width:auto}
.compose select{-webkit-appearance:none;appearance:none;padding-right:32px;cursor:pointer;
  background-image:url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='10' height='6' viewBox='0 0 10 6'%3E%3Cpath d='M1 1l4 4 4-4' fill='none' stroke='%237A736B' stroke-width='1.5' stroke-linecap='round' stroke-linejoin='round'/%3E%3C/svg%3E");
  background-repeat:no-repeat;background-position:right 12px center}
.compose .foot .primary.end{margin:0 0 0 auto;height:40px;align-self:flex-end}
.compose .when-at{display:none}
.compose .link-custom{display:none}
.compose .row:has(select[data-link] option[value=__custom]:checked) .link-custom{display:flex}
.compose:has(select[data-when] option[value=later]:checked) .when-at{display:flex}
.testsend{display:flex;align-items:center;gap:10px;flex-wrap:wrap;margin-top:14px}
.invite{padding:14px 18px}.invite .row{align-items:flex-end}.invite .primary{align-self:flex-end;margin:0;height:40px;padding:0 20px}
`;

/** Live preview of the Turkish text as it is typed. */
const JS = `
for (const [prefix, form] of [["p", document.querySelector('form[action$="/push"]')], ["q", document.querySelector('form[action$="/inapp"]')]]) {
  if (!form) continue;
  const fields = form.querySelectorAll("[data-" + prefix + "]");
  const update = () => fields.forEach((el) => {
    const key = el.dataset[prefix];
    const out = document.getElementById(prefix + "-" + key);
    if (!out) return;
    if (key === "image") { out.hidden = !/^https:\\/\\//.test(el.value); if (!out.hidden) out.src = el.value; return; }
    if (key === "button") out.hidden = !el.value.trim();
    out.textContent = el.value.trim() || (key === "title" ? "Başlık" : key === "body" ? "Metin" : "Buton");
  });
  fields.forEach((el) => el.addEventListener("input", update));
  update();
}
/** A toast like the one after a form post. */
function toast(message, bad) {
  document.querySelector(".flash")?.remove();
  const el = document.createElement("div");
  el.className = "flash " + (bad ? "bad" : "ok");
  el.setAttribute("role", "status");
  el.textContent = message;
  const x = document.createElement("button");
  x.type = "button"; x.className = "x"; x.setAttribute("aria-label", "Kapat"); x.textContent = "×";
  el.appendChild(x);
  document.body.appendChild(el);
  const hide = () => { el.classList.add("out"); setTimeout(() => el.remove(), 300); };
  x.addEventListener("click", hide);
  if (!bad) setTimeout(hide, 5000);
}
// Test sends post the form with fetch: the page and what was typed stay as they are.
document.querySelectorAll("[data-test]").forEach((b) => b.addEventListener("click", async () => {
  const label = b.textContent;
  b.disabled = true; b.textContent = "Gönderiliyor…";
  try {
    const r = await fetch(b.dataset.test, { method: "POST", body: new FormData(b.form), credentials: "same-origin" });
    const j = await r.json().catch(() => ({ error: "Beklenmeyen bir hata oluştu." }));
    toast(j.ok ?? j.error, !j.ok);
  } catch { toast("Sunucuya ulaşılamadı.", true); }
  b.disabled = false; b.textContent = label;
}));
// The result of the last action: a toast that goes after a few seconds (errors stay until closed);
// the ok/err query is dropped so a reload doesn't show it again.
const flash = document.querySelector(".flash");
if (flash) {
  const hide = () => { flash.classList.add("out"); setTimeout(() => flash.remove(), 300); };
  flash.querySelector(".x").addEventListener("click", hide);
  if (!flash.classList.contains("bad")) setTimeout(hide, 5000);
  const u = new URL(location.href); u.searchParams.delete("ok"); u.searchParams.delete("err");
  history.replaceState(null, "", u.pathname + u.search + u.hash);
}
document.querySelectorAll("[data-confirm]").forEach((b) => b.addEventListener("click", (e) => { if (!confirm(b.dataset.confirm)) e.preventDefault(); }));
// "Zamanla" shows the time field (CSS) and renames the send button.
const whenSelect = document.querySelector("select[data-when]");
whenSelect?.addEventListener("change", () => {
  const send = whenSelect.form.querySelector(".primary.end");
  send.textContent = whenSelect.value === "later" ? "Zamanla" : "Kullanıcılara gönder";
  send.dataset.confirm = whenSelect.value === "later"
    ? "Bu push seçilen saatte gerçek kullanıcılara gidecek. Emin misiniz?"
    : "Bu push seçilen kitledeki gerçek kullanıcılara gidecek. Emin misiniz?";
});
`;
