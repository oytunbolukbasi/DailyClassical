import { randomBytes, scrypt as scryptCb, timingSafeEqual } from "node:crypto";
import { promisify } from "node:util";
import type { MiddlewareHandler } from "hono";
import { HTTPException } from "hono/http-exception";
import { jwtVerify, SignJWT } from "jose";
import { eq } from "drizzle-orm";
import { db } from "../db/client.js";
import { users } from "../db/schema.js";
import { env } from "../env.js";
import { issuedBeforePasswordChange } from "./reset-token.js";

const scrypt = promisify(scryptCb) as (pw: string, salt: Buffer, len: number) => Promise<Buffer>;
const secret = new TextEncoder().encode(env.JWT_SECRET);

export async function hashPassword(password: string): Promise<string> {
  const salt = randomBytes(16);
  const key = await scrypt(password, salt, 64);
  return `scrypt$${salt.toString("base64")}$${key.toString("base64")}`;
}

export async function verifyPassword(password: string, stored: string | null): Promise<boolean> {
  if (!stored) return false;  // Sign in with Apple account without a password
  const [algo, saltB64, keyB64] = stored.split("$");
  if (algo !== "scrypt" || !saltB64 || !keyB64) return false;
  const expected = Buffer.from(keyB64, "base64");
  const actual = await scrypt(password, Buffer.from(saltB64, "base64"), expected.length);
  return timingSafeEqual(actual, expected);
}

export function issueToken(userId: string): Promise<string> {
  return new SignJWT({}).setProtectedHeader({ alg: "HS256" }).setSubject(userId).setIssuedAt().setExpirationTime("180d").sign(secret);
}

export type AuthVars = { Variables: { userId: string } };

export const requireUser: MiddlewareHandler<AuthVars> = async (c, next) => {
  const token = c.req.header("authorization")?.replace(/^Bearer\s+/i, "");
  if (!token) throw new HTTPException(401, { message: "unauthorized" });
  let userId: string;
  let issuedAt: number | undefined;
  try {
    const { payload } = await jwtVerify(token, secret);
    userId = payload.sub!;
    issuedAt = payload.iat;
  } catch {
    throw new HTTPException(401, { message: "unauthorized" });
  }
  // A password reset signs out every session issued before it; a deleted account has no row.
  const [user] = await db.select({ passwordChangedAt: users.passwordChangedAt }).from(users).where(eq(users.id, userId));
  if (!user || issuedBeforePasswordChange(issuedAt, user.passwordChangedAt)) {
    throw new HTTPException(401, { message: "unauthorized" });
  }
  c.set("userId", userId);
  await next();
};
