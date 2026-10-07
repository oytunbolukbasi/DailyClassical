import assert from "node:assert/strict";
import { test } from "node:test";
import { clearMemo, memo } from "../src/lib/memo.js";

test("memo shares one load per key until it expires, and never caches failures", async () => {
  clearMemo();
  let calls = 0;
  const load = async () => ++calls;
  assert.equal(await memo("a", 1000, load), 1);
  assert.equal(await memo("a", 1000, load), 1);
  assert.equal(calls, 1);
  assert.equal(await memo("b", -1, load), 2);  // already expired: the next call loads again
  assert.equal(await memo("b", 1000, load), 3);
  await assert.rejects(memo("c", 1000, async () => { throw new Error("db down"); }));
  assert.equal(await memo("c", 1000, async () => "ok"), "ok");
});
