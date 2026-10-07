/**
 * A small in-process cache for content queries. Content changes only when it is seeded (a deploy
 * or the content-publish workflow), so a short TTL keeps responses fast without serving anything
 * stale for long; clients and CDNs already cache for 5 minutes (routes/content.ts).
 * Concurrent misses for the same key share one query.
 */
const entries = new Map<string, { expires: number; value: Promise<unknown> }>();

export function memo<T>(key: string, ttlMs: number, load: () => Promise<T>): Promise<T> {
  const now = Date.now();
  const hit = entries.get(key);
  if (hit && hit.expires > now) return hit.value as Promise<T>;
  const value = load();
  entries.set(key, { expires: now + ttlMs, value });
  // A failed query is not cached.
  value.catch(() => { if (entries.get(key)?.value === value) entries.delete(key); });
  if (entries.size > 2000) {
    for (const [k, e] of entries) if (e.expires <= now) entries.delete(k);
  }
  return value;
}

/** Drops every entry (tests, or after seeding in-process). */
export function clearMemo() {
  entries.clear();
}
