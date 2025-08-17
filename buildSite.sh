#!/bin/sh

STAMP=$(date +%Y%m%d%H%M%S)
BASE=/srv/web/garlic-signage.com
REPO=/srv/repo/garlic-signage.com
RELEASES=$BASE/releases
DEST=$RELEASES/$STAMP
CURRENT=$BASE/current

mkdir -p "$RELEASES"

# Update repository
cd "$REPO"
git pull --ff-only

# Build
hugo -s "$REPO" -d "$DEST" --gc --minify

# Precompress
find "$DEST" -type f \( -name '*.html' -o -name '*.css' -o -name '*.js' -o -name '*.svg' -o -name '*.xml' -o -name '*.json' \) -print0 | xargs -0 -I{} brotli -Z --keep {}
find "$DEST" -type f \( -name '*.html' -o -name '*.css' -o -name '*.js' -o -name '*.svg' -o -name '*.xml' -o -name '*.json' \) -print0 | xargs -0 -I{} gzip -9 -k {}

chown -R www-data:www-data "$DEST"

# Atomic Switch
ln -sfn "$DEST" "$CURRENT"

# Health-Check
curl -fsS https://garlic-signage.com/ >/dev/null || exit 1

# Cleanup: keep last 5
ls -1dt "$RELEASES"/* | tail -n +6 | xargs -r rm -rf