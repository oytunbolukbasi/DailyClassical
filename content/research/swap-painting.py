#!/usr/bin/env python3
"""Replace a drafted piece's first-choice painting before merging (docs/CONTENT_STATUS.md).

    python3 content/research/swap-painting.py spec.json

spec.json: a list of objects, one per piece:
  {"id": "...", "reason": "...",
   "yaml": {"image_url", "source_url", "commons_page", "width", "height", "medium", "license",
            "credit_line", "rights_status"},
   "en": {"artist", "title", "year", "collection", "pairing_note"},
   "tr": {"artist", "title", "year", "collection", "pairing_note"}}

Rewrites the paintings.yaml block in content/research/<id>.shared.md and the `painting:` block of
content/drafts/{en,tr}/<id>.md (or content/{en,tr}/pieces/<id>.md if already merged).
"""
import json
import os
import re
import sys

C = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))


def q(v):
    s = str(v)
    return f'"{s}"' if re.search(r"[:#]\s|^[\[{*&!|>'\"%@`]", s) else s


def piece_path(lang, pid):
    d = os.path.join(C, "drafts", lang, f"{pid}.md")
    return d if os.path.exists(d) else os.path.join(C, lang, "pieces", f"{pid}.md")


for spec in json.load(open(sys.argv[1], encoding="utf-8")):
    pid, y = spec["id"], spec["yaml"]
    block = (f"```yaml\n{pid}:\n  # Switched at merge: {spec['reason']}\n"
             + "".join(f"  {k}: {q(y[k])}\n" for k in ("image_url", "source_url", "commons_page", "width", "height",
                                                        "medium", "license", "credit_line", "rights_status"))
             + "```")
    sp = os.path.join(C, "research", f"{pid}.shared.md")
    s = open(sp, encoding="utf-8").read()
    m = next(m for m in re.finditer(r"```yaml\n(.*?)```", s, re.S) if m.group(1).lstrip().startswith(pid + ":"))
    open(sp, "w", encoding="utf-8").write(s[:m.start()] + block + s[m.end():])
    for lang in ("en", "tr"):
        p = piece_path(lang, pid)
        t = open(p, encoding="utf-8").read()
        a = t.index("painting:\n")
        e = t.index("```", a)
        v = spec[lang]
        t = t[:a] + "painting:\n" + "".join(f"  {k}: {q(v[k])}\n" for k in ("artist", "title", "year", "collection", "pairing_note")) + t[e:]
        open(p, "w", encoding="utf-8").write(t)
    print(f"{pid}: painting → {spec['en']['artist']}, {spec['en']['title']}")
