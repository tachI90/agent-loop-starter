# Contributing

Thanks for improving Agent Loop Starter.

## Development guidelines

This repository is intentionally simple:

- Keep templates plain-text and easy to copy.
- Avoid tool-specific assumptions in the portable core.
- Keep agent-specific behavior inside adapter folders.
- Do not create a local skill named `grill-me`; reserve that name for the real upstream skill.
- Prefer explicit instructions over clever automation.

## Validation

Run:

```bash
bash -n templates/portable-core/scripts/agent/check.sh
bash -n templates/portable-core/scripts/agent/find-skill.sh
bash -n templates/cursor-adapter/scripts/cursor/check.sh
```

Also confirm:

```bash
find templates -path '*grill-me*' -print
```

should return nothing.
