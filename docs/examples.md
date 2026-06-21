# Examples

These examples are tool-neutral. Adapt the command syntax to your agent.

## Build-test-fix Goal

```text
Goal:
Implement the approved task until tests, typecheck, lint, and verifier pass.

Loop Execution Contract:
Mode: Goal
Max iterations: 5
Progress signal: fewer failing checks or satisfied acceptance criteria
No-progress rule: stop after 2 iterations without a new passing check or accepted fix
Repeated-failure rule: stop after the same command fails 3 times
Verification: scripts/agent/check.sh plus verifier
Escalation: ask human with failure summary and options
```

## Five-minute maintainer Loop

```text
Mode: Loop
Trigger: every 5 minutes while supervised
Task: make one small safe repository improvement
Max iterations: 6
Budget: 30 minutes
Progress signal: one small verified change
Stop: any risky or ambiguous change
Verification: repo checks and verifier
```

## Nightly PR Routine

```text
Mode: Routine
Trigger: nightly schedule
State file: .agent/state/nightly-pr-review.md
Task: inspect open PRs, fix build failures, summarize ambiguous work
Max iterations: 10
Budget: configured daily ceiling
Escalation: leave a human-readable report
Completion: all fixable PR issues addressed or reported
```
