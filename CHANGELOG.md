# Changelog

## 0.5.0

Adds update instructions for repositories that already have an older Agent Loop Starter installed.

Includes:

- `UPDATE_WITH_AGENT.md`
- `prompts/update-existing-install.md`
- `docs/updating.md`
- README update section
- installation docs link to update flow
- validation checks for update documentation

## 0.4.0

Adds the post-verifier Changeset Review Loop and post-approval PR creation gate.

Includes:

- `changeset-review-loop` skill.
- `pull-request-creator` skill.
- Cursor changeset reviewer subagents for architecture, correctness, and regression review.
- Cursor changeset fixer subagent.
- Cursor rule for the Changeset Review Loop.
- Documentation for changeset review and pull request creation.
- Workflow updates so PR creation happens after human approval and can be skipped by user request.

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
