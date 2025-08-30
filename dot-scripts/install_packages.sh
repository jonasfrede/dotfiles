
#!/bin/bash
set -euo pipefail

host=$(hostname -s)
outfile="$HOME/dotfiles/PACKAGES_${host}.txt"

if [[ ! -f "$outfile" ]]; then
  echo "Package list not found: $outfile" >&2
  exit 1
fi

# Temp files + cleanup
tmp_list=$(mktemp)
tmp_repo=$(mktemp)
trap 'rm -f -- "$tmp_list" "$tmp_repo"' EXIT

# Normalize list: remove CR, trim, drop comments/blank lines, strip BOM
sed -e '1s/^\xEF\xBB\xBF//' \
    -e 's/\r$//' \
    -e 's/[[:space:]]\+$//' \
    -e 's/^[[:space:]]\+//' \
    -e 's/#.*$//' "$outfile" \
  | awk 'NF' > "$tmp_list"

# All repo packages (yay’s sync view)
yay -Slq > "$tmp_repo"

# Intersection without needing sort order
mapfile -t installable_pkgs < <(grep -Fxf "$tmp_list" "$tmp_repo" | LC_ALL=C sort -u)

if [[ ${#installable_pkgs[@]} -eq 0 ]]; then
  echo "No installable packages found (none match repos currently available)."
  exit 0
fi

# Install only what’s not installed; pass as array, with "--" to stop option parsing
echo "Installing ${#installable_pkgs[@]} package(s): ${installable_pkgs[*]}"
yay -S --needed -- "${installable_pkgs[@]}"
