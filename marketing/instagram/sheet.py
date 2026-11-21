#!/usr/bin/env python3
"""Contact sheet of rendered slides: python3 sheet.py <out.png> <jpg>..."""
import subprocess, sys, pathlib
out, files = pathlib.Path(sys.argv[1]).resolve(), [pathlib.Path(f).resolve() for f in sys.argv[2:]]
cols = 3; w = 360; h = 450; rows = (len(files) + cols - 1) // cols
cells = "".join(f'<img src="file://{f}" style="width:{w}px;height:{h}px;display:block">' for f in files)
doc = out.with_suffix(".html")
doc.write_text(f'<body style="margin:0;background:#ccc;display:grid;grid-template-columns:repeat({cols},{w}px);gap:6px">{cells}</body>')
subprocess.run(["/Applications/Google Chrome.app/Contents/MacOS/Google Chrome", "--headless=new", "--hide-scrollbars",
                "--force-device-scale-factor=1", f"--window-size={cols*w+12},{rows*(h+6)}", f"--screenshot={out}", f"file://{doc}"],
               check=True, capture_output=True)
doc.unlink()
