---
name: discover-agent-skills
description: "Use when deciding whether a skill such as grill-me exists in project, user/global, admin, system, or configured locations."
---

Do not only check project scope.

Run:

```bash
bash scripts/agent/find-skill.sh grill-me
```

Also check the agent's skill picker/list when available because system-bundled skills may not be visible on disk.

Report:

- whether the skill was found
- path or scope if visible
- whether fallback was needed
