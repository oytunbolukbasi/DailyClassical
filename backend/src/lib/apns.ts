import { connect, type ClientHttp2Session } from "node:http2";
import { importPKCS8, SignJWT } from "jose";
import { env } from "../env.js";
import { normalizePrivateKey } from "./apple.js";

/**
 * Sends pushes to Apple (APNs) over HTTP/2 with token auth: a short ES256 JWT signed with the
 * .p8 key (APNS_KEY_ID, APNS_PRIVATE_KEY, APPLE_TEAM_ID), reused for 50 minutes as Apple asks
 * (it rejects a new token more often than every 20 minutes and an older one than an hour).
 */
export type ApnsEnvironment = "production" | "sandbox";
export type ApnsMessage = { title: string; body: string; link?: string | null; imageUrl?: string | null; campaignId?: string };
/** `gone`: Apple says the token is no longer valid for this app (delete it). */
export type ApnsResult = { ok: true } | { ok: false; gone: boolean; status: number; reason: string };

const HOSTS: Record<ApnsEnvironment, string> = {
  production: "https://api.push.apple.com",
  sandbox: "https://api.sandbox.push.apple.com",
};

export const apnsConfigured = () => !!(env.APNS_KEY_ID && env.APNS_PRIVATE_KEY && env.APPLE_TEAM_ID);
/** The key we have is Production-only; sandbox tokens (Xcode builds) are skipped unless APNS_SANDBOX. */
export const apnsEnvironments = (): ApnsEnvironment[] => (env.APNS_SANDBOX ? ["production", "sandbox"] : ["production"]);

let cachedToken: { jwt: string; at: number } | null = null;
async function providerToken(): Promise<string> {
  if (cachedToken && Date.now() - cachedToken.at < 50 * 60_000) return cachedToken.jwt;
  const key = await importPKCS8(normalizePrivateKey(env.APNS_PRIVATE_KEY!), "ES256");
  const jwt = await new SignJWT({}).setProtectedHeader({ alg: "ES256", kid: env.APNS_KEY_ID! })
    .setIssuer(env.APPLE_TEAM_ID!).setIssuedAt().sign(key);
  cachedToken = { jwt, at: Date.now() };
  return jwt;
}

/** The notification as the app reads it: `link` and `cid` next to `aps` (Features/Push in the app). */
export function payloadOf(m: ApnsMessage): string {
  const aps: Record<string, unknown> = { alert: { title: m.title, body: m.body }, sound: "default" };
  // The app's Notification Service Extension downloads `image` and attaches it.
  if (m.imageUrl) aps["mutable-content"] = 1;
  return JSON.stringify({
    aps,
    ...(m.link ? { link: m.link } : {}),
    ...(m.imageUrl ? { image: m.imageUrl } : {}),
    ...(m.campaignId ? { cid: m.campaignId } : {}),
  });
}

/** Reasons after which Apple will never accept the token again for this topic. */
const GONE = new Set(["BadDeviceToken", "Unregistered", "DeviceTokenNotForTopic"]);

/** One HTTP/2 connection per environment for a whole send; close it with `close()`. */
export function apnsSession(environment: ApnsEnvironment) {
  let session: ClientHttp2Session | null = null;
  const open = () => {
    if (!session || session.closed || session.destroyed) {
      session = connect(HOSTS[environment]);
      session.on("error", () => { session = null; });
    }
    return session;
  };

  async function send(token: string, message: ApnsMessage): Promise<ApnsResult> {
    const jwt = await providerToken();
    const body = payloadOf(message);
    return new Promise((resolve) => {
      let status = 0;
      let data = "";
      const req = open().request({
        ":method": "POST",
        ":path": `/3/device/${token}`,
        authorization: `bearer ${jwt}`,
        "apns-topic": env.APPLE_BUNDLE_ID,
        "apns-push-type": "alert",
        "apns-priority": "10",
        "content-type": "application/json",
      });
      req.setTimeout(15_000, () => req.close());
      req.on("response", (h) => { status = Number(h[":status"]); });
      req.setEncoding("utf8");
      req.on("data", (chunk) => { data += chunk; });
      req.on("end", () => {
        if (status === 200) return resolve({ ok: true });
        let reason = "";
        try { reason = (JSON.parse(data) as { reason?: string }).reason ?? ""; } catch { /* empty body */ }
        resolve({ ok: false, gone: status === 410 || GONE.has(reason), status, reason: reason || `status ${status}` });
      });
      req.on("error", (e) => resolve({ ok: false, gone: false, status: 0, reason: e.message }));
      req.end(body);
    });
  }

  return { send, close: () => { (session as ClientHttp2Session | null)?.close(); session = null; } };
}
