---
name: ai-engineering-loop
description: "Use for meaningful software changes: grill, goal approval, technical plan approval, implementation, checks, verifier review."
---

Use this skill as the default workflow for meaningful software development tasks.

## Mandatory order

1. Grill Gate
2. Goal Contract
3. Human Goal Approval
4. Technical Implementation Plan
5. Human Plan Approval
6. Loop Execution Contract, when repeated autonomous iterations are needed
7. Implementation Loop
8. Project Checks
9. Verifier Review
10. Final Summary

Do not create a Technical Implementation Plan before the Grill Gate is complete and the Goal Contract is approved.
Do not edit code before the Technical Implementation Plan is approved.

## Grill Gate

For non-trivial work, ask at least one material question unless the user explicitly says to skip grilling.

Output:

```text
## Grill Gate

Status: QUESTIONS_NEEDED | SKIPPED_WITH_REASON

Question 1:
Recommended default:
Why this matters:
```

If questions are needed, stop and wait.

Prefer the real `grill-me` skill if available. Otherwise use `requirements-grill-lite`.

## Goal Contract

After the Grill Gate is resolved, create a Goal Contract and ask for approval.

```text
## Goal Contract

Goal:

Acceptance criteria:
-

Non-goals:
-

Verification signals:
-

Stop condition:
-
```

## Technical Implementation Plan

After the Goal Contract is approved, create a detailed Technical Implementation Plan.

It must include:

- Approved goal summary
- Architecture pattern
- Technical approach and implementation flow
- Files and responsibilities
- Interfaces and schemas
- Function signatures
- API request/response shapes
- Database/schema/migration changes, if any
- Validation rules and typed errors
- Data/control flow with Mermaid diagrams where useful
- Sequence/lifecycle flow where useful
- Edge cases and pitfalls
- Possible regressions
- Testing and verification plan
- Detailed implementation steps with exact target files
- Open questions, or `None`

If a section is not applicable, say `Not applicable` and explain why.

Ask for approval before editing code.

## Loop Execution Contract

Before repeated autonomous iterations, scheduled/background execution, or long-running implementation/check/fix cycles, create:

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

Do not run unbounded loops. Use `anti-spin-guard` during repeated iterations.

## Implementation loop

After plan approval:

1. Implement the smallest correct change.
2. Run `bash scripts/agent/check.sh`.
3. Compare the result against the approved Goal Contract and Technical Implementation Plan.
4. Fix failures or gaps.
5. Stop after 3 failed attempts and ask for guidance.
6. Run `anti-spin-guard` when iterations repeat.
7. Continue until the approved goal is reached or blocked.

If implementation reveals a missing interface, schema, migration, API contract, validation rule, architectural decision, or data/control flow, stop and update the Technical Implementation Plan for approval before continuing.

## Verification

Use the verifier before claiming completion.
