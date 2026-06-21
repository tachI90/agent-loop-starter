# Changelog

## 0.3.0

Replaces the root install script with agent-facing install prompts.

Rationale:

- Installing into real repositories requires merging existing instructions.
- Agents can inspect project scripts and CI before configuring `check.sh`.
- Agents can preserve existing `AGENTS.md`, Cursor rules, Pi settings, and skills.
- This avoids brittle blind-copy behavior.

Added:

- `INSTALL_WITH_AGENT.md`
- `prompts/install-in-existing-repo.md`
- updated installation docs and README

Removed:

- root `scripts/install.sh`

## 0.2.0

Adds loop runtime guardrails inspired by practical loop patterns:

- Goal / Loop / Routine mode taxonomy.
- Loop Execution Contract.
- Max iteration, no-progress, flip-flop, and budget guardrails.
- Durable loop state template.
- Worker / checker / verifier separation.
- New `loop-orchestrator` skill.
- New `anti-spin-guard` skill.
- New docs for loop patterns, guardrails, and reusable skill libraries.

## 0.1.0

Initial publishable repository structure.

Includes:

- Portable core workflow.
- Cursor adapter.
- Pi adapter.
- Codex-compatible skills.
- Strict Grill Gate.
- Goal Contract gate.
- Detailed Technical Implementation Plan gate.
- Verifier workflow.
- Project check scaffold.
- Skill discovery helper.
- Install prompts and shell installer.
