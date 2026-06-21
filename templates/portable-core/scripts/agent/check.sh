#!/usr/bin/env bash
set -uo pipefail

# Project-specific verification scaffold.
#
# Configure run_project_checks() after installing this starter.
#
# Default mode is report-only:
#   bash scripts/agent/check.sh
#
# Strict mode exits non-zero on failed checks:
#   AGENT_LOOP_STRICT=1 bash scripts/agent/check.sh

ROOT_DIR="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$ROOT_DIR" || exit 1

FAILED=0
RAN=0

log() {
  printf "\n[agent-check] %s\n" "$1"
}

run_check() {
  local label="$1"
  shift

  RAN=1
  log "Running: $label"

  "$@"
  local status=$?

  if [ "$status" -ne 0 ]; then
    log "FAILED: $label"
    FAILED=1
  else
    log "PASSED: $label"
  fi
}

run_shell_check() {
  local label="$1"
  local command_string="$2"

  RAN=1
  log "Running: $label"

  bash -lc "$command_string"
  local status=$?

  if [ "$status" -ne 0 ]; then
    log "FAILED: $label"
    FAILED=1
  else
    log "PASSED: $label"
  fi
}

run_project_checks() {
  ###########################################################################
  # TODO: Configure this section for your project.
  #
  # Examples:
  #
  # run_check "Format" pnpm fmt:check
  # run_check "Lint" pnpm lint
  # run_check "Tests" pnpm test
  # run_check "Build" pnpm build
  #
  # run_check "PHPUnit" vendor/bin/phpunit
  # run_check "PHPStan" vendor/bin/phpstan analyse
  # run_check "Pint" vendor/bin/pint --test
  ###########################################################################

  log "scripts/agent/check.sh is not configured yet."
  log "Edit run_project_checks() and add this repo's real check commands."
}

finish() {
  if [ "$RAN" -eq 0 ]; then
    log "No project checks were configured or executed."

    if [ "${AGENT_LOOP_STRICT:-0}" = "1" ]; then
      log "Strict mode is enabled, so unconfigured checks fail."
      exit 1
    fi

    log "Report-only mode is enabled, so exiting 0."
    exit 0
  fi

  if [ "$FAILED" -ne 0 ]; then
    if [ "${AGENT_LOOP_STRICT:-0}" = "1" ]; then
      log "One or more checks failed. Strict mode is enabled."
      exit 1
    fi

    log "One or more checks failed. Report-only mode is enabled, so exiting 0."
    exit 0
  fi

  log "All configured checks passed."
  exit 0
}

log "Starting project verification scaffold."
run_project_checks
finish
