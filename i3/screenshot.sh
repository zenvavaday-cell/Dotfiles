#!/usr/bin/env bash
set -euo pipefail

mode="${1:-full}"
dir="$HOME/Pictures/Screenshots"
mkdir -p "$dir"
file="$dir/screenshot-$(date +%Y%m%d-%H%M%S).png"

case "$mode" in
  full)
    import -window root "$file"
    ;;
  region)
    scrot -s "$file"
    ;;
  *)
    echo "usage: $0 [full|region]" >&2
    exit 2
    ;;
esac
