# Loop Guardrails

Autonomous loops need explicit stop conditions. Without them, they can spin, repeat failed approaches, edit the wrong thing, or burn budget.

## Loop Execution Contract

For any repeated autonomous work, create this before the loop starts:

```text
## Loop Execution Contract

Mode:
Goal | Loop | Routine

Trigger:
Manual | interval | schedule | event

Max iterations:
Number

Budget:
Token/time/money/tool-call ceiling, if known

State file:
Path for durable progress notes, if this may outlive one session

Progress signal:
What must improve each iteration?

No-progress rule:
Stop if no measurable progress after N iterations.

Repeated-failure rule:
Stop if the same command or verifier finding fails N times.

Flip-flop rule:
Stop if the agent alternates between two approaches without improvement.

Verification:
Commands, tests, review skill, or verifier subagent.

Escalation:
What to ask the human when blocked.

Completion:
What evidence proves the loop is done?
```

## Required hard stops

Every loop should have at least:

- max iterations
- no-progress detection
- repeated-failure detection
- human escalation
- verifier gate

For background routines, also require:

- durable state
- schedule
- output location
- budget ceiling
- crash/restart behavior

## No-progress detection

The agent must compare each iteration against the previous one.

Progress can be:

- fewer failing tests
- fewer verifier findings
- completed acceptance criterion
- reduced error count
- clearer implementation state
- merged PR state
- human-approved milestone

No progress is:

- same failure repeated
- new code churn without acceptance criteria movement
- changing tests to match wrong behavior
- refactoring unrelated files
- alternating between two incompatible approaches

## Worker / checker / verifier separation

Prefer three roles:

```text
Worker   → changes code
Checker  → runs deterministic checks
Verifier → skeptically reviews goal and plan satisfaction
```

The worker should not be the only judge of completion.

## Budget model

The loop should know when to stop spending.

Budget can be expressed as:

- max iterations
- max wall-clock time
- max tool calls
- max model turns
- max money
- max files changed
- max retries for the same failure

## Escalation format

When blocked, the agent should report:

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
