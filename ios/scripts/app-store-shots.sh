#!/bin/zsh
# App Store screenshots (docs/APP_STORE.md §8): captures the six raw screens per language on a
# 6.9" simulator (1320×2868) into design/app-store/raw/<lang>/, using the Debug-only launch
# arguments in App/ScreenshotScene.swift. Then design/app-store/render.sh frames them.
#
#   ios/scripts/app-store-shots.sh <simulator-udid> [en tr]
#
# Build the Debug app for that simulator first. Slow on purpose: the app needs ~20 s to settle.
set -e
D=$1; shift
LANGS=(${@:-en tr})
ROOT=${0:A:h:h:h}
OUT=$ROOT/design/app-store/raw
APP=$(ls -d ~/Library/Developer/Xcode/DerivedData/DailyClassical-*/Build/Products/Debug-iphonesimulator/DailyClassical.app | head -1)

xcrun simctl install $D "$APP"
xcrun simctl status_bar $D override --time "9:41" --dataNetwork wifi --wifiMode active --wifiBars 3 \
  --cellularMode active --cellularBars 4 --batteryState discharging --batteryLevel 100
xcrun simctl ui $D appearance light

shot() {  # shot <lang> <name> <seconds> [launch args…]
  local lang=$1 name=$2 wait=$3; shift 3
  xcrun simctl launch --terminate-running-process $D co.dailyclassical.app \
    -hasCompletedOnboarding YES -appLanguage $lang -AppleLanguages "($lang)" "$@" >/dev/null
  sleep $wait
  mkdir -p $OUT/$lang
  xcrun simctl io $D screenshot $OUT/$lang/$name.png >/dev/null 2>&1
  echo "$lang/$name"
}

for lang in $LANGS; do
  # The stop under the reading line differs by language (Turkish text runs longer).
  [[ $lang == tr ]] && stops=2290 || stops=2400
  shot $lang 01-today     24
  shot $lang 02-piece     30 -shotPiece tchaikovsky-symphony-6 -shotScroll $stops
  shot $lang 03-glossary  30 -shotPiece tchaikovsky-symphony-6 -shotScroll 2750 -shotSheet glossary:recapitulation
  shot $lang 04-library   20 -shotTab library
  shot $lang 05-composer  24 -shotSheet composer:tchaikovsky
  shot $lang 06-wallpaper 34 -shotPiece rachmaninoff-piano-concerto-2 -shotArtwork YES -shotWallpaper YES
done
