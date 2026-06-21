# Workflow

## Mandatory order

For non-trivial work:

```text
Grill Gate
  ↓
Goal Contract
  ↓
Human Goal Approval
  ↓
Technical Implementation Plan
  ↓
Human Plan Approval
  ↓
Implementation / Check / Fix Loop
  ↓
Verifier Review
  ↓
Human Review
```

## Grill Gate

The agent must ask at least one material question before creating a goal or plan unless you explicitly say to skip grilling.

The agent should prefer the real `grill-me` skill if it exists in any project, user, global, admin, system, or configured skill scope.

Fallback:

```text
requirements-grill-lite
```

## Goal Contract

The Goal Contract defines what must be true for the task to be complete.

It includes:

- Goal
- Acceptance criteria
- Non-goals
- Verification signals
- Stop condition

## Technical Implementation Plan

The plan must include:

- Approved goal summary
- Architecture pattern
- Technical approach and implementation flow
- Files and responsibilities
- Interfaces and schemas
- Function signatures
- API request/response shapes
- Database/schema/migration changes, if any
- Validation rules and typed errors
- Data and control flow
- Mermaid diagrams where useful
- Sequence or lifecycle flow where useful
- Edge cases and pitfalls to avoid
- Possible regressions
- Testing and verification plan
- Detailed implementation steps with target files
- Open questions

## Verifier

The verifier checks:

- The Grill Gate happened or was explicitly skipped.
- The Goal Contract was approved.
- The Technical Implementation Plan was approved.
- The approved goal was reached.
- The implementation matches the approved plan.
- Regression risks were addressed.
- Checks meaningfully support the approved goal.
