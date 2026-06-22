# Agent Loop Starter

A portable, multi-agent AI engineering workflow starter for software repositories.

It adds a disciplined loop for agents like Cursor, Codex, Pi, and other tools that read `AGENTS.md` or support Agent Skills.

The loop is designed to prevent shallow planning and premature implementation:

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

## What this gives you

- A portable `AGENTS.md` workflow.
- Reusable Agent Skills.
- Cursor rules, skills, hooks, verifier subagent, changeset reviewer subagents, and fixer subagent.
- Pi-compatible skills/settings.
- Codex-compatible `.agents/skills` structure.
- A project-specific verification scaffold.
- A helper to discover whether the real `grill-me` skill exists globally or in project scope.
- A loop guardrail model with iteration caps, budgets, no-progress detection, and escalation.
- A durable loop-state template so long-running work can resume after interruption.
- A pre-human-review Changeset Review Loop with three reviewer perspectives and a fixer pass.
- Optional post-approval pull request creation with `gh` or `bkt`.
- Clear install prompts for agents.

## Core principles

### 1. Grill before planning

For non-trivial work, the agent must ask at least one material question before creating a goal or plan unless you explicitly say to skip grilling.

### 2. Approve the goal before the plan

Goal approval answers:

```text
Are we solving the right problem?
```

Plan approval answers:

```text
Is this a good technical design and implementation path?
```

### 3. Require a technical plan

The Technical Implementation Plan must include architecture pattern, pitfalls, possible regressions, interfaces, schemas, flows, diagrams, tests, and exact implementation steps.

### 4. Loop until the goal is reached

The loop does not end because code changed or tests passed. It ends when the approved Goal Contract is satisfied or the agent explains why it is blocked.

### 5. Verify against the goal and the plan

The verifier checks the approved Goal Contract and Technical Implementation Plan, not just the code diff.

### 5.5 Review the changeset before human review

Before final human review, three independent changeset reviewers inspect the diff: Architecture, Correctness, and Regression. A fixer pass addresses findings. The loop repeats until no `CRITICAL` findings remain or three iterations are reached.


### 6. Bound the loop

Any autonomous or repeated loop needs explicit stops:

- max iterations
- no-progress detection
- repeated-failure detection
- flip-flop detection
- budget ceiling
- human escalation path

### 7. Create the pull request after approval

After human approval, the agent should create a pull request automatically with `gh` or `bkt` when available. This step is skipped when the user asks to skip PR creation.

### 8. Treat skills as the reusable unit

The loop is orchestration. The reusable asset is the named skill it calls. Hard things should become skills after they are solved once.

## Repository structure

```text
.
├── README.md
├── LICENSE
├── CHANGELOG.md
├── CONTRIBUTING.md
├── .github/
│   └── workflows/
│       └── validate.yml
├── docs/
│   ├── architecture.md
│   ├── installation.md
│   ├── workflow.md
│   ├── loop-patterns.md
│   ├── loop-guardrails.md
│   ├── changeset-review-loop.md
│   ├── pull-request-creation.md
│   ├── skill-library.md
│   └── agents/
│       ├── codex.md
│       ├── cursor.md
│       └── pi.md
├── prompts/
│   ├── generic-install.md
│   ├── codex-install.md
│   ├── cursor-install.md
│   ├── pi-install.md
│   ├── install-in-existing-repo.md
│   └── update-existing-install.md
├── INSTALL_WITH_AGENT.md
├── UPDATE_WITH_AGENT.md
└── templates/
    ├── portable-core/
    │   ├── AGENTS.md
    │   ├── .agents/skills/
    │   ├── scripts/agent/
    │   └── docs/
    ├── cursor-adapter/
    │   ├── .cursor/
    │   └── scripts/cursor/
    └── pi-adapter/
        └── .pi/
```

## Quick install into a repo

Use an agent to install this starter. This is the recommended path because installation usually requires merging existing `AGENTS.md`, Cursor rules, Pi settings, skills, and project-specific check commands.

Open the target repo in your coding agent and give it this prompt:

```text
Install Agent Loop Starter into this repository.

Use the install instructions from:
INSTALL_WITH_AGENT.md

Install the portable core.
Install the Cursor adapter only if this repo uses Cursor.
Install the Pi adapter only if this repo uses Pi.
Merge existing instructions carefully.
Do not overwrite a local grill-me skill.
Configure scripts/agent/check.sh using this repo's real check commands.
Run scripts/agent/find-skill.sh grill-me and scripts/agent/check.sh.
Report all files changed and any conflicts.
```

The full prompt lives in:

```text
INSTALL_WITH_AGENT.md
prompts/install-in-existing-repo.md
```

`check.sh` is intentionally a scaffold. The installing agent should inspect the target repo and configure `scripts/agent/check.sh` with real commands.

## Update an existing installation

Use an agent to update repos that already have an older Agent Loop Starter installed. This lets the agent preserve local customizations while adding new workflow pieces.

Open the target repo in your coding agent and give it this prompt:

```text
Update the existing Agent Loop Starter installation in this repository.

Use the update instructions from:
UPDATE_WITH_AGENT.md

Preserve local project-specific guidance and check commands.
Do not overwrite grill-me.
Add missing latest skills, rules, docs, and subagents.
Merge changes carefully and report conflicts.
```

The full update prompt lives in:

```text
UPDATE_WITH_AGENT.md
prompts/update-existing-install.md
```

## Install manually

Copy this into your target repo:

```text
templates/portable-core/*
```

For Cursor, also copy:

```text
templates/cursor-adapter/*
```

For Pi, also copy:

```text
templates/pi-adapter/*
```

Then make scripts executable:

```bash
chmod +x scripts/agent/check.sh
chmod +x scripts/agent/find-skill.sh
chmod +x scripts/cursor/check.sh 2>/dev/null || true
```

## Give this to your agent

Use the main installer prompt:

- [`INSTALL_WITH_AGENT.md`](INSTALL_WITH_AGENT.md)
- [`prompts/install-in-existing-repo.md`](prompts/install-in-existing-repo.md)

For updating an existing installation:

- [`UPDATE_WITH_AGENT.md`](UPDATE_WITH_AGENT.md)
- [`prompts/update-existing-install.md`](prompts/update-existing-install.md)

Agent-specific variants are also available:

- [`prompts/codex-install.md`](prompts/codex-install.md)
- [`prompts/cursor-install.md`](prompts/cursor-install.md)
- [`prompts/pi-install.md`](prompts/pi-install.md)

## The real `grill-me` skill

This starter intentionally does **not** create a local skill named `grill-me`.

The name `grill-me` should be reserved for the real skill from Matt Pocock's skills repository.

This starter provides a fallback named:

```text
requirements-grill-lite
```

The workflow is:

```text
real grill-me found in project/user/global/admin/system scope → use real grill-me
real grill-me unavailable                                    → use requirements-grill-lite
skills unavailable                                           → use inline fallback protocol from AGENTS.md
```

## License

MIT.


## What changed after loop research

The starter now distinguishes three loop modes:

```text
Goal     → run until a verifiable condition is true
Loop     → repeat while supervised or while the session is active
Routine  → scheduled/background loop with durable state and escalation
```

It also adds a **Loop Execution Contract** for repeated autonomous work:

```text
Max iterations:
Budget:
No-progress rule:
Repeated-failure rule:
Flip-flop rule:
State file:
Escalation path:
```

The core lesson: the loop is not the magic. The feedback and stop conditions inside the loop are.
