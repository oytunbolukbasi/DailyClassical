#!/usr/bin/env python3
"""Which drafted pieces of a batch are complete (resume point after an interrupted run).

    python3 content/research/check-drafts.py [content/research/BATCH-2026-10b.md]

Reads the ids from the batch brief's table and, per id, checks the four files an agent writes:
content/drafts/{en,tr}/<id>.md (with a ```yaml block and at least one "Listening stops" /
"Dinleme durakları" table), content/research/<id>.md and content/research/<id>.shared.md
(with a paintings.yaml block starting `<id>:`). Already merged pieces (content/en/pieces/<id>.md)
count as done. Prints one line per id and, per group, which are missing, so the missing pieces
can be handed to a new agent with the same brief.
"""
import os
import re
import sys

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
C = os.path.join(ROOT, "content")


def read(p):
    try:
        with open(p, encoding="utf-8") as f:
            return f.read()
    except FileNotFoundError:
        return None


def status(pid):
    if os.path.exists(os.path.join(C, "en", "pieces", f"{pid}.md")):
        return "merged", []
    missing = []
    for lang, label in (("en", "Listening stops"), ("tr", "Dinleme durakları")):
        t = read(os.path.join(C, "drafts", lang, f"{pid}.md"))
        if t is None:
            missing.append(f"draft {lang}")
        elif "```yaml" not in t or label not in t:
            missing.append(f"draft {lang} incomplete")
    if read(os.path.join(C, "research", f"{pid}.md")) is None:
        missing.append("research note")
    shared = read(os.path.join(C, "research", f"{pid}.shared.md"))
    if shared is None:
        missing.append("shared note")
    elif not re.search(rf"```yaml\n\s*{re.escape(pid)}:", shared):
        missing.append("shared note: no paintings.yaml block")
    return ("ready" if not missing else "incomplete"), missing


def main(brief):
    rows = re.findall(r"^\| ([A-J]) \| `([a-z0-9-]+)` \|", read(brief) or "", re.M)
    if not rows:
        sys.exit(f"no ids found in {brief}")
    by_group = {}
    for group, pid in rows:
        st, missing = status(pid)
        by_group.setdefault(group, []).append((pid, st))
        print(f"{group}  {pid:40} {st}{'  (' + ', '.join(missing) + ')' if missing else ''}")
    print()
    for group, items in by_group.items():
        todo = [p for p, st in items if st == "incomplete"]
        print(f"group {group}: {'all ready/merged' if not todo else 'missing ' + ', '.join(todo)}")


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else os.path.join(C, "research", "BATCH-2026-10b.md"))
