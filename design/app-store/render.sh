#!/bin/zsh
# Renders frame.html into out/<lang>/NN.png at 1320×2868 (App Store 6.9").
# Raw screens come from ios/scripts/app-store-shots.sh (raw/<lang>/*.png).
cd ${0:A:h}
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
for lang in ${=LANGS:-en tr}; do
  mkdir -p out/$lang
  for n in ${=FRAMES:-1 2 3 4 5 6}; do
    "$CHROME" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 \
      --allow-file-access-from-files --window-size=1320,2868 --virtual-time-budget=3000 \
      --screenshot="$PWD/out/$lang/0$n.png" "file://$PWD/frame.html?lang=$lang&n=$n" 2>/dev/null
  done
done
