---
name: pull-request-creator
description: "Use after human approval to create a pull request automatically when gh or bkt is available, unless the user asks to skip PR creation."
---

Use this skill only after human approval.

The user may skip this step by saying `skip PR`, `do not create a PR`, `no PR`, or equivalent.

## Preconditions

Before creating a pull request, confirm:

1. Human approval was given.
2. The changeset review loop passed or remaining risks were explicitly accepted.
3. Local checks were run or skipped with a clear reason.
4. The working tree contains only intended changes.
5. The branch is appropriate for a pull request.

## Tool preference

Use the first available tool:

1. `gh` for GitHub repositories.
2. `bkt` for repositories that use that PR tool.
3. If neither exists, print the exact manual command or instructions.

Check availability with:

```bash
command -v gh
command -v bkt
```

## PR content

The PR body must include:

```text
## Summary

- Change 1
- Change 2

## Approved Goal

- Goal:
- Acceptance criteria status:

## Technical Plan

- Approved: yes/no
- Notable implementation choices:

## Changeset Review

- Iterations used:
- Critical findings remaining:
- Non-critical findings for human awareness:

## Verification

- Checks run:
- Verifier result:

## Risks

- Risk 1
- Risk 2
```

## GitHub example

```bash
gh pr create --fill
```

If `--fill` is not enough, use an explicit title and body.

## bkt example

Use the repository's established `bkt` pull request command if available.

If the command is unknown, run `bkt --help` and report the exact command needed instead of guessing.

## Final report

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
