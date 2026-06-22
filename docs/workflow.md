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
Changeset Review Loop
  ↓
Human Review and Approval
  ↓
Pull Request Creation, unless skipped
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

## Changeset Review Loop

Before human review, run three independent changeset reviewers:

1. Architecture reviewer
2. Correctness reviewer
3. Regression reviewer

Then run a fixer pass for actionable findings.

Repeat until no `CRITICAL` findings remain or three review/fix iterations have completed.

If `CRITICAL` findings remain after three iterations, the work is blocked and should not be presented as ready for human approval.

Remaining non-critical findings must be reported to the human reviewer.

## Human approval and pull request creation

After the changeset review passes, present the work for human review and approval.

After human approval, create a pull request automatically unless the user asks to skip this step.

Use `gh` or `bkt` when available. If neither is available, provide manual PR instructions.
