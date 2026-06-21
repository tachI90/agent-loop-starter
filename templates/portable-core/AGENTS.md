# Agent workflow for this repository

These instructions are for AI coding agents working in this repository.

## Default loop

For meaningful code changes:

1. Complete the Grill Gate.
2. Create the Goal Contract.
3. Get human approval for the Goal Contract.
4. Create the Technical Implementation Plan.
5. Get human approval for non-trivial Technical Implementation Plans.
6. Create a Loop Execution Contract when work may require repeated autonomous iterations.
7. Implement the smallest correct change.
8. Continue the implementation/check/fix loop until the approved goal is reached or you are blocked.
9. Run relevant checks.
10. Use the verifier before claiming completion.
11. Prepare the change for human diff review.

## Strict Grill Gate

For non-trivial work, complete the Grill Gate before creating a Goal Contract or Technical Implementation Plan.

A change is non-trivial if it includes:

- multiple files
- product behavior changes
- architecture or data model changes
- auth, billing, payments, permissions, persistence, or deployment logic
- migrations
- public APIs
- broad refactors
- unclear requirements
- meaningful risk or trade-offs

For non-trivial work, ask at least one material question before creating the Goal Contract or Technical Implementation Plan unless the user explicitly says to skip grilling.

Before any Goal Contract or Technical Implementation Plan, produce:

```text
## Grill Gate

Status: QUESTIONS_NEEDED | SKIPPED_WITH_REASON

Question 1:
Recommended default:
Why this matters:
```

If `Status: QUESTIONS_NEEDED`, stop and wait for the user's answer.

Only use `SKIPPED_WITH_REASON` if the user explicitly asked to skip grilling, the task is trivial, or the task already includes clear requirements, non-goals, acceptance criteria, and test expectations.

## Goal Contract Gate

For non-trivial work, create a Goal Contract after the Grill Gate and before the Technical Implementation Plan.

Do not create a Technical Implementation Plan until the user approves the Goal Contract.

The Goal Contract must include:

```text
## Goal Contract

Goal:
The user-visible or system behavior that should be true when this is done.

Acceptance criteria:
- Criterion 1
- Criterion 2
- Criterion 3

Non-goals:
- What should not be changed
- What should not be solved now

Verification signals:
- Tests/checks that prove the goal was reached
- Manual checks, if needed

Stop condition:
The loop is complete only when all acceptance criteria pass, or the agent reports why they cannot be completed.
```

Goal approval means: "Are we solving the right problem?"

## Technical Implementation Plan Gate

For non-trivial work, the Technical Implementation Plan must be detailed enough for another engineer or agent to execute without rediscovering the architecture.

Do not produce sparse plans.
Do not produce only a high-level checklist.
Do not start implementation until the user approves the Technical Implementation Plan.

The Technical Implementation Plan must include:

```text
## Technical Implementation Plan

Approved goal summary:
- Goal:
- Acceptance criteria:
- Non-goals:

Architecture pattern:
- Existing pattern being followed:
- Why this pattern fits this change:
- Alternatives considered and rejected:

Technical approach:
- Step-by-step implementation flow:
- Important sequencing constraints:
- Transaction/data consistency considerations:

Files and responsibilities:
- File/path: responsibility and expected change
- File/path: responsibility and expected change

Interfaces and schemas:
- Types/interfaces to add or change
- Function signatures to add or change
- API request/response shapes
- Database/schema/migration changes, if any
- Validation rules and typed errors

Data and control flow:
- Mermaid flowchart showing the main data/control path.

Sequence or lifecycle flow:
- Mermaid sequence diagram when multiple actors/boundaries are involved.

Edge cases and pitfalls to avoid:
- Pitfall 1
- Pitfall 2
- Pitfall 3

Possible regressions:
- Regression risk 1
- Regression risk 2
- Existing behavior that must not change

Testing and verification plan:
- Unit tests:
- Integration tests:
- UI/prototype checks, if UI changes are visible:
- Manual checks:
- Commands to run:

Implementation steps:
1. Step one with exact target files
2. Step two with exact target files
3. Step three with exact target files

Open questions:
- Question or "None"
```

If any section is not applicable, explicitly write `Not applicable` and explain why.

Interfaces, schemas, migrations, API contracts, validation rules, and typed errors must be defined upfront when relevant.

Plan approval means: "Is this a good technical design and implementation path?"


## Loop Execution Contract Gate

If work may require repeated autonomous iterations, background execution, scheduled execution, or more than one implementation/check/fix pass, create a Loop Execution Contract before starting implementation.

The Loop Execution Contract must include:

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

Do not run unbounded loops.
Do not run background routines without durable state and an escalation path.
Do not let the worker be the only judge of completion.

## Skill policy

Use these skills when available:

- `ai-engineering-loop`
- `discover-agent-skills`
- `grill-me`, when the real upstream skill exists
- `requirements-grill-lite`, only as fallback
- `verifier`
- `loop-orchestrator`
- `anti-spin-guard`
- `configure-project-checks`

This repository intentionally does not define a local skill named `grill-me`.

Before deciding `grill-me` is unavailable, search project, ancestor, user/global, admin, system, and configured skill scopes.

If available, run:

```bash
bash scripts/agent/find-skill.sh grill-me
```

## Verification gate

After meaningful code changes, use a verifier.

The verifier must check the implementation against the approved Goal Contract, the approved Technical Implementation Plan, and the Loop Execution Contract when one exists.

The verifier must also flag no-progress loops, repeated failures, flip-flopping between approaches, or missing budget/iteration caps.

## Local checks

Use this command:

```bash
bash scripts/agent/check.sh
```

Important: `scripts/agent/check.sh` is a scaffold. Configure it for this repository.

## Final response format

When finishing implementation work, include:

- Summary
- Approved goal status
- Acceptance criteria status
- Files changed
- Checks run
- Verifier result
- Remaining risks
- Whether it is ready for human review
