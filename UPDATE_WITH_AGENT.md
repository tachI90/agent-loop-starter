# Update Agent Loop Starter in an Existing Repository

Use this prompt when a repository already has an older version of Agent Loop Starter installed.

The update should be performed by an agent, not by a blind copy script, because existing repositories often have local modifications, project-specific checks, and custom agent instructions.

```text
You are updating an existing Agent Loop Starter installation in this repository.

Source starter repository:
<PASTE_OR_REFERENCE_THE_AGENT_LOOP_STARTER_REPO_PATH_OR_URL_HERE>

Target repository:
<THIS_REPOSITORY>

Your task is to update the installed Agent Loop Starter files carefully.

Important constraints:

- Do not blindly overwrite existing files.
- Preserve local project-specific instructions.
- Preserve local modifications to AGENTS.md, CLAUDE.md, Cursor rules, Pi settings, and existing skills.
- Do not create or overwrite a local skill named `grill-me`.
- Keep `grill-me` reserved for the real upstream skill.
- Do not change application code during this update.
- Do not replace project check commands unless they are still placeholders or clearly outdated.
- Do not remove custom project checks from `scripts/agent/check.sh`.
- Ask before deleting or replacing any human-written local customization.

Update goals:

1. Bring the installed loop up to the latest Agent Loop Starter workflow.
2. Preserve existing project-specific guidance.
3. Add any missing skills, rules, docs, prompts, and subagents.
4. Update older starter files when they match a known previous template.
5. Report every conflict and local customization.

Latest expected workflow:

1. Grill Gate
2. Goal Contract
3. Human Goal Approval
4. Technical Implementation Plan
5. Human Plan Approval
6. Loop Execution Contract, if repeated autonomous iterations are needed
7. Implementation / Check / Fix Loop
8. Project Checks
9. Verifier Review
10. Changeset Review Loop
11. Human Review and Approval
12. Pull Request Creation, unless skipped

Files to check and update or add:

Portable core:

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

Cursor adapter, if installed or requested:

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
- `.cursor/agents/changeset-fixer.md`
- `.cursor/skills/*`
- `.cursor/hooks.json`
- `scripts/cursor/check.sh`

Pi adapter, if installed or requested:

- `.pi/settings.json`
- `.pi/skills/*`

Update process:

1. Inspect current installation.
   - List existing agent instruction files.
   - Identify installed Agent Loop Starter files.
   - Detect whether Cursor and/or Pi adapters are present.
   - Check whether existing files look unmodified, modified from starter, or fully custom.

2. Compare against the latest starter templates.
   - Use the source starter repository as the reference.
   - For files that are unchanged older starter templates, update directly.
   - For files with local changes, merge carefully.
   - For missing new files, add them.

3. Preserve project-specific configuration.
   - Preserve `scripts/agent/check.sh` project commands.
   - Preserve repository-specific architecture, coding, testing, and PR guidance.
   - Preserve existing hooks and settings where they do not conflict.
   - Preserve existing custom skills.

4. Update the workflow language.
   Ensure the installed workflow includes:
   - Strict Grill Gate
   - Goal Contract approval
   - Detailed Technical Implementation Plan approval
   - Loop Execution Contract for repeated work
   - Anti-spin guardrails
   - Verifier Review
   - Changeset Review Loop with three reviewers and one fixer
   - Human Review and Approval
   - Pull Request Creation after human approval, skippable by user request

5. Verify no local `grill-me` skill was introduced.
   - Search for local `grill-me` files.
   - If a real existing `grill-me` skill is present, report it and do not overwrite it.

6. Verify scripts.
   - Ensure shell scripts are executable.
   - Run shell syntax checks when applicable.
   - Run `bash scripts/agent/find-skill.sh grill-me || true`.
   - Run `bash scripts/agent/check.sh` if configured.

7. Final report.
   Include:
   - files added
   - files updated
   - files preserved unchanged
   - local customizations preserved
   - conflicts found
   - adapter status: portable core / Cursor / Pi
   - whether real `grill-me` was found
   - check commands run
   - check results
   - remaining manual decisions

If there are conflicts that could change project behavior, stop and ask before applying those changes.
```
