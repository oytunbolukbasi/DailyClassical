import { createHash, randomBytes } from "node:crypto";

/** Must match the "It expires in 30 minutes" copy in the app and in the email. */
export const RESET_TOKEN_TTL_MS = 30 * 60 * 1000;

/** 32 random bytes, URL-safe. Only its hash is stored. */
export function generateResetToken(): string {
  return randomBytes(32).toString("base64url");
}

export function hashResetToken(token: string): string {
  return createHash("sha256").update(token).digest("hex");
}

export function resetTokenExpiry(now: Date = new Date()): Date {
  return new Date(now.getTime() + RESET_TOKEN_TTL_MS);
}

export function isResetTokenUsable(row: { expiresAt: Date; usedAt: Date | null }, now: Date = new Date()): boolean {
  return row.usedAt === null && row.expiresAt.getTime() > now.getTime();
}

/**
 * True when a session token (JWT `iat`, seconds) predates the last password change, i.e.
 * it must be rejected. Compared at second precision, because `iat` is truncated.
 */
export function issuedBeforePasswordChange(iatSeconds: number | undefined, passwordChangedAt: Date | null): boolean {
  if (!passwordChangedAt) return false;
  if (iatSeconds === undefined) return true;
  return iatSeconds < Math.floor(passwordChangedAt.getTime() / 1000);
}
