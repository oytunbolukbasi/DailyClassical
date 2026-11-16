/**
 * RevenueCat webhook events (routes/revenuecat.ts) → the Premium state kept on `users`.
 *
 * Purchases live on the Apple ID and in RevenueCat; the app identifies a signed-in account to
 * RevenueCat with our user id (EntitlementStore.identify), so `app_user_id`, `original_app_user_id`,
 * `aliases` or `transferred_to` carry it. Purchases made signed out have only an anonymous
 * `$RCAnonymousID:…` and match no account: they stay visible in RevenueCat only.
 * https://www.revenuecat.com/docs/integrations/webhooks/event-types-and-fields
 */

export type Plan = "monthly" | "lifetime";
export type Status = "trial" | "active" | "cancelled" | "billing_issue" | "expired" | "refunded";

export type PremiumChange = {
  plan: Plan;
  status: Status;
  /** Null for lifetime. */
  expiresAt: Date | null;
};

export type RcEvent = {
  id: string;
  type: string;
  app_user_id?: string;
  original_app_user_id?: string;
  aliases?: string[];
  transferred_to?: string[];
  product_id?: string;
  new_product_id?: string;
  period_type?: string;
  expiration_at_ms?: number | null;
  event_timestamp_ms?: number;
  environment?: string;
  cancel_reason?: string;
};

const PRODUCTS: Record<string, Plan> = {
  "co.dailyclassical.premium.lifetime": "lifetime",
  "co.dailyclassical.premium.monthly": "monthly",
};

const UUID = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;

/** Our user ids mentioned by the event (deduplicated, lower-cased). */
export function userIdsOf(e: RcEvent): string[] {
  const ids = [e.app_user_id, e.original_app_user_id, ...(e.aliases ?? []), ...(e.transferred_to ?? [])]
    .filter((v): v is string => typeof v === "string" && UUID.test(v))
    .map((v) => v.toLowerCase());
  return [...new Set(ids)];
}

/** The new Premium state an event implies, or null when it doesn't change it (TEST, TRANSFER, …). */
export function changeOf(e: RcEvent): PremiumChange | null {
  const plan = PRODUCTS[e.new_product_id ?? e.product_id ?? ""];
  if (!plan) return null;
  const expiresAt = plan === "lifetime" || !e.expiration_at_ms ? null : new Date(e.expiration_at_ms);
  const trial = e.period_type === "TRIAL";
  switch (e.type) {
    case "INITIAL_PURCHASE":
    case "UNCANCELLATION":
      return { plan, status: trial ? "trial" : "active", expiresAt };
    case "RENEWAL":
    case "NON_RENEWING_PURCHASE":
    case "PRODUCT_CHANGE":
      return { plan, status: "active", expiresAt };
    case "CANCELLATION":
      // A refund through Apple arrives as a cancellation with reason CUSTOMER_SUPPORT.
      return { plan, status: e.cancel_reason === "CUSTOMER_SUPPORT" ? "refunded" : "cancelled", expiresAt };
    case "BILLING_ISSUE":
      return { plan, status: "billing_issue", expiresAt };
    case "EXPIRATION":
      return { plan, status: "expired", expiresAt };
    default:
      return null;
  }
}

/** Statuses that still unlock Premium (a cancelled or failing subscription runs to its end date). */
export const ACTIVE_STATUSES: Status[] = ["trial", "active", "cancelled", "billing_issue"];
