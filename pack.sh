#!/bin/bash

# ==========================================
# USAGE: ./pack.sh [directory] [extensions]
# EXAMPLE: ./pack.sh src "ts,js,json"
# ==========================================

DIR=${1:-.} # Default to current directory if not specified
EXTS=${2:-"ts,tsx,js,jsx,py,go,rs,md,css,html"} # Default extensions

# 1. Define Ignore Patterns (Add more as needed)
IGNORES=(
  -not -path "*/node_modules/*"
  -not -path "*/.git/*"
  -not -path "*/dist/*"
  -not -path "*/build/*"
  -not -path "*/.next/*"
  -not -path "*/coverage/*"
  -not -path "*/package-lock.json"
  -not -path "*/yarn.lock"
)

# 2. Build the find command
# This creates a regex like: .*\.(ts|js|json)$
REGEX=".*\.(${EXTS//,/|})$"

echo "📦 Packing files from '$DIR' with extensions: $EXTS"

# 3. Execution Block
# We use a temporary file to build the context so we can count lines/tokens if needed
TEMP_FILE=$(mktemp)

{
  echo "# PROJECT CONTEXT"
  echo "The following is a concatenation of the project files."
  echo "Directory: $(pwd)"
  echo "=========================================="
  echo ""

  # Find files -> Sort them -> Loop through them
  find "$DIR" -type f -regextype posix-extended -regex "$REGEX" "${IGNORES[@]}" | sort | while read -r file; do
    echo "--- START FILE: $file ---"
    cat "$file"
    echo ""
    echo "--- END FILE: $file ---"
    echo ""
    echo ""
  done
} > "$TEMP_FILE"

# 4. Copy to Clipboard (Auto-detect OS)
if [[ "$OSTYPE" == "darwin"* ]]; then
    cat "$TEMP_FILE" | pbcopy
    echo "✅ Copied to MacOS clipboard!"
elif [[ -n "$WSL_DISTRO_NAME" ]]; then
    cat "$TEMP_FILE" | clip.exe
    echo "✅ Copied to Windows clipboard (via WSL)!"
elif command -v xclip &> /dev/null; then
    cat "$TEMP_FILE" | xclip -selection clipboard
    echo "✅ Copied to Linux clipboard (xclip)!"
elif command -v wl-copy &> /dev/null; then
    cat "$TEMP_FILE" | wl-copy
    echo "✅ Copied to Linux clipboard (Wayland)!"
else
    echo "❌ Could not find clipboard tool. Outputting to stdout:"
    cat "$TEMP_FILE"
fi

# Cleanup
rm "$TEMP_FILE"
