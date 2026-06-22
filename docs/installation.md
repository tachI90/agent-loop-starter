# Installation

The recommended way to install Agent Loop Starter is to give an agent explicit install instructions.

This is better than a shell installer because the agent can:

- inspect the target repository
- preserve existing instructions
- merge `AGENTS.md`
- avoid overwriting existing skills
- choose the right adapters
- configure `scripts/agent/check.sh` from real project scripts and CI
- report conflicts

## Agent install

Open the target repository in your coding agent.

Give it this prompt:

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

For the full detailed prompt, use:

```text
INSTALL_WITH_AGENT.md
prompts/install-in-existing-repo.md
```

## Updating an existing installation

If the target repository already has an older Agent Loop Starter installed, use the update prompt instead of the install prompt.

```text
UPDATE_WITH_AGENT.md
prompts/update-existing-install.md
```

See [`docs/updating.md`](updating.md) for the full update process.

## Manual install

Copy the portable core:

```bash
cp -R templates/portable-core/. /path/to/target/repo/
```

For Cursor:

```bash
cp -R templates/cursor-adapter/. /path/to/target/repo/
```

For Pi:

```bash
cp -R templates/pi-adapter/. /path/to/target/repo/
```

Then make scripts executable:

```bash
cd /path/to/target/repo
chmod +x scripts/agent/check.sh
chmod +x scripts/agent/find-skill.sh
chmod +x scripts/cursor/check.sh 2>/dev/null || true
```

## Required post-install step

Configure:

```text
scripts/agent/check.sh
```

This file is a scaffold. Replace the placeholder in `run_project_checks()` with the real commands for your repo.

Examples:

```bash
run_check "Format" pnpm fmt:check
run_check "Lint" pnpm lint
run_check "Tests" pnpm test
run_check "Build" pnpm build
```

```bash
run_check "PHPUnit" vendor/bin/phpunit
run_check "PHPStan" vendor/bin/phpstan analyse
run_check "Pint" vendor/bin/pint --test
```

## Verify installation

```bash
bash scripts/agent/find-skill.sh grill-me || true
bash scripts/agent/check.sh
```
