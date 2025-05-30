#!/bin/bash
set -euo pipefail

# Check arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <input.md> <output.pdf>"
    echo "Example: $0 presentation.md presentation.pdf"
    exit 1
fi

INPUT_MD="$1"
OUTPUT_PDF="$2"
TEMP_HTML=$(mktemp --suffix=.html)

# Cleanup
trap "rm -f '$TEMP_HTML'" EXIT

# First, inject Mermaid support into the markdown
echo "Preparing Markdown with Mermaid support..."

# Create a wrapper HTML that ensures Mermaid renders
cat > "$TEMP_HTML" << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <script src="https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.min.js"></script>
    <script>
        mermaid.initialize({ 
            startOnLoad: true,
            theme: 'default',
            securityLevel: 'loose'
        });
    </script>
    <style>
        .mermaid {
            text-align: center;
            margin: 20px auto;
        }
    </style>
</head>
