---
name: anti-spin-guard
description: "Use inside repeated loops to detect no progress, repeated failures, flip-flopping, budget risk, or unsafe continuation."
---

Use this skill during and after each loop iteration.

## Check for spin

Stop and escalate if any condition is true:

- max iterations reached
- budget limit reached
- same failure repeated too many times
- no measurable progress after the configured limit
- alternating between two approaches without improvement
- changing tests to fit incorrect behavior
- unrelated refactoring instead of acceptance-criteria progress
- verifier reports the same blocking issue repeatedly

## Progress assessment

Report:

```text
## Anti-Spin Check

Iteration:
Progress made: yes/no
Evidence:
Repeated failure: yes/no
Flip-flop detected: yes/no
Budget remaining:
Continue: yes/no
Reason:
```

## If blocked

Use:

```text
## Loop Blocked

Where it stopped:
Why it stopped:
Iterations used:
Budget used:
Last successful state:
Blocking issue:
Options:
1. Recommended option
2. Alternative
3. Stop
```
