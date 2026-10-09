// dailyclassical.co · behaviour from Claude Design "DailyClassical Landing.dc.html" (LANDING-HANDOFF.md).
// Hero: every 3.2 s the date chip advances a day and the featured painting crossfades.
// Phone story: sticky phone, three steps; in step 2 the "current" listening stop follows the scroll.
// Everything holds still under prefers-reduced-motion.

const reduced = matchMedia("(prefers-reduced-motion: reduce)");
const html = document.documentElement;
const lang = () => (html.lang === "tr" ? "tr" : "en");

// Public-domain paintings (Wikimedia Commons). Credit line: artist, title, year, museum.
const PAINTINGS = {
  vernet: { artist: "Claude-Joseph Vernet", year: "1773", en: ["A Shipwreck in Stormy Seas", "National Gallery, London"], tr: ["Fırtınalı Denizde Bir Gemi Kazası", "Ulusal Galeri, Londra"] },
  levitan: { artist: "Isaac Levitan", year: "1894", en: ["Above the Eternal Peace", "State Tretyakov Gallery, Moscow"], tr: ["Ebedî Huzurun Üzerinde", "Devlet Tretyakov Galerisi, Moskova"] },
  monk: { artist: "Caspar David Friedrich", year: "1808–10", en: ["The Monk by the Sea", "Alte Nationalgalerie, Berlin"], tr: ["Deniz Kıyısındaki Keşiş", "Alte Nationalgalerie, Berlin"] },
  wanderer: { artist: "Caspar David Friedrich", year: { en: "c. 1818", tr: "y. 1818" }, en: ["Wanderer above the Sea of Fog", "Hamburger Kunsthalle"], tr: ["Sis Denizi Üzerindeki Gezgin", "Hamburger Kunsthalle"] },
  bierstadt: { artist: "Albert Bierstadt", year: "1868", en: ["Among the Sierra Nevada, California", "Smithsonian American Art Museum, Washington"], tr: ["Sierra Nevada Dağlarında, Kaliforniya", "Smithsonian Amerikan Sanatı Müzesi, Washington"] },
  klimt: { artist: "Gustav Klimt", year: "1902", en: ["Beech Grove I", "Galerie Neue Meister, Dresden"], tr: ["Kayın Korusu I", "Galerie Neue Meister, Dresden"] },
  turner: { artist: "J. M. W. Turner", year: "1839", en: ["The Fighting Temeraire", "National Gallery, London"], tr: ["Savaşan Temeraire", "Ulusal Galeri, Londra"] },
  millet: { artist: "Jean-François Millet", year: "1857–59", en: ["The Angelus", "Musée d’Orsay, Paris"], tr: ["Angelus", "Musée d’Orsay, Paris"] },
  watteau: { artist: "Antoine Watteau", year: "1717", en: ["The Embarkation for Cythera", "Musée du Louvre, Paris"], tr: ["Kythira’ya Yolculuk", "Louvre Müzesi, Paris"] },
  fuseli: { artist: "Henry Fuseli", year: "1781", en: ["The Nightmare", "Detroit Institute of Arts"], tr: ["Kâbus", "Detroit Sanat Enstitüsü"] },
};
const year = (p, l) => (typeof p.year === "string" ? p.year : p.year[l]);
const altText = (key, l = lang()) => { const p = PAINTINGS[key]; return `${p.artist}, ${p[l][0]}, ${year(p, l)}`; };

function creditNode(key, l) {
  const p = PAINTINGS[key];
  const frag = document.createDocumentFragment();
  const em = document.createElement("em");
  em.textContent = p[l][0];
  frag.append(`${p.artist}, `, em, `, ${year(p, l)}. ${p[l][1]}.`);
  return frag;
}

// ── Date chip ─────────────────────────────────────────
const today = new Date();
function setChip(chip, offset) {
  const d = new Date(today);
  d.setDate(d.getDate() + offset);
  const locale = lang() === "tr" ? "tr-TR" : "en-US";
  chip.querySelector(".n").textContent = d.getDate();
  chip.querySelector(".w").textContent = d.toLocaleDateString(locale, { weekday: "long" });
  chip.querySelector(".m").textContent = d.toLocaleDateString(locale, { month: "long", year: "numeric" });
}

// ── Hero cycle ────────────────────────────────────────
const featured = [...document.querySelectorAll(".featured picture")];
const heroChip = document.querySelector(".hero-chip");
const heroCredit = document.querySelector(".hero-credit .credit");
let heroIndex = 0;
function showHero(i) {
  heroIndex = i;
  featured.forEach((p, k) => p.classList.toggle("is-on", k === i));
  setChip(heroChip, i);
  heroCredit.dataset.credit = featured[i].dataset.key;
  heroCredit.replaceChildren(creditNode(heroCredit.dataset.credit, lang()));
}
let heroTimer;
function startHero() {
  clearInterval(heroTimer);
  if (reduced.matches) return showHero(0);
  heroTimer = setInterval(() => showHero((heroIndex + 1) % featured.length), 3200);
}

// ── Paintings band (doubled so the drift loops) ───────
const BAND = [["vernet", 280, 190], ["levitan", 300, 230], ["wanderer", 170, 200], ["monk", 320, 240], ["bierstadt", 260, 180],
  ["klimt", 210, 210], ["millet", 250, 220], ["turner", 260, 190], ["watteau", 320, 230], ["fuseli", 250, 200]];
const track = document.querySelector(".band-track");
function buildBand() {
  const mobile = matchMedia("(max-width: 899px)").matches;
  const k = mobile ? .55 : 1;
  track.replaceChildren();
  for (const copy of [0, 1]) {
    for (const [key, w, h] of BAND) {
      const fig = document.createElement("figure");
      fig.className = "band-item";
      fig.style.width = `${w * k}px`;
      fig.style.height = `${h * k}px`;
      if (copy) fig.setAttribute("aria-hidden", "true");
      else fig.tabIndex = 0;
      fig.innerHTML = `<picture><source srcset="/assets/img/${key}-640.webp" type="image/webp"><img src="/assets/img/${key}-640.jpg" loading="lazy" decoding="async" data-alt="${key}" alt=""></picture><figcaption><b></b><span></span></figcaption>`;
      fig.dataset.key = key;
      track.append(fig);
    }
  }
}
function captionBand(l) {
  for (const fig of track.children) {
    const p = PAINTINGS[fig.dataset.key];
    fig.querySelector("b").textContent = p.artist;
    const em = document.createElement("em");
    em.textContent = p[l][0];
    fig.querySelector("figcaption span").replaceChildren(em, `, ${year(p, l)}`);
  }
}

// ── Phone story ───────────────────────────────────────
const story = document.querySelector(".story");
const steps = [...document.querySelectorAll(".steps .step")];
const deskPhone = document.querySelector(".story-sticky > .phone-wrap");
const screens = [...deskPhone.querySelectorAll(".screen")];
const dots = [...document.querySelectorAll(".indicator i")];

// Mobile: each step stacked, text first, then a phone showing that step's screen.
const mSteps = document.createElement("div");
mSteps.className = "m-steps";
steps.forEach((step, i) => {
  const block = document.createElement("div");
  block.className = "m-step";
  block.dataset.step = i;
  block.append(...[...step.children].map((n) => n.cloneNode(true)));
  const wrap = deskPhone.cloneNode(true);
  wrap.querySelectorAll(".screen").forEach((s, k) => (k === i ? s.classList.add("is-on") : s.remove()));
  block.append(wrap);
  mSteps.append(block);
});
story.append(mSteps);

// Reading focus: through step 2 the "current" stop walks down the list (0 → 3) and the page scrolls
// so that stop sits on the phone's reading line; earlier stops are passed, later ones upcoming.
function focusStops(screen, t) {
  const scroller = screen.querySelector(".stops-scroll");
  const stops = [...scroller.querySelectorAll(".stop")];
  const line = 470;  // in phone points: the middle of the area under the nav
  const target = stops.map((s) => line - (s.offsetTop + s.offsetHeight / 2));
  let y, current;
  if (reduced.matches) {
    y = -270; current = 2;
  } else {
    const f = t * (stops.length - 1), i = Math.floor(f), k = Math.min(stops.length - 1, i + 1);
    y = target[i] + (target[k] - target[i]) * (f - i);
    current = Math.round(f);
  }
  scroller.style.setProperty("--sy", `${Math.min(0, y)}px`);
  stops.forEach((s, k) => { s.classList.toggle("current", k === current); s.classList.toggle("passed", k < current); });
}

const clamp = (v) => Math.min(1, Math.max(0, v));
function onScroll() {
  const vh = innerHeight;
  if (getComputedStyle(mSteps).display === "none") {
    const r = story.getBoundingClientRect();
    const p = clamp(-r.top / (r.height - vh));
    const step = Math.min(2, Math.floor(p * 3));
    steps.forEach((s, k) => s.classList.toggle("is-on", k === step));
    screens.forEach((s, k) => s.classList.toggle("is-on", k === step));
    dots.forEach((d, k) => d.classList.toggle("is-on", k === step));
    focusStops(screens[1], clamp(p * 3 - 1));
  } else {
    const block = mSteps.children[1];
    const r = block.querySelector(".phone-wrap").getBoundingClientRect();
    focusStops(block.querySelector(".s-stops"), clamp((vh * .75 - r.top) / (r.height + vh * .25)));
  }
}

// ── Sticky capsule: after the hero, until the closing ──
const capsule = document.getElementById("capsule");
const seen = { hero: true, closing: false };
const io = new IntersectionObserver((entries) => {
  for (const e of entries) seen[e.target.id] = e.isIntersecting;
  const on = !seen.hero && !seen.closing;
  capsule.classList.toggle("is-on", on);
  capsule.setAttribute("aria-hidden", String(!on));
  capsule.querySelector("a").tabIndex = on ? 0 : -1;
}, { threshold: 0 });
io.observe(document.getElementById("hero"));
io.observe(document.getElementById("closing"));

// Mobile glossary step: the sheet rises when its phone comes into view.
const sheetIO = new IntersectionObserver((entries) => {
  for (const e of entries) e.target.classList.toggle("in-view", e.isIntersecting);
}, { threshold: .5 });
sheetIO.observe(mSteps.children[2]);

// ── Language ──────────────────────────────────────────
const COPY = {
  en: { title: "DailyClassical · One classical work a day", description: "A symphony, a concerto or a sonata, chosen for today, with a listening guide and a painting from the same world. For iPhone." },
  tr: { title: "DailyClassical · Her gün bir klasik eser", description: "Bugün için seçilmiş bir senfoni, konçerto ya da sonat; bir dinleme rehberi ve aynı dünyadan bir tabloyla. iPhone için." },
};
function applyLang(l) {
  html.lang = l;
  document.title = COPY[l].title;
  document.querySelector('meta[name="description"]').content = COPY[l].description;
  document.querySelectorAll("img[data-alt]").forEach((img) => (img.alt = altText(img.dataset.alt, l)));
  document.querySelectorAll(".credit[data-credit]").forEach((c) => c.replaceChildren(creditNode(c.dataset.credit, l)));
  document.querySelectorAll(".lang-link").forEach((a) => (a.href = `${a.dataset.page}?locale=${l}`));
  document.querySelectorAll(".lang button").forEach((b) => b.setAttribute("aria-pressed", String(b.dataset.setLang === l)));
  document.querySelectorAll(".t-chip").forEach((c) => setChip(c, 0));
  setChip(heroChip, heroIndex);
  captionBand(l);
}
document.addEventListener("click", (e) => {
  const b = e.target.closest("[data-set-lang]");
  if (!b) return;
  try { localStorage.setItem("lang", b.dataset.setLang); } catch {}
  applyLang(b.dataset.setLang);
});

// ── Hero scale: the 1440 board, scaled down on narrower desktop windows ──
function scaleHero() { html.style.setProperty("--hs", String(Math.min(1, innerWidth / 1440))); }

// ── Start ─────────────────────────────────────────────
scaleHero();
buildBand();
applyLang(lang());
showHero(0);
startHero();
onScroll();
addEventListener("scroll", onScroll, { passive: true });
addEventListener("resize", () => { scaleHero(); onScroll(); });
matchMedia("(max-width: 899px)").addEventListener("change", () => { buildBand(); captionBand(lang()); });
reduced.addEventListener("change", () => { startHero(); onScroll(); });
