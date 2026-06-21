#!/usr/bin/env bash
set -uo pipefail

SKILL_NAME="${1:-}"

if [ -z "$SKILL_NAME" ]; then
  echo "Usage: bash scripts/agent/find-skill.sh <skill-name>" >&2
  exit 2
fi

FOUND=0

print_found() {
  local scope="$1"
  local path="$2"

  if [ -e "$path" ]; then
    FOUND=1
    printf "FOUND\t%s\t%s\n" "$scope" "$path"
  fi
}

check_skill_dir() {
  local scope="$1"
  local dir="$2"

  [ -n "$dir" ] || return 0

  print_found "$scope" "$dir/$SKILL_NAME/SKILL.md"
  print_found "$scope" "$dir/$SKILL_NAME.md"
}

canonical_path() {
  local path="$1"

  if command -v realpath >/dev/null 2>&1; then
    realpath "$path" 2>/dev/null || printf "%s\n" "$path"
  else
    printf "%s\n" "$path"
  fi
}

ROOT_DIR="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
CWD="$(pwd)"

current="$CWD"
root_canonical="$(canonical_path "$ROOT_DIR")"

while true; do
  check_skill_dir "project-agents" "$current/.agents/skills"
  check_skill_dir "project-pi" "$current/.pi/skills"
  check_skill_dir "project-cursor" "$current/.cursor/skills"

  current_canonical="$(canonical_path "$current")"
  if [ "$current_canonical" = "$root_canonical" ] || [ "$current" = "/" ]; then
    break
  fi

  parent="$(dirname "$current")"
  if [ "$parent" = "$current" ]; then
    break
  fi

  current="$parent"
done

check_skill_dir "user-agents" "$HOME/.agents/skills"
check_skill_dir "user-pi" "$HOME/.pi/agent/skills"
check_skill_dir "codex-admin" "/etc/codex/skills"
check_skill_dir "user-cursor" "$HOME/.cursor/skills"
check_skill_dir "user-cursor-config" "$HOME/.config/cursor/skills"

if [ "$FOUND" -eq 1 ]; then
  exit 0
fi

printf "NOT_FOUND\t%s\n" "$SKILL_NAME"
exit 1
