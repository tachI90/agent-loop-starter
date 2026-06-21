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

Recommended explicit skill usage:

```text
/skill:discover-agent-skills
/skill:ai-engineering-loop
/skill:grill-me                 # if the real upstream skill exists
/skill:requirements-grill-lite  # fallback
/skill:verifier
/skill:configure-project-checks
```
