/**
 * Reads a copy of a winning install postback (routes/attribution.ts). SKAdNetwork sends plain JSON
 * with hyphenated keys; AdAttributionKit sends `{ "jws-string": "<header>.<payload>.<signature>" }`
 * whose payload carries the same fields. The signature is not checked here: the counts are for our
 * own reading, and the raw body is kept in case they ever need to be verified.
 */
export type Postback = {
  adNetworkId: string | null;
  sourceIdentifier: string | null;
  conversionType: string | null;
  fineValue: number | null;
  coarseValue: string | null;
  postbackIndex: number | null;
};

/** Ad networks we advertise with, by the identifier Apple registered for them. */
export const AD_NETWORKS: Record<string, string> = {
  "v9wttpbfk9.skadnetwork": "Meta",
  "n38lu8286q.skadnetwork": "Meta",
};

function jwsPayload(jws: string): Record<string, unknown> | null {
  const part = jws.split(".")[1];
  if (!part) return null;
  try {
    return JSON.parse(Buffer.from(part, "base64url").toString("utf8"));
  } catch {
    return null;
  }
}

const str = (v: unknown) => (v === undefined || v === null ? null : String(v).slice(0, 100));
const int = (v: unknown) => (typeof v === "number" && Number.isInteger(v) ? v : typeof v === "string" && /^\d+$/.test(v) ? Number(v) : null);

export function readPostback(framework: "skadnetwork" | "adattributionkit", body: unknown): Postback | null {
  if (!body || typeof body !== "object") return null;
  let fields = body as Record<string, unknown>;
  if (framework === "adattributionkit" && typeof fields["jws-string"] === "string") {
    const payload = jwsPayload(fields["jws-string"]);
    if (!payload) return null;
    fields = payload;
  }
  // Every real postback names its ad network; anything else (an empty probe, a stray POST) is not one.
  if (typeof fields["ad-network-id"] !== "string" || !fields["ad-network-id"]) return null;
  const redownload = fields["redownload"];
  return {
    adNetworkId: str(fields["ad-network-id"]),
    // SKAdNetwork 4 and AdAttributionKit: source-identifier; SKAdNetwork 3 and earlier: campaign-id.
    sourceIdentifier: str(fields["source-identifier"] ?? fields["campaign-id"]),
    conversionType: str(fields["conversion-type"]) ?? (redownload === undefined ? null : redownload ? "redownload" : "download"),
    fineValue: int(fields["conversion-value"]),
    coarseValue: str(fields["coarse-conversion-value"]),
    postbackIndex: int(fields["postback-sequence-index"]) ?? 0,
  };
}
