import assert from "node:assert/strict";
import { test } from "node:test";
import { signatureOf } from "../src/lib/diagnostic-signature.js";

const frame = (binaryName: string, offset: number, subFrames: object[] = [], sampleCount = 1) =>
  ({ binaryName, offsetIntoBinaryTextSegment: offset, sampleCount, subFrames });

test("a crash is signed by its signal and the first frame in the app", () => {
  const tree = { callStackPerThread: true, callStacks: [
    { threadAttributed: false, callStackRootFrames: [frame("libsystem_kernel.dylib", 1)] },
    { threadAttributed: true, callStackRootFrames: [frame("libswiftCore.dylib", 16, [frame("DailyClassical", 0x1e240, [frame("UIKitCore", 2)])])] },
  ] };
  assert.equal(signatureOf("crash", { signal: "11" }, tree), "crash SIGSEGV · DailyClassical+0x1e240");
});

test("without an app frame the top frame is used; CPU stacks follow the busiest branch", () => {
  const tree = { callStackPerThread: false, callStacks: [{ callStackRootFrames: [
    frame("Foundation", 0x10, [], 3),
    frame("SwiftUICore", 0x20, [frame("AttributeGraph", 0x30, [], 9)], 9),
  ] }] };
  assert.equal(signatureOf("cpu", {}, tree), "cpu · SwiftUICore+0x20");
  assert.equal(signatureOf("hang", {}, undefined), "hang · no stack");
});
