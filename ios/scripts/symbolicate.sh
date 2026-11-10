#!/bin/zsh
# Reads a MetricKit report downloaded from the admin page (Çökmeler ve donmalar › JSON):
#
#   ios/scripts/symbolicate.sh ~/Downloads/diagnostic-<id>.json
#
# Prints the crashed (or busiest) thread, innermost frame first, with this app's frames turned into
# function, file and line by atos against the dSYM of the same build. Looks for the archive in
# ios/build/DailyClassical-<version>-<build>.xcarchive, then in Xcode's Archives folder, matching the
# binary UUID in the report.
set -e
REPORT=${1:?usage: symbolicate.sh <diagnostic.json>}
ROOT=${0:A:h:h:h}
exec python3 -I - "$REPORT" "$ROOT" <<'EOF'
import glob, json, os, subprocess, sys

report, root = json.load(open(sys.argv[1])), sys.argv[2]
APP = {"DailyClassical", "DailyClassical.debug.dylib", "DailyClassicalWidget"}
print(f"{report['kind']} · {report['app_version']} ({report['build']}) · {report['os_version']} · {report['device']}")
for k, v in (report.get("details") or {}).items():
    print(f"  {k}: {v}")

def dwarf_files():
    archives = glob.glob(f"{root}/ios/build/*.xcarchive") + glob.glob(os.path.expanduser("~/Library/Developer/Xcode/Archives/*/*.xcarchive"))
    return [f for a in archives for f in glob.glob(f"{a}/dSYMs/*.dSYM/Contents/Resources/DWARF/*")]

def uuids(path):
    out = subprocess.run(["dwarfdump", "--uuid", path], capture_output=True, text=True).stdout
    return {line.split()[1].upper() for line in out.splitlines() if line.startswith("UUID:")}

index = {u: f for f in dwarf_files() for u in uuids(f)}

stacks = (report.get("call_stack") or {}).get("callStacks") or []
stack = next((s for s in stacks if s.get("threadAttributed")), stacks[0] if stacks else None)
pick = lambda frames: max(frames, key=lambda f: f.get("sampleCount", 0)) if frames else None
frame, n = pick(stack.get("callStackRootFrames") if stack else None), 0
if frame is None:
    print("No call stack in this report.")
while frame is not None and n < 200:
    name, offset = frame.get("binaryName", "?"), frame.get("offsetIntoBinaryTextSegment", 0)
    line = f"{n:3}  {name} + 0x{offset:x}"
    if name in APP:
        dwarf = index.get((frame.get("binaryUUID") or "").upper())
        if dwarf:
            load = 0x100000000
            sym = subprocess.run(["atos", "-arch", "arm64", "-o", dwarf, "-l", hex(load), hex(load + offset)],
                                 capture_output=True, text=True).stdout.strip()
            line += f"   {sym}"
        else:
            line += "   (no dSYM with this UUID: archive this build, or download its dSYM from App Store Connect)"
    print(line)
    frame, n = pick(frame.get("subFrames")), n + 1
EOF
