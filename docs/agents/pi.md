# Pi

Install:

```text
templates/portable-core/
templates/pi-adapter/
```

Pi-specific files include:

```text
.pi/settings.json
.pi/skills/
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

Pi should follow:

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
