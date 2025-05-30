#!/bin/bash
set -euo pipefail

if [ $# -ne 2 ]; then
    echo "Usage: $0 <input.md> <output.pdf>"
    exit 1
fi

INPUT_MD="$1"
OUTPUT_PDF="$2"

# Install decktape if needed
if ! command -v decktape &>/dev/null; then
    echo "Installing decktape..."
    npm install -g decktape
fi

# Serve the HTML file temporarily
TEMP_HTML=$(mktemp --suffix=.html)
trap "rm -f '$TEMP_HTML'" EXIT

# Convert to HTML with Mermaid support
marp "$INPUT_MD" --html -o "$TEMP_HTML"

# Use Python's simple HTTP server
echo "Starting temporary server..."
python3 -m http.server 8080 &
SERVER_PID=$!
trap "kill $SERVER_PID 2>/dev/null; rm -f '$TEMP_HTML'" EXIT

sleep 2

# Convert using decktape
echo "Converting to PDF..."
decktape automatic "http://localhost:8080/$(basename "$TEMP_HTML")" "$OUTPUT_PDF" \
    --chrome-arg=--no-sandbox \
    --pause 3000

echo "Success! PDF created: $OUTPUT_PDF"
