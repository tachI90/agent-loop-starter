# Changeset Review Loop

The Changeset Review Loop runs after implementation checks and verifier review, but before final human review.

Its job is to catch issues that a single verifier or deterministic checks may miss.

## Roles

The loop uses three independent reviewer perspectives and one fixer:

1. Architecture reviewer
2. Correctness reviewer
3. Regression reviewer
4. Fixer

## Reviewer responsibilities

### Architecture reviewer

Checks:

- architecture pattern alignment
- file/module boundaries
- responsibility placement
- interface and schema consistency
- migration or persistence design
- maintainability
- alignment with the approved Technical Implementation Plan

### Correctness reviewer

Checks:

- acceptance criteria
- edge cases
- validation
- error handling
- type correctness
- API behavior
- transaction or consistency issues
- tests and assertions
- alignment with the approved Goal Contract

### Regression reviewer

Checks:

- existing behavior that must not change
- backward compatibility
- auth, permissions, and sensitive paths
- performance risks
- UI state regressions
- rollout or rollback risks
- flaky tests
- accidental unrelated changes

## Severity levels

```text
CRITICAL | HIGH | MEDIUM | LOW | NIT
```

A `CRITICAL` finding means the changeset should not proceed to human review unless fixed or explicitly marked blocked.

## Loop rule

Repeat review and fix until either:

1. no reviewer reports any `CRITICAL` findings, or
2. three review/fix iterations have completed.

If `CRITICAL` findings remain after three iterations, the work is blocked and should not be presented as ready for human approval.

Non-critical findings may remain, but they must be reported for human review.

## Output summary

Before human review, produce:

```text
## Changeset Review Summary

Status:
PASS | BLOCKED

Iterations used:
Number

Critical findings remaining:
Number

Non-critical findings remaining:
- Finding 1
- Finding 2

Checks run:
- Command/result

Ready for human review:
yes/no
```
