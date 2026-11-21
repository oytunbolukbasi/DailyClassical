#!/usr/bin/env python3
"""Render the v3 (dark, cinematic) Instagram carousels in posts_v3.py to 1080 x 1350 JPEGs.

usage: python3 build_v3.py <image dir> [post numbers...]
  <image dir> holds p-<piece id>.jpg (paintings, sips -Z 2400 copies of content/images/.originals/paintings),
  c-<composer id>.jpg (portraits) and s-<name>.png (design/app-store/raw/en screenshots).
  Output: ../out/v3/NN-<id>-<slide>.jpg + captions.md. Contact sheet: python3 ../sheet.py ../out/v3/_sheet.png ../out/v3/*.jpg
"""
import html, subprocess, sys, pathlib
from posts_v3 import POSTS

HERE = pathlib.Path(__file__).resolve().parent
FONTS = HERE.parents[2] / "ios/DailyClassical/Resources/Fonts"
CHROME = "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
OUT = HERE.parent / "out/v3"
BG = "#111010"

CSS = f"""
@font-face {{ font-family: Lit; src: url('file://{FONTS}/Literata-Regular.ttf'); font-weight: 400; }}
@font-face {{ font-family: Lit; src: url('file://{FONTS}/Literata-Medium.ttf'); font-weight: 500; }}
@font-face {{ font-family: Lit; src: url('file://{FONTS}/Literata-SemiBold.ttf'); font-weight: 600; }}
@font-face {{ font-family: Lit; src: url('file://{FONTS}/Literata-Italic.ttf'); font-weight: 400; font-style: italic; }}
@font-face {{ font-family: Lit; src: url('file://{FONTS}/Literata-MediumItalic.ttf'); font-weight: 500; font-style: italic; }}
* {{ margin: 0; padding: 0; box-sizing: border-box; }}
html, body {{ width: 1080px; height: 1350px; overflow: hidden; background: {BG}; }}
body {{ font-family: Lit, serif; color: #F0EBE3; -webkit-font-smoothing: antialiased; }}
.sans {{ font-family: -apple-system, 'SF Pro Text', 'Helvetica Neue', sans-serif; }}
.page {{ position: relative; width: 1080px; height: 1350px; overflow: hidden; background: {BG}; }}
.fill {{ position: absolute; inset: 0; }}
.pad {{ padding-left: 80px; padding-right: 80px; }}
.label {{ font-family: -apple-system, 'Helvetica Neue', sans-serif; font-size: 26px; font-weight: 600;
          letter-spacing: .2em; text-transform: uppercase; color: #D4AE84; }}
.title {{ font-weight: 500; line-height: 1.04; letter-spacing: -.02em; text-wrap: balance;
          text-shadow: 0 2px 24px rgba(0,0,0,.35); }}
.sub {{ font-size: 40px; line-height: 1.34; color: #E2DBD1; text-wrap: pretty; }}
.credit {{ font-family: -apple-system, 'Helvetica Neue', sans-serif; font-size: 22px; line-height: 1.45; color: #B3ABA1; }}
.top {{ position: absolute; left: 80px; right: 80px; top: 56px; display: flex; justify-content: space-between;
        align-items: baseline; z-index: 5; }}
.mark {{ font-size: 28px; font-weight: 500; color: #F0EBE3; opacity: .92; letter-spacing: -.005em; }}
.count {{ font-family: -apple-system, 'Helvetica Neue', sans-serif; font-size: 22px; font-weight: 600; letter-spacing: .16em; color: #D4AE84; }}
.rule {{ width: 72px; height: 3px; background: #D4AE84; }}
.phone {{ width: 580px; padding: 11px; border-radius: 92px; background: #050505; flex: none;
          box-shadow: 0 0 0 2px rgba(240,235,227,.14), 0 50px 120px rgba(0,0,0,.7), 0 0 160px rgba(212,174,132,.12); }}
.phone img {{ display: block; width: 100%; border-radius: 82px; }}
i {{ font-style: italic; }}
"""


def esc(s):
    # posts_v3.py strings may carry <i>…</i> and <br>; everything else is plain text.
    s = html.escape(s)
    for t in ("i", "/i", "br"):
        s = s.replace(f"&lt;{t}&gt;", f"<{t}>")
    return s


def url(imgdir, name):
    return f"url('file://{imgdir / name}')"


def top(n):
    return f'<div class="top"><div class="mark">DailyClassical</div><div class="count">{n} / 3</div></div>'


def blurred(imgdir, name, pos="50% 50%", dim=.42):
    # Oversized so the blur has no soft edges; then a dark wash.
    return f"""<div class="fill" style="inset:-80px; background:{url(imgdir, name)} {pos}/cover no-repeat;
      filter: blur(28px) brightness({dim}) saturate(1.15)"></div>
    <div class="fill" style="background: radial-gradient(120% 80% at 50% 30%, rgba(17,16,16,0) 0%, rgba(17,16,16,.55) 100%)"></div>"""


def hero(s, imgdir, n):
    credit = f'<div class="credit" style="margin-top:36px">{esc(s["credit"])}</div>' if s.get("credit") else ""
    return f"""<div class="page">
  <div class="fill" style="background:{url(imgdir, s['img'])} {s.get('pos', '50% 50%')}/cover no-repeat"></div>
  <div class="fill" style="background: linear-gradient(to bottom, rgba(17,16,16,.62) 0%, rgba(17,16,16,0) 16%,
       rgba(17,16,16,0) 34%, rgba(17,16,16,.78) 58%, rgba(17,16,16,.96) 78%, {BG} 100%)"></div>
  {top(n)}
  <div class="pad" style="position:absolute; left:0; right:0; bottom:{60 if credit else 84}px">
    <div class="label">{esc(s['label'])}</div>
    <div class="title" style="font-size:{s.get('size', 104)}px; margin-top:26px">{esc(s['title'])}</div>
    <div class="sub" style="margin-top:30px; max-width:900px">{esc(s['sub'])}</div>
    {credit}
  </div>
</div>"""


def phone(s, imgdir, n):
    head = f"""<div class="pad" style="flex:none; text-align:center">
      <div class="title" style="font-size:{s.get('size', 76)}px">{esc(s['title'])}</div>
      {f'<div class="sub" style="margin-top:22px">{esc(s["sub"])}</div>' if s.get('sub') else ''}
    </div>"""
    ph = f'<div class="phone"><img src="file://{imgdir / s["shot"]}"></div>'
    credit = f'<div class="credit" style="flex:none; text-align:center; margin-top:28px" >{esc(s["credit"])}</div>' if s.get("credit") else ""
    if s.get("anchor") == "bottom":
        # The screen's content sits at its foot: let the phone run off the top, headline below.
        body = f"""<div class="fill" style="display:flex; flex-direction:column; align-items:center; justify-content:flex-end; padding-bottom:64px">
      {ph}<div style="height:56px; flex:none"></div>{head}{credit}</div>
      <div class="fill" style="height:340px; background:linear-gradient(to bottom, #111010 0%, rgba(17,16,16,.92) 34%, rgba(17,16,16,0) 100%)"></div>"""
    else:
        # Credit sits under the headline: anything at the foot would land on the phone.
        cr = f'<div class="credit" style="margin:20px auto 0; max-width:820px; text-wrap:balance; color:#CFC7BC">{esc(s["credit"])}</div>' if s.get("credit") else ""
        body = f"""<div class="fill" style="display:flex; flex-direction:column; align-items:center; padding-top:168px">
      <div style="flex:none; text-align:center">{head}<div class="pad">{cr}</div></div><div style="height:60px; flex:none"></div>{ph}</div>"""
    return f"""<div class="page">{blurred(imgdir, s['bg'])}{body}{top(n)}</div>"""


def textpage(s, imgdir, n, inner, credit_pill=""):
    return f"""<div class="page">{blurred(imgdir, s['bg'], dim=.30)}{top(n)}
  <div class="pad fill" style="display:flex; flex-direction:column; padding-top:170px; padding-bottom:60px">
    {inner}
    <div style="margin-top:auto">{credit_pill}</div>
  </div>
</div>"""


def stops(s, imgdir, n):
    rows = "".join(f"""<div style="display:flex; gap:40px; padding:46px 0; border-top:2px solid rgba(240,235,227,.16)">
        <div class="sans" style="flex:none; width:200px; font-size:42px; font-weight:600; color:#D4AE84; letter-spacing:.01em; padding-top:6px">{t}</div>
        <div style="font-size:54px; line-height:1.2; text-wrap:pretty">{esc(x)}</div></div>""" for t, x in s["rows"])
    foot = f"""<div class="sans" style="display:inline-block; padding:16px 30px; border-radius:999px; border:2px solid #D4AE84;
        color:#F0EBE3; font-size:26px; font-weight:600; letter-spacing:.02em">{esc(s['pill'])}</div>
      <div class="credit" style="margin-top:30px">{esc(s['credit'])}</div>"""
    inner = f"""<div class="label">{esc(s['label'])}</div>
    <div class="title" style="font-size:88px; margin-top:22px; margin-bottom:40px">{esc(s['title'])}</div>{rows}"""
    return textpage(s, imgdir, n, inner, foot)


def facts(s, imgdir, n):
    rows = "".join(f"""<div style="display:flex; gap:36px; padding:46px 0; border-top:2px solid rgba(240,235,227,.16)">
        <div style="flex:none; width:60px; font-size:64px; line-height:1; font-style:italic; color:#D4AE84">{i}</div>
        <div style="font-size:48px; line-height:1.28; text-wrap:pretty">{esc(x)}</div></div>""" for i, x in enumerate(s["rows"], 1))
    inner = f"""<div class="label">{esc(s['label'])}</div>
    <div class="title" style="font-size:100px; margin-top:22px; margin-bottom:44px">{esc(s['title'])}</div>{rows}"""
    return textpage(s, imgdir, n, inner, f'<div class="credit">{esc(s["credit"])}</div>')


def stages(s, imgdir, n):
    rows = "".join(f"""<div style="padding:40px 0; border-top:2px solid rgba(240,235,227,.16)">
        <div style="display:flex; align-items:baseline; gap:28px">
          <div class="sans" style="flex:none; width:70px; font-size:30px; font-weight:600; letter-spacing:.12em; color:#D4AE84">{num}</div>
          <div class="title" style="font-size:78px">{esc(term)}</div></div>
        <div class="sub" style="margin:18px 0 0 98px">{esc(d)}</div></div>""" for num, term, d in s["rows"])
    inner = f'<div class="label" style="margin-bottom:30px">{esc(s["label"])}</div>{rows}'
    return textpage(s, imgdir, n, inner)


def story(s, imgdir, n):
    return f"""<div class="page">
  <div class="fill" style="bottom:auto; height:720px; background:{url(imgdir, s['img'])} 50% 55%/cover no-repeat"></div>
  <div class="fill" style="bottom:auto; height:720px; background:linear-gradient(to bottom, rgba(17,16,16,.6) 0%, rgba(17,16,16,0) 22%, rgba(17,16,16,0) 70%, {BG} 100%)"></div>
  {top(n)}
  <div class="pad fill" style="top:680px; display:flex; flex-direction:column; padding-bottom:60px">
    <div class="label">{esc(s['label'])}</div>
    <div class="title" style="font-size:72px; line-height:1.08; margin-top:22px">{esc(s['title'])}</div>
    <div class="sub" style="margin-top:30px; font-size:44px">{esc(s['body'])}</div>
    <div class="credit" style="margin-top:auto">{esc(s['credit'])}</div>
  </div>
</div>"""


def mosaic(s, imgdir, n):
    tiles = "".join(f'<div style="background:{url(imgdir, f"p-{t}.jpg")} 50% 50%/cover no-repeat"></div>' for t in s["tiles"])
    return f"""<div class="page">
  <div class="fill" style="display:grid; grid-template-columns:repeat(3,1fr); grid-template-rows:repeat(4,1fr); gap:6px; background:{BG}">{tiles}</div>
  <div class="fill" style="background: linear-gradient(to bottom, rgba(17,16,16,.7) 0%, rgba(17,16,16,.05) 14%,
       rgba(17,16,16,.1) 36%, rgba(17,16,16,.86) 60%, rgba(17,16,16,.97) 80%, {BG} 100%)"></div>
  {top(n)}
  <div class="pad" style="position:absolute; left:0; right:0; bottom:84px">
    <div class="rule"></div>
    <div class="title" style="font-size:{s.get('size', 112)}px; margin-top:34px">{esc(s['title'])}</div>
    <div class="sub" style="margin-top:30px">{esc(s['sub'])}</div>
  </div>
</div>"""


KINDS = dict(hero=hero, phone=phone, stops=stops, facts=facts, stages=stages, story=story, mosaic=mosaic)


def render(doc, out_jpg):
    tmp = out_jpg.with_suffix(".html")
    tmp.write_text(f"<!doctype html><meta charset=utf-8><style>{CSS}</style>{doc}")
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
    OUT.mkdir(parents=True, exist_ok=True)
    captions = []
    for n, p in enumerate(POSTS, 1):
        captions.append(f"## {n:02d} · {p['id']}\n\n{p['caption']}\n")
        if only and n not in only:
            continue
        for i, s in enumerate(p["slides"], 1):
            render(KINDS[s["kind"]](s, imgdir, i), OUT / f"{n:02d}-{p['id']}-{i}.jpg")
        print(n, p["id"], len(p["slides"]), "slides")
    (OUT / "captions.md").write_text("# Captions (v3)\n\n" + "\n".join(captions))


if __name__ == "__main__":
    main()
