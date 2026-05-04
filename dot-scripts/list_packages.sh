#!/bin/bash
set -euo pipefail

host=$(hostname -s)
outfile="$HOME/dotfiles/PACKAGES_${host}.txt"
outfile_complete="$HOME/dotfiles/PACKAGES_${host}_complete.txt"
oldfile="${outfile}.old"
oldfile_complete="${outfile_complete}.old"

mkdir -p "$(dirname "$outfile")"
mkdir -p "$(dirname "$outfile_complete")"

# Write command output to temp files first
tmpfile="$(mktemp "${outfile}.XXXXXX")"
tmpfile_complete="$(mktemp "${outfile_complete}.XXXXXX")"
yay -Qeq > "$tmpfile"
yay -Qq > "$tmpfile_complete"

# Rotate existing files to .old (overwrite allowed)
if [[ -f "$outfile" ]]; then
  mv -f -- "$outfile" "$oldfile"
fi

if [[ -f "$outfile_complete" ]]; then
  mv -f -- "$outfile_complete" "$oldfile_complete"
fi

# Move new files into place
mv -f -- "$tmpfile" "$outfile"
mv -f -- "$tmpfile_complete" "$outfile_complete"

echo "Wrote: $outfile"
echo "Wrote: $outfile_complete"
if [[ -f "$oldfile" ]]; then
  echo "Previous list saved as: $oldfile"
fi

if [[ -f "$oldfile_complete" ]]; then
  echo "Previous complete list saved as: $oldfile_complete"
fi
