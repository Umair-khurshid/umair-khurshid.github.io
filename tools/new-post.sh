#!/bin/bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 \"Post Title\" [tags...]"
  echo "  e.g.: $0 \"Debugging with strace\" linux devops"
  exit 1
fi

TITLE="$1"
shift
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' \
       | sed 's/[^a-z0-9]/-/g; s/--*/-/g; s/^-//; s/-$//')
DATE=$(date +%Y-%m-%d)
FILE="docs/posts/${SLUG}.md"

cat > "$FILE" << EOF
---
date: $DATE
tags:
$(for tag in "$@"; do echo "  - $tag"; done)
---

# $TITLE
EOF

echo "Created: $FILE"
echo ""
echo "Next steps:"
echo "  1. Write your content in $FILE"
echo "  2. Add nav entry in mkdocs.yml under Posts:"
echo "     - $TITLE: posts/${SLUG}.md"
echo "  3. Build: mkdocs build"
echo "  4. Deploy: mkdocs gh-deploy --force"
