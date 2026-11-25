import { Hono, type Context } from "hono";
import { html, raw } from "hono/html";
import { sql } from "../db/client.js";
import { apnsConfigured, apnsEnvironments } from "../lib/apns.js";
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
const audienceOf = (v: unknown): Audience => (v === "free" || v === "premium" ? v : "all");

async function requireAdmin(c: Context): Promise<string | null> {
  return sessionEmail(c);
}

// ---- Pages ----

adminMessages.get("/admin/messages", async (c) => {
  const email = await requireAdmin(c);
  if (!email) return c.redirect("/admin", 303);
  return c.html(page("Mesajlar", await messagesView(email, c.req.query("ok"), c.req.query("err"))));
});

adminMessages.post("/admin/messages/push", async (c) => {
  const email = await requireAdmin(c);
  if (!email) return c.redirect("/admin", 303);
  const f = await c.req.parseBody();
  const t = { titleTr: text(f.title_tr, 100), bodyTr: text(f.body_tr, 300), titleEn: text(f.title_en, 100), bodyEn: text(f.body_en, 300) };
  const link = linkOf(f.link);
  const image = imageOf(f.image);
  const tr = !!(t.titleTr && t.bodyTr), en = !!(t.titleEn && t.bodyEn);
  const sendAt = f.when === "later" ? fromLocal(String(f.send_at ?? "")) : new Date();
  const err = !tr && !en ? "Bir dilde başlık ve metin gerekli."
    : (t.titleTr || t.bodyTr) && !tr ? "Türkçe başlık ve metin birlikte yazılmalı."
    : (t.titleEn || t.bodyEn) && !en ? "İngilizce başlık ve metin birlikte yazılmalı."
    : link === undefined ? "Link dailyclassical:// ya da https:// ile başlamalı."
    : image === undefined ? "Görsel adresi https:// ile başlamalı."
    : !sendAt ? "Gönderim zamanı seçin." : null;
  if (err) return c.redirect(`/admin/messages?err=${encodeURIComponent(err)}#push`, 303);
  await sql`
    insert into push_campaigns (created_by, title_en, body_en, title_tr, body_tr, link, image_url, audience, test_only, send_at)
    values (${email}, ${t.titleEn}, ${t.bodyEn}, ${t.titleTr}, ${t.bodyTr}, ${link ?? null}, ${image ?? null},
            ${audienceOf(f.audience)}, ${f.test_only === "1"}, ${sendAt!.toISOString()}::timestamptz)`;
  const ok = f.when === "later" ? "Push zamanlandı." : apnsConfigured() ? "Push gönderim sırasına alındı; bir dakika içinde gider." : "Push kaydedildi; APNs anahtarı tanımlı olmadığı için gönderilmeyecek.";
  return c.redirect(`/admin/messages?ok=${encodeURIComponent(ok)}#history`, 303);
});

adminMessages.post("/admin/messages/push/:id/cancel", async (c) => {
  if (!(await requireAdmin(c))) return c.redirect("/admin", 303);
  const id = c.req.param("id");
  if (/^[0-9a-f-]{36}$/.test(id)) await sql`update push_campaigns set status = 'cancelled' where id = ${id} and status = 'scheduled'`;
  return c.redirect(`/admin/messages?ok=${encodeURIComponent("Zamanlanmış push iptal edildi.")}#history`, 303);
});

adminMessages.post("/admin/messages/inapp", async (c) => {
  const email = await requireAdmin(c);
  if (!email) return c.redirect("/admin", 303);
  const f = await c.req.parseBody();
  const t = {
    titleTr: text(f.title_tr, 80), bodyTr: text(f.body_tr, 400), buttonTr: text(f.button_tr, 30),
    titleEn: text(f.title_en, 80), bodyEn: text(f.body_en, 400), buttonEn: text(f.button_en, 30),
  };
  const link = linkOf(f.link);
  const image = imageOf(f.image);
  const startsAt = fromLocal(String(f.starts_at ?? "")) ?? new Date();
  const endsAt = fromLocal(String(f.ends_at ?? ""));
  const minVersion = text(f.min_version, 20);
  const tr = !!(t.titleTr && t.bodyTr), en = !!(t.titleEn && t.bodyEn);
  const err = !tr && !en ? "Bir dilde başlık ve metin gerekli."
    : link === undefined ? "Link dailyclassical:// ya da https:// ile başlamalı."
    : image === undefined ? "Görsel adresi https:// ile başlamalı."
    : minVersion && !/^\d+(\.\d+){0,2}$/.test(minVersion) ? "En düşük sürüm 1.4 gibi yazılmalı."
    : endsAt && endsAt <= startsAt ? "Bitiş başlangıçtan sonra olmalı." : null;
  if (err) return c.redirect(`/admin/messages?err=${encodeURIComponent(err)}#inapp`, 303);
  await sql`
    insert into in_app_messages (created_by, title_en, body_en, button_en, title_tr, body_tr, button_tr, link, image_url,
                                 audience, test_only, min_app_version, starts_at, ends_at)
    values (${email}, ${t.titleEn}, ${t.bodyEn}, ${t.buttonEn}, ${t.titleTr}, ${t.bodyTr}, ${t.buttonTr}, ${link ?? null}, ${image ?? null},
            ${audienceOf(f.audience)}, ${f.test_only === "1"}, ${minVersion}, ${startsAt.toISOString()}::timestamptz,
            ${endsAt ? endsAt.toISOString() : null}::timestamptz)`;
  return c.redirect(`/admin/messages?ok=${encodeURIComponent("Uygulama içi mesaj kaydedildi.")}#inapp-list`, 303);
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
      count(*) filter (where is_test)::int as test,
      count(*) filter (where environment = 'sandbox')::int as sandbox
    from push_devices`;
  const campaigns = await sql<Campaign[]>`
    select id, created_at::text, created_by, title_en, body_en, title_tr, body_tr, link, image_url, audience, test_only,
           send_at::text, status, sent_count, failed_count, opened_count
    from push_campaigns order by send_at desc limit 50`;
  const messages = await sql<Message[]>`
    select id, created_at::text, title_en, body_en, button_en, title_tr, body_tr, button_tr, link, image_url, audience, test_only,
           min_app_version, starts_at::text, ends_at::text, active, shown_count, tapped_count
    from in_app_messages order by created_at desc limit 50`;
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
  const linkHelp = html`<datalist id="links">
      <option value="dailyclassical://premium">Premium ekranı</option>
      <option value="dailyclassical://today">Bugün</option>
      ${pieces.map((p) => html`<option value="dailyclassical://piece/${p.id}">${p.composer ?? ""} · ${p.title ?? p.id}</option>`)}
    </datalist>`;

  return html`
    ${headerView(email, "messages")}
    <style>${raw(CSS)}</style>
    ${ok ? html`<p class="flash ok">${ok}</p>` : ""}${err ? html`<p class="flash bad">${err}</p>` : ""}

    <section>
      <h2>Bildirim alan cihazlar <span class="m">bildirime izin vermiş, 1.4 ve sonrası</span></h2>
      <div class="tiles">
        ${tile("Ulaşılabilir", devices!.reachable, "test cihazları hariç")}
        ${tile("Türkçe", devices!.tr)}
        ${tile("İngilizce", devices!.en)}
        ${tile("Premium", devices!.premium, pct(devices!.premium, devices!.tr + devices!.en))}
        ${tile("Test cihazı", devices!.test, "TestFlight ve Xcode")}
      </div>
      ${!apnsConfigured() ? html`<p class="note">APNs anahtarı sunucuda tanımlı değil (APNS_KEY_ID, APNS_PRIVATE_KEY): push'lar kaydedilir ama gönderilmez.</p>` : ""}
      ${devices!.sandbox ? html`<p class="small m">${fmt.format(devices!.sandbox)} cihaz Xcode build'i (sandbox); anahtarımız yalnız Production olduğu için bunlara push gitmez.</p>` : ""}
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
            <p class="small m">Bir dili boş bırakırsanız o dildeki cihazlara gönderilmez.</p>
          </aside>
        </div>
        <div class="row">
          <label class="grow">Link <span class="m">(isteğe bağlı)</span><input name="link" list="links" placeholder="dailyclassical://premium"></label>
          <label class="grow">Görsel <span class="m">(isteğe bağlı, https)</span><input name="image" data-p="image" placeholder="https://www.dailyclassical.co/images/…jpg"></label>
        </div>
        <div class="row">
          <label>Kime <select name="audience">${(Object.keys(AUDIENCES) as Audience[]).map((a) => html`<option value="${a}">${AUDIENCES[a]}</option>`)}</select></label>
          <label class="check"><input type="checkbox" name="test_only" value="1" checked> Yalnız test cihazlarına</label>
        </div>
        <div class="row">
          <label class="check"><input type="radio" name="when" value="now" checked> Hemen</label>
          <label class="check"><input type="radio" name="when" value="later"> Zamanla</label>
          <input type="datetime-local" name="send_at" value="${now}" aria-label="Gönderim zamanı (İstanbul)">
          <span class="m small">İstanbul saati</span>
        </div>
        <button class="primary">Push'u kaydet</button>
      </form>
      ${linkHelp}
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

    <section id="inapp">
      <h2>Yeni uygulama içi mesaj <span class="m">uygulama açılınca bir kez gösterilen kart</span></h2>
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
            <p class="small m">Uygulamada tasarım sistemimizle gösterilir; bu yaklaşık bir önizleme.</p>
          </aside>
        </div>
        <div class="row">
          <label class="grow">Link <span class="m">(butona basınca)</span><input name="link" list="links" placeholder="dailyclassical://premium"></label>
          <label class="grow">Görsel <span class="m">(isteğe bağlı, https)</span><input name="image" data-q="image"></label>
        </div>
        <div class="row">
          <label>Kime <select name="audience">${(Object.keys(AUDIENCES) as Audience[]).map((a) => html`<option value="${a}">${AUDIENCES[a]}</option>`)}</select></label>
          <label>En düşük sürüm <input name="min_version" placeholder="1.4" size="6"></label>
          <label class="check"><input type="checkbox" name="test_only" value="1" checked> Yalnız test cihazlarına</label>
        </div>
        <div class="row">
          <label>Başlangıç <input type="datetime-local" name="starts_at" value="${toLocal(new Date())}"></label>
          <label>Bitiş <span class="m">(isteğe bağlı)</span><input type="datetime-local" name="ends_at"></label>
          <span class="m small">İstanbul saati</span>
        </div>
        <button class="primary">Mesajı kaydet</button>
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
.flash{margin:16px 0 0;padding:12px 16px;border-radius:12px;font-size:14px}
.flash.ok{background:var(--today);color:var(--ink)}
.flash.bad{background:rgba(179,38,30,.1);color:var(--danger)}
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
const later = document.querySelector('input[name="when"][value="later"]');
document.querySelector('input[name="send_at"]')?.addEventListener("focus", () => { if (later) later.checked = true; });
`;
