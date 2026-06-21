---
name: requirements-grill-lite
description: "Fallback only. Use as a strict pre-goal Grill Gate when the real grill-me skill is unavailable."
---

This is a lightweight fallback for requirement clarification.

Prefer the real `grill-me` skill if it is available.

Before using this fallback, search:

```bash
bash scripts/agent/find-skill.sh grill-me
```

## Strict rule

For non-trivial work, ask at least one material question before creating a Goal Contract or Technical Implementation Plan unless the user explicitly says to skip grilling.

Do not replace questions with assumptions.
Do not produce a Goal Contract or Technical Implementation Plan until the Grill Gate is resolved.

Ask about the most decision-changing unknown.

Useful topics include intent, success criteria, affected users, current behavior, desired behavior, non-goals, data model changes, UI behavior, permissions, edge cases, test strategy, rollout, and failure modes.

Use:

```text
## Grill Gate

Status: QUESTIONS_NEEDED

Question 1:
Recommended default:
Why this matters:
```

After the user answers, summarize:

```text
## Grill Gate Result

Clarified requirements:
Non-goals:
Key decisions:
Risks:
Test strategy:
Ready for Goal Contract: yes/no
```
