#!/usr/bin/env python3
"""Merge drafted pieces of the October 2026 batch into the live content (docs/CONTENT_STATUS.md).

    python3 content/research/merge-drafts.py <id> [<id> …]

For each id, from content/research/<id>.shared.md:
  - the first ```yaml block of section "## 1." (or one starting `<id>:`) → content/paintings.yaml
  - new glossary rows (EN `| Term | Short | Definition |`, TR `| Key | Terim | Kısa | Tanım |`)
    → content/{en,tr}/glossary.md, alphabetically, skipping terms already there
  - composers.yaml entries (```yaml blocks starting `- id:`) → content/composers.yaml, skipping existing ids
  - retime rows (table rows starting `| <Composer> –`) → content/research/retime-needed.md
and moves content/drafts/{en,tr}/<id>.md → content/{en,tr}/pieces/<id>.md.

Choosing an alternative painting is a manual edit of the shared note before running this.
Afterwards (backend/): npm run content:build, npm run images -- --only <id>, npm run images:widget,
npm run fixtures.
"""
import os
import re
import sys

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
C = os.path.join(ROOT, "content")


def read(p):
    with open(p, encoding="utf-8") as f:
        return f.read()


def write(p, s):
    with open(p, "w", encoding="utf-8") as f:
        f.write(s)


def yaml_blocks(text):
    return re.findall(r"```yaml\n(.*?)```", text, re.S)


def painting_block(pid, shared):
    for b in yaml_blocks(shared):
        if re.match(rf"\s*{re.escape(pid)}:\s*\n", b):
            return b.strip("\n")
    return None


def composer_blocks(shared):
    return [b.strip("\n") for b in yaml_blocks(shared) if re.match(r"\s*- id:", b)]


def table_rows(text, header_start):
    """Rows of every markdown table whose header line starts with `header_start`."""
    rows, lines, i = [], text.split("\n"), 0
    while i < len(lines):
        if lines[i].startswith(header_start):
            i += 2  # header + separator
            while i < len(lines) and lines[i].startswith("|"):
                rows.append(lines[i])
                i += 1
        i += 1
    return rows


def key_of(row):
    return row.split("|")[1].strip()


def merge_glossary(path, header_start, new_rows):
    text = read(path)
    lines = text.split("\n")
    start = next(i for i, l in enumerate(lines) if l.startswith(header_start)) + 2
    end = start
    while end < len(lines) and lines[end].startswith("|"):
        end += 1
    rows = lines[start:end]
    have = {key_of(r).lower() for r in rows}
    added = []
    for r in new_rows:
        if key_of(r).lower() not in have:
            rows.append(r)
            have.add(key_of(r).lower())
            added.append(key_of(r))
    rows.sort(key=lambda r: key_of(r).lower())
    write(path, "\n".join(lines[:start] + rows + lines[end:]))
    return added


def main(ids):
    paintings_path = os.path.join(C, "paintings.yaml")
    composers_path = os.path.join(C, "composers.yaml")
    retime_path = os.path.join(C, "research", "retime-needed.md")
    for pid in ids:
        shared = read(os.path.join(C, "research", f"{pid}.shared.md"))
        report = [pid]

        paintings = read(paintings_path)
        if re.search(rf"^{re.escape(pid)}:\s*$", paintings, re.M):
            report.append("painting: already present")
        else:
            block = painting_block(pid, shared)
            if not block:
                sys.exit(f"{pid}: no paintings.yaml block in the shared note")
            write(paintings_path, paintings.rstrip("\n") + "\n\n" + block + "\n")
            report.append("painting: added")

        composers = read(composers_path)
        for b in composer_blocks(shared):
            cid = re.match(r"\s*- id:\s*(\S+)", b).group(1)
            if re.search(rf"^- id: {re.escape(cid)}\s*$", composers, re.M):
                report.append(f"composer {cid}: already present")
            else:
                composers = composers.rstrip("\n") + "\n\n" + b + "\n"
                report.append(f"composer {cid}: added")
        write(composers_path, composers)

        en = merge_glossary(os.path.join(C, "en", "glossary.md"), "| Term | Short | Definition |",
                            table_rows(shared, "| Term | Short | Definition |"))
        tr = merge_glossary(os.path.join(C, "tr", "glossary.md"), "| Key | Terim | Kısa | Tanım |",
                            table_rows(shared, "| Key | Terim | Kısa | Tanım |"))
        if en or tr:
            report.append(f"glossary +EN {en} +TR {tr}")

        retime = [r for r in table_rows(shared, "| Piece |") if "–" in r.split("|")[1]]
        if retime:
            text = read(retime_path)
            fresh = [r for r in retime if r not in text]
            if fresh:
                if "| Piece | Mvt |" not in text.split("## New pieces (October 2026)")[-1]:
                    text = text.rstrip("\n") + ("\n\n| Piece | Mvt | Old draft | Measured | Diff | Reference track |"
                                                " Current stops (unchanged) | Note |\n| --- | --- | --- | --- | --- | --- | --- | --- |")
                text = text.rstrip("\n") + "\n" + "\n".join(fresh) + "\n"
                write(retime_path, text)
                report.append(f"retime +{len(fresh)}")

        for lang in ("en", "tr"):
            src = os.path.join(C, "drafts", lang, f"{pid}.md")
            dst = os.path.join(C, lang, "pieces", f"{pid}.md")
            if os.path.exists(src):
                os.replace(src, dst)
        report.append("moved")
        print(" · ".join(report))


if __name__ == "__main__":
    main(sys.argv[1:])
