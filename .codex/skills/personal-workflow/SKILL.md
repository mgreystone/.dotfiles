---
name: personal-workflow
description: Applies Markus's personal Codex working preferences for package management, documentation lookup, secrets, and command discipline.
---

# Personal Workflow

Use this skill when the user asks to apply personal working preferences, port Claude behavior, choose package-management commands, or document setup/configuration steps.

## Documentation First

When the user requests code examples, setup or configuration steps, or library/API documentation, check official docs or Context7 first when available.

## Package Management

- Check `package.json` for the `packageManager` field before adding, removing, or updating dependencies.
- Use the specified package manager and workspace-aware commands.
- Do not edit `package.json` directly to change dependencies when a package manager command can do it.
- If no package manager is declared, inspect lock files; if still ambiguous and the choice matters, ask.

## Safety

- Do not read `.env` files unless the user explicitly asks and the active permissions allow it.
- Avoid commands that download and execute arbitrary packages unless the project already uses that tool and the command is necessary.
- Preserve user changes and unrelated local work.

## RTK

Claude used an `rtk hook claude` pre-tool hook. Do not assume Codex has an equivalent hook. Use `rtk` directly only when the user asks for RTK analytics or proxy behavior.
