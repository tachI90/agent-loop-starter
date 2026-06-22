---
name: pull-request-creator
description: "Use after human approval to create a pull request with gh or bkt when available, unless the user asks to skip."
---

Use this skill only after human approval.

Skip this step when the user says `skip PR`, `do not create a PR`, `no PR`, or equivalent.

Before creating a pull request, confirm:

1. Human approval was given.
2. The changeset review loop passed or remaining risks were accepted.
3. Local checks were run or skipped with a clear reason.
4. The working tree contains only intended changes.
5. The branch is appropriate for a pull request.

Tool preference:

1. Use `gh` when available for GitHub repositories.
2. Use `bkt` when available for repositories that use it.
3. If neither exists, provide manual PR instructions.

The PR body should include summary, approved goal, technical plan status, changeset review result, checks, verifier result, and risks.

Return:

```text
## Pull Request

Status:
CREATED | SKIPPED | BLOCKED

Tool:
gh | bkt | manual | none

URL:
PR URL or Not applicable

Notes:
- Note 1
```
