import assert from "node:assert/strict";
import { test } from "node:test";

test("addDays crosses month and year ends in UTC", async () => {
  process.env.DATABASE_URL ??= "postgres://u:p@localhost:5432/x";
  process.env.JWT_SECRET ??= "x".repeat(32);
  const { addDays } = await import("../src/content/repository.js");
  assert.equal(addDays("2026-10-07", 0), "2026-10-07");
  assert.equal(addDays("2026-10-31", 1), "2026-11-01");
  assert.equal(addDays("2026-12-30", 3), "2027-01-02");
});
