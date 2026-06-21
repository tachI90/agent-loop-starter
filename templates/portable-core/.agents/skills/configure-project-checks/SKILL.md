---
name: configure-project-checks
description: "Use when installing or updating scripts/agent/check.sh with correct project-specific checks."
---

Configure `scripts/agent/check.sh`.

Do not guess. Inspect the project first.

Look for:

- package.json
- composer.json
- pyproject.toml
- Makefile
- justfile
- README
- CONTRIBUTING
- CI workflows
- existing scripts

Rules:

1. Prefer commands already used by CI.
2. Prefer repo scripts over raw tool invocations.
3. Do not invent commands.
4. Remove the placeholder once real checks are added.
5. Run the script after editing it.
6. Report what commands were configured.
