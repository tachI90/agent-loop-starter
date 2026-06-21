# Codex

Codex can use the portable core directly:

```text
AGENTS.md
.agents/skills/
scripts/agent/
```

Recommended explicit skill usage:

```text
$discover-agent-skills
$ai-engineering-loop
$grill-me                 # if the real upstream skill exists
$requirements-grill-lite  # fallback
$verifier
$configure-project-checks
```

Install only the portable core unless your repo also uses Cursor or Pi.
