// Renders an HTML page that exposes render(t) and window.DURATION, frame by frame, through Chrome's DevTools
// protocol (no npm packages). Adapted from design/app-store/video/render-frames.mjs.
//   node render-frames.mjs <page.html?query> <width> <height> <out dir> [fps=30]
import { spawn } from "node:child_process";
import { mkdirSync, writeFileSync } from "node:fs";
import { resolve } from "node:path";

const [page, W, H, out, fps = "30"] = process.argv.slice(2);
const [file, query = ""] = page.split("?");
mkdirSync(out, { recursive: true });
const port = 9300 + Math.floor(Math.random() * 500);
const chrome = spawn("/Applications/Google Chrome.app/Contents/MacOS/Google Chrome", [
  "--headless=new", `--remote-debugging-port=${port}`, "--disable-gpu", "--hide-scrollbars", "--allow-file-access-from-files",
  "--force-device-scale-factor=1", `--window-size=${W},${H}`, `--user-data-dir=/tmp/dc-frames-${port}`, "about:blank",
], { stdio: "ignore" });
const sleep = (ms) => new Promise((r) => setTimeout(r, ms));
let target;
for (let i = 0; i < 50 && !target; i++) {
  await sleep(200);
  try { target = (await (await fetch(`http://127.0.0.1:${port}/json`)).json()).find((t) => t.type === "page"); } catch {}
}
const ws = new WebSocket(target.webSocketDebuggerUrl);
await new Promise((r) => ws.addEventListener("open", r, { once: true }));
let id = 0; const pending = new Map();
ws.addEventListener("message", (e) => { const m = JSON.parse(e.data); if (m.id && pending.has(m.id)) { pending.get(m.id)(m); pending.delete(m.id); } });
const send = (method, params = {}) => new Promise((r) => { const i = ++id; pending.set(i, r); ws.send(JSON.stringify({ id: i, method, params })); });
await send("Emulation.setDeviceMetricsOverride", { width: +W, height: +H, deviceScaleFactor: 1, mobile: false });
await send("Page.enable");
await send("Page.navigate", { url: `file://${resolve(file)}?${query}` });
await sleep(2500);
const dur = (await send("Runtime.evaluate", { expression: "window.DURATION", returnByValue: true })).result.result.value;
const total = Math.round(dur * Number(fps));
for (let f = 0; f < total; f++) {
  await send("Runtime.evaluate", { awaitPromise: true, expression: `render(${f / Number(fps)}); document.fonts.ready` });
  const shot = await send("Page.captureScreenshot", { format: "png", clip: { x: 0, y: 0, width: +W, height: +H, scale: 1 } });
  writeFileSync(`${out}/${String(f).padStart(4, "0")}.png`, Buffer.from(shot.result.data, "base64"));
}
ws.close(); chrome.kill();
console.log("rendered", total, "frames");
