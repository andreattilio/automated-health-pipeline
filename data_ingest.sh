#!/bin/sh
# updateManu.sh — force-move newest CSV from ~/Downloads to one fixed file

set -eu

DOWNLOADS="$HOME/Downloads"
 TARGET_FILE="$HOME/Documents/HealthData/raw_data.csv"  # <-- CHANGE THIS to your fixed file path

[ -d "$DOWNLOADS" ] || { echo "Downloads not found: $DOWNLOADS" >&2; exit 1; }
mkdir -p "$(dirname "$TARGET_FILE")"

cd "$DOWNLOADS"

latest=""
# Use creation time (birth time): ls -ltU; pick first *.csv; skip temp/incomplete files.
IFS='
'
for entry in $(ls -1tU -A -- 2>/dev/null); do
  [ -f "$entry" ] || continue
  case "$entry" in
    *.download|*.crdownload|*.part|*.tmp|.DS_Store) continue ;;
  esac
  lc=$(printf '%s' "$entry" | tr '[:upper:]' '[:lower:]')
  case "$lc" in
    *.csv) latest="$entry"; break ;;
  esac
done
unset IFS

[ -n "$latest" ] || { echo "No CSV found in $DOWNLOADS" >&2; exit 2; }

src="$PWD/$latest"   # absolute path without relying on realpath
echo "Moving newest CSV:"
echo "  $src"
echo "-> $TARGET_FILE"

# Force-overwrite the fixed file
mv -f -- "$src" "$TARGET_FILE" 2>/dev/null || mv -f "$src" "$TARGET_FILE"

