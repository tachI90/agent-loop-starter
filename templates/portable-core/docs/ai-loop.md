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
Verifier Review
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
