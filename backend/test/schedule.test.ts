import assert from "node:assert/strict";
import { test } from "node:test";
import { expandSchedule, publishDates } from "../src/content/schedule.js";

test("publish date is each piece's latest scheduled day up to today", () => {
  const days = expandSchedule({ start: "2026-10-01", days: 12, order: ["a", "b", "c", "d", "e"] });
  // a: 1 Oct, 6 Oct, 11 Oct · b: 2, 7, 12 · c: 3, 8 · d: 4, 9 · e: 5, 10
  const dates = publishDates(days, "2026-10-07");
  assert.deepEqual(Object.fromEntries(dates), {
    a: "2026-10-06", b: "2026-10-07", c: "2026-10-03", d: "2026-10-04", e: "2026-10-05",
  });
});

test("pieces scheduled only after today are unpublished", () => {
  const days = expandSchedule({ start: "2026-10-01", days: 5, order: ["a", "b", "c", "d", "e"] });
  assert.deepEqual([...publishDates(days, "2026-10-02").keys()].sort(), ["a", "b"]);
  assert.equal(publishDates(days, "2026-09-30").size, 0);
});
