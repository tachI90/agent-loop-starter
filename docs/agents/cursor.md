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
```
