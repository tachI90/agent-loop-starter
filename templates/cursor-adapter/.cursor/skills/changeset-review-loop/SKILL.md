---
name: changeset-review-loop
description: "Use after implementation checks and verifier review, before human review, to run three independent changeset reviewers and a fixer loop until no critical findings remain or three iterations are reached."
---

Use this skill after implementation, local checks, and verifier review, but before asking for final human review.

## Purpose

The changeset review loop catches problems that normal checks and a single verifier may miss.

It uses three independent reviewer perspectives plus one fixer:

1. Architecture reviewer
2. Correctness reviewer
3. Regression reviewer
4. Fixer

The reviewers inspect the same changeset independently and report findings.
The fixer addresses actionable findings.
The loop repeats until no `CRITICAL` findings remain or three iterations have completed.

## Maximum iterations

Run at most three review/fix iterations.

Stop earlier when all three reviewers report no `CRITICAL` findings.

Do not hide remaining non-critical findings. Report them for human review.

## Reviewer 1: Architecture reviewer

Focus on:

- architecture pattern alignment
- file/module boundaries
- unnecessary abstractions
- misplaced responsibilities
- interface and schema consistency
- migration or persistence design
- long-term maintainability
- whether the implementation follows the approved Technical Implementation Plan

## Reviewer 2: Correctness reviewer

Focus on:

- acceptance criteria
- edge cases
- data validation
- error handling
- type correctness
- API behavior
- transaction or consistency issues
- tests that actually prove the behavior
- whether the approved Goal Contract is satisfied

## Reviewer 3: Regression reviewer

Focus on:

- existing behavior that must not change
- backward compatibility
- auth, permissions, and security-sensitive paths
- performance risks
- UI state regressions
- migration rollback or rollout risks
- flaky or brittle tests
- accidental unrelated changes

## Finding format

Each reviewer must return:

```text
## Changeset Reviewer Report

Reviewer:
Architecture | Correctness | Regression

Status:
PASS | FINDINGS

Findings:
- Severity: CRITICAL | HIGH | MEDIUM | LOW | NIT
  File:
  Problem:
  Evidence:
  Recommended fix:

Critical findings:
Number

Non-critical findings:
Number
```

A `CRITICAL` finding means the work should not go to human review until fixed or explicitly escalated as blocked.

## Fixer behavior

After the three reports are collected, the fixer should:

1. Prioritize `CRITICAL` findings.
2. Fix `HIGH` findings when safe and directly related.
3. Avoid broad refactors.
4. Avoid changing the approved goal, technical plan, or public behavior without approval.
5. Avoid changing tests merely to match incorrect behavior.
6. Run relevant checks after fixes.
7. Preserve a short iteration report.

## Iteration report

After each iteration, produce:

```text
## Changeset Review Iteration

Iteration:
1 | 2 | 3

Reviewer summary:
- Architecture:
- Correctness:
- Regression:

Critical findings before fix:
Number

Fixes applied:
- Fix 1
- Fix 2

Checks run:
- Command/result

Critical findings remaining:
Number

Continue loop:
yes/no
Reason:
```

## Stop conditions

Stop when either:

1. all reviewers report zero `CRITICAL` findings, or
2. three iterations have completed.

If three iterations complete and `CRITICAL` findings remain, mark the work as blocked and do not present it as ready for human approval.

## Final changeset review summary

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
