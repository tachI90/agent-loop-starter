# Cursor

Install:

```text
templates/portable-core/
templates/cursor-adapter/
```

Cursor-specific files include:

```text
.cursor/rules/
.cursor/agents/verifier.md
.cursor/agents/changeset-reviewer-architecture.md
.cursor/agents/changeset-reviewer-correctness.md
.cursor/agents/changeset-reviewer-regression.md
.cursor/agents/changeset-fixer.md
.cursor/skills/
.cursor/hooks.json
scripts/cursor/check.sh
```

Cursor should follow:

```text
Grill Gate
  ↓
Goal Contract
  ↓
Human Goal Approval
  ↓
Technical Implementation Plan
  ↓
Human Plan Approval
  ↓
Implementation Loop
  ↓
Verifier subagent
  ↓
Changeset Review Loop
  ↓
Human Review and Approval
  ↓
Pull Request Creation, unless skipped
```

The Changeset Review Loop uses three read-only reviewer subagents and one fixer subagent.

The pull request step happens only after human approval and can be skipped by user request.
