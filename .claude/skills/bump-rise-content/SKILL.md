---
name: bump-rise-content
description: Upgrade @articulate/rise-content dependencies across Rise repositories and create pull requests for each repository.
---

# Rise Content Version Bump

Upgrade `@articulate/rise-content` packages to a specified version across the Rise repositories.

## Arguments

Expected input: a version such as `1.72.0`. Use `^{version}` when updating package ranges.

## Target Repositories

Process these repositories sequentially, one at a time. All are under `~/src/`.

1. `rise-frontend`
2. `rise-runtime`
3. `rise-packages`
4. `rise-label-sets`
5. `rise-authoring-dashboard`
6. `learn-distribution-frontend`

## Workflow Per Repository

1. Navigate to the repository directory.
2. Run `git fetch`.
3. Check for unstaged or untracked changes with `git status`.
4. If there are modified or untracked files, stop and report them; wait for the user before continuing.
5. Create branch `rise-content-bump` from `origin/main`.
6. Read `package.json` to identify all `@articulate/rise-content*` dependencies and determine the package manager from `packageManager`; if absent, fall back to lock files.
7. Upgrade all found Rise Content packages to `^{version}` using the detected package manager.
8. Run typecheck if `check` or `lint:typecheck` exists in `package.json`.
9. Run `docker compose build` in the background and do not wait for completion.
10. Commit with:

```text
Upgrade @articulate/rise-content dependencies to ^{version}

Updates all rise-content packages to version {version} to include latest fixes and features.
```

11. Push `rise-content-bump` and create a PR with title `chore: Upgrade @articulate/rise-content dependencies to ^{version}`.
12. In the PR body, include a summary listing the Rise Content packages found in that repo. Do not include a test plan section.

## Notes

- Process repos sequentially.
- Always determine package manager dynamically.
- Skip repos with no Rise Content dependencies.
- Report PR URLs as each is created.

## Example Invocation

```
/bump-rise-content 1.72.0
```

This will upgrade all repos to `^1.72.0` following the workflow above.
