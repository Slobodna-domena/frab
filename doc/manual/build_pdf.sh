#!/usr/bin/env bash
#
# Renders one of the manuals to a PDF with headless Chrome.
#
#   doc/manual/build_pdf.sh                      # both manuals
#   doc/manual/build_pdf.sh frab-quick-start.html
#   doc/manual/build_pdf.sh frab-quick-start.html /tmp/out.pdf
#
# The screenshots are downscaled into a temporary copy first (they are captured
# at 2x for reuse elsewhere, which is more than a printed page needs), so the
# resulting PDF stays small enough to mail.

set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# no arguments: build every manual in this directory
if [ $# -eq 0 ]; then
  for html in "$HERE"/frab-*.html; do
    "${BASH_SOURCE[0]}" "$html"
  done
  exit 0
fi

SOURCE="$1"
[ -f "$SOURCE" ] || SOURCE="$HERE/$1"
OUTPUT="${2:-${SOURCE%.html}.pdf}"
WIDTH="${SCREENSHOT_WIDTH:-1600}"

CHROME="${CHROME:-$(command -v google-chrome || command -v chromium || command -v chromium-browser)}"
[ -x "$CHROME" ] || { echo "no chrome found - set CHROME=/path/to/chrome" >&2; exit 1; }

WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

cp "$SOURCE" "$WORK/manual.html"
mkdir -p "$WORK/screenshots"

echo "downscaling screenshots to ${WIDTH}px ..."
for f in "$HERE"/screenshots/*.png; do
  convert "$f" -resize "${WIDTH}x>" -strip "$WORK/screenshots/$(basename "$f")"
done

echo "rendering pdf ..."
"$CHROME" \
  --headless=new --disable-gpu --no-sandbox --disable-dev-shm-usage \
  --no-pdf-header-footer \
  --virtual-time-budget=30000 \
  --print-to-pdf="$WORK/manual.pdf" \
  "file://$WORK/manual.html" 2>/dev/null

mv "$WORK/manual.pdf" "$OUTPUT"
echo "wrote $OUTPUT ($(du -h "$OUTPUT" | cut -f1), $(pdfinfo "$OUTPUT" 2>/dev/null | awk '/^Pages/{print $2}') pages)"
