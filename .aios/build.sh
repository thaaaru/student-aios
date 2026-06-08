#!/usr/bin/env sh
set -eu

OUTPUT=".aios/compiled.md"

cat > "$OUTPUT" <<'EOF'
# Student AIOS

This file is generated from the AIOS source files.

EOF
for file in \
  .aios/identity.md \
  .aios/learning.md \
  .aios/coding.md \
  .aios/research.md \
  .aios/assignments.md \
  .aios/presentations.md \
  .aios/problem-solving.md \
  .aios/career.md
do
  printf '\n---\n\n' >> "$OUTPUT"
  cat "$file" >> "$OUTPUT"
done

echo "Generated $OUTPUT"
