# Loop Patterns

This project uses the word "loop" carefully. It can mean several different things.

## Goal

A goal loop runs until a verifiable condition is true.

Use this for:

- "Fix until tests pass."
- "Implement this feature until the acceptance criteria are satisfied."
- "Clear all actionable production errors."

A Goal must have:

- completion condition
- verification signal
- max iteration cap
- escalation path

## Loop

A loop repeats a task while the session is active or while a human is supervising.

Use this for:

- "Every 5 minutes, make one safe repo improvement."
- "Watch the deploy and report issues."
- "Build, check, fix, repeat while I am here."

A Loop must have:

- interval or trigger
- one-iteration task
- stop condition
- budget or iteration cap

## Routine

A routine is a scheduled/background loop.

Use this for:

- daily PR review
- nightly maintenance
- scheduled issue triage
- inbox processing

A Routine must have:

- schedule
- durable state
- output location
- escalation path
- budget ceiling
- recovery behavior after interruption

## Recommended framing

Do not say only "run a loop."

Say one of:

```text
Run a Goal until this condition is true...
Run a Loop every N minutes while this session is active...
Run a Routine on this schedule and report results here...
```

## Practical pattern library

### Build-test-fix

```text
Build the next approved implementation step.
Run tests, typecheck, and lint.
Feed every failure back into the next iteration.
Stop when checks pass and the verifier has no blocking findings.
```

### Plan-generate-verify-fix

```text
Plan one bounded slice.
Implement it.
Verify against the Goal Contract and Technical Implementation Plan.
Fix what failed.
Stop at the first clean pass or when the iteration cap is hit.
```

### Human approval queue

```text
Perform the task.
Pause before shipping.
Ask the human to approve, revise, or skip.
Continue only after approval.
```

### Post-change review

```text
After each meaningful change, run a separate verifier.
Feed findings back while context is fresh.
Stop only when the verifier passes or escalation is needed.
```
