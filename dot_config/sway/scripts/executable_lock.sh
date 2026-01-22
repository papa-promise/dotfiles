#!/usr/bin/env bash
set -euo pipefail

OUTDIR="${XDG_RUNTIME_DIR:-/tmp}/swaylock"
mkdir -p "$OUTDIR"

RAW="$OUTDIR/raw.png"
BLUR="$OUTDIR/blur.png"

cleanup() { rm -f "$RAW" "$BLUR" 2>/dev/null || true; }
trap cleanup EXIT INT TERM

grim "$RAW"

if command -v magick >/dev/null 2>&1; then
  magick "$RAW" -scale 25% -blur 0x8 -resize 400% "$BLUR"
elif command -v convert >/dev/null 2>&1; then
  convert "$RAW" -scale 25% -blur 0x8 -resize 400% "$BLUR"
elif command -v ffmpeg >/dev/null 2>&1; then
  ffmpeg -hide_banner -loglevel error -y -i "$RAW" \
    -vf "scale=iw*0.25:ih*0.25,gblur=sigma=12,scale=iw*4:ih*4" \
    "$BLUR"
else
  dunstify "THERE IS NO BLUR UTILITY CAN'T LOCK"
  exec swaylock
  exit 0
fi

exec swaylock -f -i "$BLUR"
xec swaylock -f -i "$OUTDIR/lock.png"
