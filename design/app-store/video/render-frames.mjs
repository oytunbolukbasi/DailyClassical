// Renders reel.html frame by frame through Chrome's DevTools protocol (no npm packages):
//   node render-frames.mjs <lang> <story|feed> <out dir> [seconds=15] [fps=30]
import { spawn } from "node:child_process";
import { mkdirSync, readdirSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const [lang, format, out, seconds = "15", fps = "30"] = process.argv.slice(2);
const here = dirname(fileURLToPath(import.meta.url));
const [W, H] = format === "story" ? [1080, 1920] : [1080, 1350];
const thumbs = readdirSync(join(here, "thumbs")).filter((f) => f.endsWith(".jpg")).sort();
const rec = readdirSync(join(here, `rec-${lang}`)).filter((f) => f.endsWith(".jpg")).length;
mkdirSync(out, { recursive: true });

const port = 9300 + Math.floor(Math.random() * 500);
const chrome = spawn("/Applications/Google Chrome.app/Contents/MacOS/Google Chrome", [
  "--headless=new", `--remote-debugging-port=${port}`, "--disable-gpu", "--hide-scrollbars", "--allow-file-access-from-files",
  "--force-device-scale-factor=1", `--window-size=${W},${H}`, `--user-data-dir=/tmp/reel-chrome-${port}`, "about:blank",
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

await send("Emulation.setDeviceMetricsOverride", { width: W, height: H, deviceScaleFactor: 1, mobile: false });
const url = `file://${join(here, "reel.html")}?lang=${lang}&format=${format}&rec=${rec}&thumbs=${thumbs.join(",")}`;
await send("Page.enable");
await send("Page.navigate", { url });
await sleep(2500);
const total = Math.round(Number(seconds) * Number(fps));
for (let f = 0; f < total; f++) {
  const t = f / Number(fps);
  // Set the frame, then wait until every image (the recording frame changes each step) has decoded.
  await send("Runtime.evaluate", { awaitPromise: true, expression:
    `render(${t}); Promise.all([...document.images].map(i => i.complete ? 0 : new Promise(r => { i.onload = i.onerror = r })))` });
  const shot = await send("Page.captureScreenshot", { format: "png", clip: { x: 0, y: 0, width: W, height: H, scale: 1 } });
  writeFileSync(join(out, `${String(f).padStart(4, "0")}.png`), Buffer.from(shot.result.data, "base64"));
}
ws.close(); chrome.kill();
console.log("rendered", total, "frames");
