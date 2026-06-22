# Codex

Codex can use the portable core directly:

```text
AGENTS.md
.agents/skills/
scripts/agent/
```

Recommended skills:

```text
discover-agent-skills
ai-engineering-loop
grill-me, if the real upstream skill exists
requirements-grill-lite, as fallback
verifier
changeset-review-loop
pull-request-creator
configure-project-checks
```

Codex should follow:

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
Verifier Review
  ↓
Changeset Review Loop
  ↓
Human Review and Approval
  ↓
Pull Request Creation, unless skipped
```

Install only the portable core unless your repo also uses Cursor or Pi.
