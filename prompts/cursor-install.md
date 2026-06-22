# Cursor Install Prompt

Use this prompt with a coding agent that has access to:

1. this Agent Loop Starter repository, and
2. the target repository where the workflow should be installed.

The agent should install by inspecting and merging files, not by blindly overwriting.

```text
You are installing Agent Loop Starter into this repository.

Source starter repository:
<PASTE_OR_REFERENCE_THE_AGENT_LOOP_STARTER_REPO_PATH_OR_URL_HERE>

Target repository:
<THIS_REPOSITORY>

Your task is to install the starter carefully.

Core behavior to install:

1. Strict Grill Gate
2. Goal Contract
3. Human Goal Approval
4. Detailed Technical Implementation Plan
5. Human Plan Approval
6. Loop Execution Contract for repeated autonomous work
7. Implementation/check/fix loop until the approved goal is reached or blocked
8. Verifier review against the approved goal, technical plan, and loop contract
9. Changeset Review Loop before human review
10. Human approval
11. Pull request creation after approval, unless skipped

Important constraints:

- Do not blindly overwrite existing instructions.
- Preserve existing AGENTS.md / CLAUDE.md / Cursor rules / Pi settings / project instructions.
- Merge carefully and report conflicts.
- Ask before replacing conflicting human-written instructions.
- Do not create or overwrite a local skill named `grill-me`.
- Keep `grill-me` reserved for the real upstream skill.
- Install `requirements-grill-lite` only as the fallback skill.
- Do not change application code during installation.
- Do not invent project check commands.
- Configure `scripts/agent/check.sh` only after inspecting the repo's real scripts and CI.
- Prefer commands already used by CI or documented in the repo.

Install the portable core:

- `AGENTS.md`
- `.agents/skills/ai-engineering-loop/SKILL.md`
- `.agents/skills/requirements-grill-lite/SKILL.md`
- `.agents/skills/verifier/SKILL.md`
- `.agents/skills/configure-project-checks/SKILL.md`
- `.agents/skills/discover-agent-skills/SKILL.md`
- `.agents/skills/loop-orchestrator/SKILL.md`
- `.agents/skills/anti-spin-guard/SKILL.md`
- `.agents/skills/changeset-review-loop/SKILL.md`
- `.agents/skills/pull-request-creator/SKILL.md`
- `scripts/agent/check.sh`
- `scripts/agent/find-skill.sh`
- `docs/ai-loop.md`

If this repository uses Cursor, also install or merge:

- `.cursor/rules/engineering-loop.mdc`
- `.cursor/rules/grill-before-build.mdc`
- `.cursor/rules/plan-approval.mdc`
- `.cursor/rules/auto-verifier.mdc`
- `.cursor/rules/changeset-review-loop.mdc`
- `.cursor/rules/repo-checks.mdc`
- `.cursor/agents/verifier.md`
- `.cursor/agents/changeset-reviewer-architecture.md`
- `.cursor/agents/changeset-reviewer-correctness.md`
- `.cursor/agents/changeset-reviewer-regression.md`
- `.cursor/agents/changeset-fixer.md
- `.cursor/skills/*`
- `.cursor/hooks.json`
- `scripts/cursor/check.sh`

If this repository uses Pi, also install or merge:

- `.pi/settings.json`
- `.pi/skills/*`

Installation process:

1. Inspect the target repository.
   - List existing agent instruction files.
   - Check for existing `AGENTS.md`, `.agents/skills`, `.cursor`, `.pi`, `CLAUDE.md`, or similar files.
   - Check package manager, framework, test commands, and CI.

2. Decide which adapters are appropriate.
   - Always install portable core.
   - Install the Cursor adapter.
   - Install Pi adapter only if the repo uses Pi or the user asks for it.

3. Merge instructions.
   - If `AGENTS.md` exists, append or merge the Agent Loop Starter section without deleting existing repo guidance.
   - Keep project-specific rules above generic agent-loop rules when they conflict.
   - Preserve existing command lists, code style, architecture rules, and PR rules.

4. Install skills.
   - Add missing starter skills.
   - Preserve existing skills.
   - Never overwrite `grill-me`.
   - If `grill-me` already exists, report where it was found.

5. Configure `scripts/agent/check.sh`.
   - Inspect `package.json`, `pnpm-workspace.yaml`, `justfile`, `Makefile`, `composer.json`, `pyproject.toml`, README, CONTRIBUTING, and CI workflows.
   - Use real project commands.
   - Prefer one project-level command if it already exists, such as `just check`, `pnpm check`, or `make check`.
   - Remove the placeholder unconfigured-check behavior once real checks are added.
   - Keep commands explicit.

6. Make shell scripts executable:
   - `chmod +x scripts/agent/check.sh`
   - `chmod +x scripts/agent/find-skill.sh`
   - `chmod +x scripts/cursor/check.sh`, if installed

7. Verify installation.
   - Run `bash scripts/agent/find-skill.sh grill-me || true`.
   - Run `bash scripts/agent/check.sh`.
   - If checks fail because the project already has failing checks, report that honestly.
   - If checks are not configured, report that honestly.

8. Final report.
   Include:
   - files created
   - files modified
   - existing files preserved
   - adapters installed
   - whether real `grill-me` was found and where
   - check commands configured
   - commands run
   - check results
   - conflicts or assumptions
   - next manual steps
```
