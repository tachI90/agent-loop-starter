# Skill Library

The loop is orchestration. Skills are the reusable assets inside it.

## Rule

If you do something hard once, turn the successful method into a named skill.

## Good skill candidates

- requirement grilling
- goal writing
- technical planning
- verifier review
- migration planning
- UI prototype parity checks
- API contract review
- schema design
- release notes
- PR review
- production error triage
- flaky test investigation

## Skill quality checklist

A good skill has:

- a clear trigger
- a clear output format
- stop conditions
- constraints
- examples
- verification guidance
- failure mode handling

## Skill naming

Do not shadow widely used upstream skills.

This starter intentionally does not ship a local `grill-me` skill. It ships `requirements-grill-lite` as a fallback.
