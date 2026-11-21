#!/usr/bin/env python3
"""Render the Instagram posts in posts.py to 1080 x 1350 JPEGs with headless Chrome.

usage: python3 build.py <image dir> [post numbers...]
  <image dir> holds p-<piece id>.jpg (paintings) and c-<composer id>.jpg (portraits),
  downscaled copies of content/images/.originals. Output: out/NN-<id>-<slide>.jpg + captions.md.
"""
import html, os, subprocess, sys, pathlib
from posts import POSTS, COMPOSERS

HERE = pathlib.Path(__file__).resolve().parent
FONTS = HERE.parents[1] / "ios/DailyClassical/Resources/Fonts"
CHROME = "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
OUT = HERE / "out"

BASE_CSS = f"""
@font-face {{ font-family: Lit; src: url('file://{FONTS}/Literata-Regular.ttf'); font-weight: 400; }}
@font-face {{ font-family: Lit; src: url('file://{FONTS}/Literata-Medium.ttf'); font-weight: 500; }}
@font-face {{ font-family: Lit; src: url('file://{FONTS}/Literata-SemiBold.ttf'); font-weight: 600; }}
@font-face {{ font-family: Lit; src: url('file://{FONTS}/Literata-Italic.ttf'); font-weight: 400; font-style: italic; }}
* {{ margin: 0; padding: 0; box-sizing: border-box; }}
html, body {{ width: 1080px; height: 1350px; overflow: hidden; }}
body {{ font-family: Lit, serif; -webkit-font-smoothing: antialiased; }}
.sans {{ font-family: -apple-system, 'SF Pro Text', 'Helvetica Neue', sans-serif; }}
.page {{ position: relative; width: 1080px; height: 1350px; display: flex; flex-direction: column; }}
.light {{ background: #F5F2EC; color: #1E1B17; }}
.dark {{ background: #111010; color: #F0EBE3; }}
.pad {{ padding-left: 80px; padding-right: 80px; }}
.label {{ font-size: 26px; letter-spacing: .14em; text-transform: uppercase; font-weight: 600; }}
.light .label {{ color: #6B4A2B; }} .dark .label {{ color: #D4AE84; }}
.row {{ display: flex; justify-content: space-between; align-items: baseline; gap: 32px; }}
.mark {{ font-size: 26px; white-space: nowrap; }}
.light .mark {{ color: #8A837B; }} .dark .mark {{ color: #7D766E; }}
.credit {{ font-size: 22px; line-height: 1.4; }}
.light .credit {{ color: #8A837B; }} .dark .credit {{ color: #8A837B; }}
.title {{ text-wrap: balance; font-size: 72px; line-height: 1.08; font-weight: 500; letter-spacing: -.015em; }}
.light .sub {{ color: #5E5852; }} .dark .sub {{ color: #B3ABA1; }}
i {{ font-style: italic; }}
"""


def esc(s):
    # posts.py strings may carry <i>…</i>; everything else is plain text.
    return html.escape(s).replace("&lt;i&gt;", "<i>").replace("&lt;/i&gt;", "</i>")


def img(path):
    return f"file://{path}"


def ratio(path):
    out = subprocess.run(["sips", "-g", "pixelWidth", "-g", "pixelHeight", str(path)], capture_output=True, text=True).stdout.split()
    return int(out[out.index("pixelWidth:") + 1]) / int(out[out.index("pixelHeight:") + 1])


def bottom_bar(left, theme_pad=56):
    return f"""<div class="pad row" style="position:absolute; left:0; right:0; bottom:{theme_pad}px">
    <div class="credit sans" style="max-width:720px">{left}</div><div class="mark">DailyClassical</div></div>"""


def cover(p, imgdir):
    path = imgdir / f'p-{p["id"]}.jpg'
    wide = ratio(path) >= 1.3  # wide paintings bleed edge to edge; tall ones get a mat
    box = "padding:0" if wide else "padding:72px 80px 0"
    return f"""<div class="page light">
  <div style="flex:0 1 auto; min-height:0; max-height:830px; display:flex; justify-content:center; align-items:flex-start; {box}">
    <img src="{img(path)}" style="max-width:100%; max-height:{'830px' if wide else '758px'}; display:block">
  </div>
  <div class="pad" style="flex:1; display:flex; flex-direction:column; justify-content:center; padding-top:48px; padding-bottom:56px">
    <div class="row"><div class="label sans">{esc(p['label'])}</div><div class="mark">DailyClassical</div></div>
    <div class="title" style="margin-top:22px">{esc(p['title'])}</div>
    <div class="sub" style="font-size:40px; line-height:1.3; font-style:italic; margin-top:22px">{esc(p['hook'])}</div>
  </div>
</div>"""


def composer_slide(p, imgdir, dark=False, text=None, credit=None):
    c = COMPOSERS[p["composer"]]
    text = p.get("about") if text is None else text
    credit = credit or f"Portrait: {esc(c['credit'])}"
    return f"""<div class="page {'dark' if dark else 'light'}">
  <div style="height:700px; flex:none; background:url('{img(imgdir / f'c-{p["composer"]}.jpg')}') {c['pos']}/cover no-repeat"></div>
  <div class="pad" style="padding-top:60px">
    <div class="title">{esc(c['name'])}</div>
    <div class="sans sub" style="font-size:28px; letter-spacing:.04em; margin-top:16px">{c['dates']} · {c['nat']}</div>
    <div class="sub" style="font-size:40px; line-height:1.36; margin-top:30px; text-wrap: pretty">{esc(text)}</div>
  </div>
  {bottom_bar(credit)}
</div>"""


def listen(p):
    rows = "".join(
        f"""<div style="padding:34px 0; border-top:2px solid rgba(30,27,23,.12)">
      <div class="sans" style="color:#6B4A2B; font-size:28px; font-weight:600; letter-spacing:.04em">{mv} &nbsp;≈ {t}</div>
      <div style="font-size:45px; line-height:1.27; margin-top:12px; text-wrap: pretty">{esc(txt)}</div>
    </div>"""
        for mv, t, txt in p["listen"]
    )
    return f"""<div class="page light pad" style="padding-top:80px">
  <div class="row"><div class="label sans">Listen for</div><div class="mark">DailyClassical</div></div>
  <div class="sub" style="font-size:40px; font-style:italic; margin-top:18px; line-height:1.2">{esc(p['title'])}</div>
  <div style="margin-top:40px">{rows}</div>
  {bottom_bar(f"Times from {esc(p['recording'])}.<br>Painting: {esc(p['painting'])}.")}
</div>"""


def focus(p, imgdir):
    x, y = p["crop"].split()
    big = 120 if len(p["big"]) < 12 else 64
    return f"""<div class="page dark">
  <div style="height:560px; flex:none; background:url('{img(imgdir / f'p-{p["id"]}.jpg')}') {x} {y}/190% auto no-repeat"></div>
  <div class="pad" style="padding-top:52px">
    <div class="row"><div class="label sans">{esc(p['label'])}</div><div class="mark">DailyClassical</div></div>
    <div class="title" style="font-size:{big}px; margin-top:22px">{esc(p['big'])}</div>
    <div class="sub" style="font-size:38px; line-height:1.38; margin-top:24px">{esc(p['body'])}</div>
  </div>
</div>"""


def focus_composer(p, imgdir):
    rec = next(q["recording"] for q in POSTS if q["kind"] == "piece" and q["id"] == p["id"])
    return composer_slide(p, imgdir, dark=True, text=f"Listen at {p['stop']}. Times from {rec}.",
                          credit=f"Portrait: {esc(COMPOSERS[p['composer']]['credit'])}<br>{esc(p['painting'])}.")


def render(html_doc, out_jpg):
    tmp = out_jpg.with_suffix(".html")
    tmp.write_text(f"<!doctype html><meta charset=utf-8><style>{BASE_CSS}</style>{html_doc}")
    png = out_jpg.with_suffix(".png")
    subprocess.run([CHROME, "--headless=new", "--disable-gpu", "--hide-scrollbars", "--allow-file-access-from-files",
                    "--force-device-scale-factor=1", "--window-size=1080,1350", "--virtual-time-budget=5000",
                    f"--screenshot={png}", f"file://{tmp}"], check=True, capture_output=True)
    subprocess.run(["sips", "-s", "format", "jpeg", "-s", "formatOptions", "92", str(png), "--out", str(out_jpg)],
                   check=True, capture_output=True)
    png.unlink(); tmp.unlink()


def main():
    imgdir = pathlib.Path(sys.argv[1]).resolve()
    only = {int(a) for a in sys.argv[2:]}
    OUT.mkdir(exist_ok=True)
    captions = []
    for n, p in enumerate(POSTS, 1):
        captions.append(f"## {n:02d} · {p['kind']} · {p['id']}\n\n{p['caption']}\n")
        if only and n not in only:
            continue
        if p["kind"] == "piece":
            slides = [cover(p, imgdir), composer_slide(p, imgdir), listen(p)]
        else:
            slides = [focus(p, imgdir), focus_composer(p, imgdir)]
        for s, doc in enumerate(slides, 1):
            render(doc, OUT / f"{n:02d}-{p['kind']}-{p['id']}-{s}.jpg")
        print(n, p["id"], len(slides), "slides")
    (OUT / "captions.md").write_text("# Captions\n\n" + "\n".join(captions))


if __name__ == "__main__":
    main()
