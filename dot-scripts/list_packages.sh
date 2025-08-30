#!/bin/bash
set -euo pipefail

host=$(hostname -s)
outfile="$HOME/dotfiles/PACKAGES_${host}.txt"
oldfile="${outfile}.old"

mkdir -p "$(dirname "$outfile")"

# Write command output to a temp file first
tmpfile="$(mktemp "${outfile}.XXXXXX")"
yay -Qeq > "$tmpfile"

# Rotate existing file to .old (overwrite allowed)
if [[ -f "$outfile" ]]; then
  mv -f -- "$outfile" "$oldfile"
fi

# Move new file into place
mv -f -- "$tmpfile" "$outfile"

echo "Wrote: $outfile"
if [[ -f "$oldfile" ]]; then
  echo "Previous version saved as: $oldfile"
fi
