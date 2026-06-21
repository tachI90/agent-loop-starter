# Architecture

Agent Loop Starter is split into a portable core and thin agent adapters.

## Portable core

```text
templates/portable-core/
  AGENTS.md
  .agents/skills/
  scripts/agent/
  docs/
```

The portable core should work in any agent that reads repository instructions or supports Agent Skills.

## Cursor adapter

```text
templates/cursor-adapter/
  .cursor/rules/
  .cursor/agents/verifier.md
  .cursor/skills/
  .cursor/hooks.json
  scripts/cursor/check.sh
```

Cursor gets the richest native integration:

- always-on rules
- mirrored skills
- verifier subagent
- hook wrapper

## Pi adapter

```text
templates/pi-adapter/
  .pi/settings.json
  .pi/skills/
```

Pi gets `.pi/skills` mirrors and settings that register both portable and Pi-specific skill paths.

## Codex

Codex uses the portable core directly:

```text
AGENTS.md
.agents/skills/
scripts/agent/
```

No `.codex` adapter is needed for this workflow.


## Installation philosophy

This repository intentionally does not ship a root install script.

Installing into a real project is a merge task, not a copy task. An agent should inspect the target repository, preserve existing instructions, choose adapters, configure project checks, and report conflicts.
