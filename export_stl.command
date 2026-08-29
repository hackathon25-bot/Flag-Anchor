#!/bin/zsh
set -e
cd "$(dirname "$0")"
mkdir -p exported
if ! command -v zoo >/dev/null 2>&1; then
  echo "Zoo CLI is not installed. Install it with:"
  echo "  brew tap kittycad/kittycad"
  echo "  brew install kittycad"
  exit 1
fi
zoo auth login --web || zoo auth login
zoo kcl export --output-format=stl . exported
open exported
