#!/usr/bin/env bash
# Copy the latest rust_particles web build into the site.
# Build it first:  cd ../rust_particles && trunk build --release
set -euo pipefail

SITE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SRC="${1:-$SITE_DIR/../rust_particles/dist}"
DEST="$SITE_DIR/static/js/rust_particles"

for f in index.html rust_particles.js rust_particles_bg.wasm sw.js; do
  [[ -f "$SRC/$f" ]] || { echo "missing $SRC/$f — run 'trunk build --release' first" >&2; exit 1; }
done

mkdir -p "$DEST"
cp "$SRC"/{index.html,rust_particles.js,rust_particles_bg.wasm,sw.js} "$DEST"/
echo "Updated $DEST from $SRC"
