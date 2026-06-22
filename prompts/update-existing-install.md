# Update Agent Loop Starter in an Existing Repository

Use this prompt when a repository already has an older version of Agent Loop Starter installed.

```text
You are updating an existing Agent Loop Starter installation in this repository.

Source starter repository:
<PASTE_OR_REFERENCE_THE_AGENT_LOOP_STARTER_REPO_PATH_OR_URL_HERE>

Target repository:
<THIS_REPOSITORY>

Update the installed Agent Loop Starter carefully.

Rules:

- Do not blindly overwrite existing files.
- Preserve local project-specific instructions.
- Preserve local modifications to AGENTS.md, CLAUDE.md, Cursor rules, Pi settings, and skills.
- Do not create or overwrite a local skill named `grill-me`.
- Do not change application code.
- Do not replace project check commands unless they are placeholders or clearly outdated.
- Do not remove custom project checks from `scripts/agent/check.sh`.
- Ask before deleting or replacing human-written local customization.

Latest workflow to install or merge:

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

Update process:

1. Inspect the current installation.
   - List existing agent instruction files.
   - Identify installed Agent Loop Starter files.
   - Detect Cursor and Pi adapters.
   - Classify files as unmodified starter, locally modified starter, or custom.

2. Compare against latest templates.
   - Update unmodified older starter files directly.
   - Merge locally modified starter files carefully.
   - Add missing new files and skills.

3. Preserve project-specific configuration.
   - Preserve project check commands.
   - Preserve architecture, coding, testing, and PR guidance.
   - Preserve custom hooks, settings, and skills.

4. Add missing latest components.
   - `changeset-review-loop`
   - `pull-request-creator`
   - Cursor changeset reviewer subagents, if Cursor is installed
   - Cursor changeset fixer subagent, if Cursor is installed
   - update and PR documentation

5. Verify.
   - Ensure no local `grill-me` fallback was added.
   - Run `bash scripts/agent/find-skill.sh grill-me || true`.
   - Run `bash scripts/agent/check.sh` if configured.
   - Run shell syntax checks for installed shell scripts.

6. Report.
   Include files added, files updated, files preserved, local customizations preserved, conflicts, adapter status, whether real `grill-me` was found, checks run, check results, and remaining manual decisions.

If a conflict could change project behavior, stop and ask before applying it.
```
