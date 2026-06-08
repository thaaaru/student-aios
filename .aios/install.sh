#!/usr/bin/env sh
set -eu

REPO_URL="${1:-}"
TARGET_DIR="${2:-aios_v2}"

if [ -n "$REPO_URL" ]; then
  if [ -d "$TARGET_DIR/.git" ]; then
    echo "Updating $TARGET_DIR..."
    git -C "$TARGET_DIR" pull
  else
    echo "Cloning $REPO_URL into $TARGET_DIR..."
    git clone "$REPO_URL" "$TARGET_DIR"
  fi
  cd "$TARGET_DIR"
fi

if [ ! -f ".aios/build.sh" ]; then
  echo "Error: .aios/build.sh not found."
  echo "Usage: sh install.sh <github-repo-url> [target-folder]"
  exit 1
fi

chmod +x .aios/build.sh .aios/install.sh
sh .aios/build.sh

echo "Student AIOS is ready."
echo "Edit .aios/identity.md, then run: sh .aios/build.sh"
echo "Use .aios/compiled.md with your AI coding assistant."
