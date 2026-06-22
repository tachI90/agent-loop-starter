# AI Loop

This repo uses Agent Loop Starter.

See `AGENTS.md` for the source of truth.

Mandatory order:

```text
Grill Gate
Goal Contract
Human Goal Approval
Technical Implementation Plan
Human Plan Approval
Loop Execution Contract, if repeated autonomous iterations are needed
Implementation / Check / Fix Loop
Project Checks
Verifier Review
Changeset Review Loop
Human Review and Approval
Pull Request Creation, unless skipped
```

Any repeated loop must have:

- max iterations
- budget
- progress signal
- no-progress rule
- repeated-failure rule
- flip-flop rule
- verification
- escalation

The Changeset Review Loop runs before human review.

It uses:

1. Architecture reviewer
2. Correctness reviewer
3. Regression reviewer
4. Fixer

The review/fix loop stops when no `CRITICAL` findings remain or after three iterations.

After human approval, the agent should create a pull request with `gh` or `bkt` when available, unless the user asks to skip PR creation.
