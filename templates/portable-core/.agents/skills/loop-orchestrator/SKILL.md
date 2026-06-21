---
name: loop-orchestrator
description: "Use when work requires repeated autonomous iterations, scheduled/background execution, durable state, or a goal/loop/routine decision."
---

Use this skill before starting any repeated autonomous work.

## Classify the mode

Choose one:

```text
Goal     - run until a verifiable condition is true
Loop     - repeat while supervised or while the session is active
Routine  - scheduled/background loop with durable state and escalation
```

## Create a Loop Execution Contract

```text
## Loop Execution Contract

Mode:
Goal | Loop | Routine

Trigger:
Manual | interval | schedule | event

Max iterations:

Budget:

State file:

Progress signal:

No-progress rule:

Repeated-failure rule:

Flip-flop rule:

Verification:

Escalation:

Completion:
```

## Rules

1. Do not run unbounded loops.
2. Do not run a Routine without durable state.
3. Do not continue if the same failure repeats without new information.
4. Do not let the worker be the only judge of completion.
5. Use a checker for deterministic checks.
6. Use the verifier for skeptical review.
7. Stop and escalate when the Loop Execution Contract says to stop.

## Iteration log

For long-running work, keep a durable log:

```text
## Iteration Log

Iteration:
Action:
Result:
Progress signal:
Checks:
Verifier result:
Next step:
```
