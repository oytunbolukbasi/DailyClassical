import { sql } from "../db/client.js";
import { apnsConfigured, apnsEnvironments, apnsSession, type ApnsEnvironment, type ApnsMessage } from "./apns.js";

/**
 * Sends the push campaigns from /admin/messages when their time comes. A loop checks once a
 * minute; a campaign is taken with a single UPDATE … WHERE status = 'scheduled' RETURNING, so with
 * several API instances only one sends it. Each device gets the text in its language (tr, or en
 * for everything else); a language whose title or text is empty is skipped.
 */
export type Audience = "all" | "free" | "premium";
export type CampaignRow = {
  id: string; title_en: string | null; body_en: string | null; title_tr: string | null; body_tr: string | null;
  link: string | null; image_url: string | null; audience: Audience; test_only: boolean;
};
type Device = { token: string; environment: ApnsEnvironment; locale: string };

const PARALLEL = 20;

/** The devices a campaign goes to, in the environments we can send to. */
export async function recipients(c: Pick<CampaignRow, "audience" | "test_only">): Promise<Device[]> {
  // Test sends go to the verified test devices (push_test_devices), whatever their Premium state.
  if (c.test_only) {
    return sql<Device[]>`
      select d.token, d.environment, d.locale from push_devices d
      where d.environment = any(${apnsEnvironments()})
        and exists (select 1 from push_test_devices t where t.verified_at is not null
                    and (t.push_token = d.token or (t.install_id is not null and t.install_id = d.install_id)))`;
  }
  return sql<Device[]>`
    select token, environment, locale from push_devices
    where environment = any(${apnsEnvironments()})
      and (${c.audience} = 'all' or (${c.audience} = 'premium') = is_premium)`;
}

export function messageFor(c: CampaignRow, locale: string): ApnsMessage | null {
  const tr = locale === "tr";
  const title = (tr ? c.title_tr : c.title_en)?.trim();
  const body = (tr ? c.body_tr : c.body_en)?.trim();
  if (!title || !body) return null;
  return { title, body, link: c.link, imageUrl: c.image_url, campaignId: c.id };
}

export async function sendCampaign(c: CampaignRow): Promise<{ sent: number; failed: number }> {
  const devices = await recipients(c);
  let sent = 0;
  let failed = 0;
  const gone: string[] = [];
  for (const environment of apnsEnvironments()) {
    const list = devices.filter((d) => d.environment === environment);
    if (list.length === 0) continue;
    const apns = apnsSession(environment);
    try {
      for (let i = 0; i < list.length; i += PARALLEL) {
        await Promise.all(list.slice(i, i + PARALLEL).map(async (d) => {
          const message = messageFor(c, d.locale);
          if (!message) return;
          const r = await apns.send(d.token, message);
          if (r.ok) { sent++; return; }
          failed++;
          if (r.gone) gone.push(d.token);
          else console.warn(`apns ${c.id}: ${r.reason}`);
        }));
      }
    } finally {
      apns.close();
    }
  }
  if (gone.length) await sql`delete from push_devices where token = any(${gone})`;
  return { sent, failed };
}

/** Takes and sends every campaign whose time has come. */
export async function sendDueCampaigns(): Promise<void> {
  const due = await sql<CampaignRow[]>`
    update push_campaigns set status = 'sending'
    where id in (select id from push_campaigns where status = 'scheduled' and send_at <= now() order by send_at limit 5)
    returning id, title_en, body_en, title_tr, body_tr, link, image_url, audience, test_only`;
  for (const c of due) {
    try {
      const r = await sendCampaign(c);
      await sql`update push_campaigns set status = 'sent', sent_at = now(), sent_count = ${r.sent}, failed_count = ${r.failed} where id = ${c.id}`;
      console.log(`push ${c.id}: ${r.sent} sent, ${r.failed} failed`);
    } catch (e) {
      console.error(`push ${c.id}`, e);
      await sql`update push_campaigns set status = 'failed', sent_at = now() where id = ${c.id}`;
    }
  }
}

/** Started once from index.ts. Without an APNs key it does nothing (campaigns wait). */
export function startPushLoop(): void {
  if (!apnsConfigured()) {
    console.log("push: APNs key not set, campaigns are not sent");
    return;
  }
  let running = false;
  const tick = async () => {
    if (running) return;
    running = true;
    try { await sendDueCampaigns(); } catch (e) { console.error("push loop", e); } finally { running = false; }
  };
  setInterval(tick, 60_000).unref();
  void tick();
}
