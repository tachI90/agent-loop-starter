#!/usr/bin/env bash
set -uo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$ROOT_DIR" || exit 1

bash scripts/agent/check.sh
