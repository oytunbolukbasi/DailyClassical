#!/bin/zsh
# Renders ad-hook.html (the "Wait for 4:30" alternative) into ads/hook/<feed|story>/<lang>.png.
cd ${0:A:h}
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
for format in feed story; do
  [[ $format == story ]] && size=1080,1920 || size=1080,1350
  mkdir -p ads/hook/$format
  for lang in tr en; do
    "$CHROME" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 \
      --allow-file-access-from-files --window-size=$size --virtual-time-budget=4000 \
      --screenshot="$PWD/ads/hook/$format/$lang.png" "file://$PWD/ad-hook.html?lang=$lang&format=$format" 2>/dev/null
  done
done
