# Pull Request Creation

After human approval, the agent should create a pull request automatically unless the user asks to skip this step.

The user can skip PR creation with:

```text
skip PR
do not create a PR
no PR
```

or equivalent wording.

## Preconditions

Before creating a PR, confirm:

1. Human approval was given.
2. The Changeset Review Loop passed or remaining risks were accepted.
3. Checks were run or skipped with a clear reason.
4. The working tree contains only intended changes.
5. The current branch is appropriate for a PR.

## Tool preference

Use available tools in this order:

1. `gh` for GitHub repositories.
2. `bkt` for repositories that use that PR tool.
3. Manual PR instructions if neither tool is available.

Do not guess unfamiliar commands. If `bkt` exists but usage is unknown, inspect help output and report the needed command.

## PR body

The PR should include:

- summary
- approved goal
- acceptance criteria status
- technical plan status
- changeset review result
- checks run
- verifier result
- risks
- remaining non-critical findings

## Result format

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
