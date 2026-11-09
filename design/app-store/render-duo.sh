#!/bin/zsh
# Renders frame-duo.html into out-duo/<outer|inner>/<lang>/NN.png for App Store Connect's iPhone Duo
# slot: outer 1398×2034 (closed, portrait), inner 2853×2007 (open, landscape).
# Raw screens: raw-duo/<outer|inner-landscape>/<lang>/*.png, captured on the iPhone Duo simulator
# (Device Hub › Closed / Open) with the scenes of ios/scripts/app-store-shots.sh.
cd ${0:A:h}
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
for display in ${=DISPLAYS:-outer inner}; do
  [[ $display == inner ]] && size=2853,2007 || size=1398,2034
  for lang in ${=LANGS:-en tr}; do
    mkdir -p out-duo/$display/$lang
    for n in ${=FRAMES:-1 2 3 4 5 6}; do
      "$CHROME" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 \
        --allow-file-access-from-files --window-size=$size --virtual-time-budget=3000 \
        --screenshot="$PWD/out-duo/$display/$lang/0$n.png" "file://$PWD/frame-duo.html?lang=$lang&n=$n&display=$display" 2>/dev/null
    done
  done
done
