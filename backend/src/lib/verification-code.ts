import { createHmac, randomInt, timingSafeEqual } from "node:crypto";
import { env } from "../env.js";

/** Must match "The code expires in 10 minutes" in the email. */
export const CODE_TTL_MS = 10 * 60 * 1000;
export const MAX_ATTEMPTS = 5;
/** Minimum gap between two codes for the same user ("Send again"). */
export const RESEND_COOLDOWN_MS = 30 * 1000;

export function generateCode(): string {
  return randomInt(0, 1_000_000).toString().padStart(6, "0");
}

/** Keyed hash: a leaked table alone can't be brute-forced over the 10⁶ code space. */
export function hashCode(code: string): string {
  return createHmac("sha256", env.JWT_SECRET).update(code).digest("hex");
}

export function codeMatches(code: string, storedHash: string): boolean {
  const a = Buffer.from(hashCode(code), "hex");
  const b = Buffer.from(storedHash, "hex");
  return a.length === b.length && timingSafeEqual(a, b);
}

export type CodeCheck = "ok" | "wrong" | "expired" | "too_many_attempts";

export function checkCode(code: string, row: { codeHash: string; expiresAt: Date; attempts: number }, now = new Date()): CodeCheck {
  if (row.attempts >= MAX_ATTEMPTS) return "too_many_attempts";
  if (row.expiresAt.getTime() <= now.getTime()) return "expired";
  return codeMatches(code, row.codeHash) ? "ok" : "wrong";
}
