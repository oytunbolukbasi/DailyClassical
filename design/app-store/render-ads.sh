#!/bin/zsh
# Renders ad.html into ads/<feed|story>/<lang>/NN.png for Meta (Instagram feed 4:5 1080×1350, stories/reels 9:16 1080×1920).
cd ${0:A:h}
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
for format in ${=FORMATS:-feed story}; do
  [[ $format == story ]] && size=1080,1920 || size=1080,1350
  for lang in ${=LANGS:-tr en}; do
    mkdir -p ads/$format/$lang
    for n in ${=ADS:-1 2 3}; do
      "$CHROME" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 \
        --allow-file-access-from-files --window-size=$size --virtual-time-budget=3000 \
        --screenshot="$PWD/ads/$format/$lang/0$n.png" "file://$PWD/ad.html?lang=$lang&n=$n&format=$format" 2>/dev/null
    done
  done
done
