# Updating an Existing Installation

Use this guide when a repository already has an older Agent Loop Starter installed.

Updating is a merge task. Do not blindly copy templates over an existing repository because the target repo may have local project-specific guidance, custom checks, existing Cursor rules, existing Pi settings, or custom skills.

## Recommended update path

Open the target repository in a coding agent and give it the update prompt:

```text
Update the existing Agent Loop Starter installation in this repository.

Use the update instructions from:
UPDATE_WITH_AGENT.md

Preserve local project-specific guidance and check commands.
Do not overwrite grill-me.
Add missing latest skills, rules, docs, and subagents.
Merge changes carefully and report conflicts.
```

The full prompt is available in:

```text
UPDATE_WITH_AGENT.md
prompts/update-existing-install.md
```

## What the update should preserve

The update must preserve:

- local `AGENTS.md` project guidance
- local `CLAUDE.md` or similar agent guidance
- project-specific check commands in `scripts/agent/check.sh`
- existing Cursor rules and hooks
- existing Pi settings
- custom skills
- branch, commit, and pull request rules
- project architecture and testing instructions

## What the update should add

The update should add missing latest components:

- Strict Grill Gate
- Goal Contract approval
- Technical Implementation Plan approval
- Loop Execution Contract
- Anti-spin guardrails
- Verifier Review
- Changeset Review Loop
- Pull Request Creation after human approval

Newer files may include:

```text
.agents/skills/changeset-review-loop/SKILL.md
.agents/skills/pull-request-creator/SKILL.md
.cursor/rules/changeset-review-loop.mdc
.cursor/agents/changeset-reviewer-architecture.md
.cursor/agents/changeset-reviewer-correctness.md
.cursor/agents/changeset-reviewer-regression.md
.cursor/agents/changeset-fixer.md
docs/changeset-review-loop.md
docs/pull-request-creation.md
```

## Safe update rules

Use these rules when updating files:

1. If a file is an unmodified old starter template, replace it with the latest version.
2. If a file is a locally modified starter file, merge the latest changes into it.
3. If a file is fully custom, do not replace it without human approval.
4. If a new starter file is missing, add it.
5. Never add a local fallback skill named `grill-me`.
6. Never remove project-specific check commands.
7. Never change application code during the update.

## Verification

After updating, run:

```bash
bash scripts/agent/find-skill.sh grill-me || true
bash scripts/agent/check.sh
```

If shell scripts are present, also check syntax:

```bash
bash -n scripts/agent/check.sh
bash -n scripts/agent/find-skill.sh
bash -n scripts/cursor/check.sh 2>/dev/null || true
```

If checks fail because the project already has failing checks, report that honestly.

## Update report

The update agent should finish with:

```text
## Agent Loop Starter Update Report

Files added:
- ...

Files updated:
- ...

Files preserved:
- ...

Local customizations preserved:
- ...

Conflicts:
- ...

Adapters:
- Portable core: installed/updated
- Cursor: installed/updated/not present
- Pi: installed/updated/not present

Real grill-me found:
yes/no/path if known

Checks run:
- command/result

Remaining manual decisions:
- ...
```
