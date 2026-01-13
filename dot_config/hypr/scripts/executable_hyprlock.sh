#!/usr/bin/env bash
set -euo pipefail

OUTDIR=/tmp/hyprlock
mkdir -p "$OUTDIR"

MON1="$(hyprctl -j monitors | jq -r '.[0].name')"
MON2="$(hyprctl -j monitors | jq -r '.[1].name')"

#check and echo if only 1 monitor exist
if [[ -z "${MON1:-}" || -z "${MON2:-}" || "$MON2" == "null" ]]; then
  echo "Expected 2 monitors, got: MON1='$MON1' MON2='$MON2'" >&2
  exit 1
fi

grim -o "$MON1" "$OUTDIR/mon1.png"
grim -o "$MON2" "$OUTDIR/mon2.png"
exec hyprlock
rm -f "$OUTDIR/mon1.png" "$OUTDIR/mon2.png"
