#!/usr/bin/env python3
"""Merge ios/strings/*.json into DailyClassical/Resources/Localizable.xcstrings.

Each JSON file maps a key to {"en": "...", "tr": "...", "comment": "optional"}.
Format specifiers follow String Catalog rules (%@, %lld). Run after editing strings:
    python3 ios/scripts/build-strings.py
Every key must have both languages; the script fails otherwise so TR never lags EN.
"""
import json, pathlib, sys

root = pathlib.Path(__file__).resolve().parent.parent
merged, missing = {}, []
for f in sorted((root / "strings").glob("*.json")):
    for key, v in json.loads(f.read_text()).items():
        if key in merged:
            sys.exit(f"duplicate key {key} in {f.name}")
        for lang in ("en", "tr"):
            if not v.get(lang):
                missing.append(f"{f.name}: {key} [{lang}]")
        merged[key] = v
if missing:
    sys.exit("missing translations:\n  " + "\n  ".join(missing))

catalog = {"sourceLanguage": "en", "version": "1.0", "strings": {}}
for key in sorted(merged):
    v = merged[key]
    entry = {"extractionState": "manual", "localizations": {
        lang: {"stringUnit": {"state": "translated", "value": v[lang]}} for lang in ("en", "tr")}}
    if v.get("comment"):
        entry["comment"] = v["comment"]
    catalog["strings"][key] = entry
out = root / "DailyClassical/Resources/Localizable.xcstrings"
out.write_text(json.dumps(catalog, ensure_ascii=False, indent=2) + "\n")
print(f"✓ {len(merged)} keys → {out.relative_to(root)}")
