---
name: writing-commits
description: Writes git commit messages following Conventional Commits and the 50/72 rule. Use when generating, drafting, or rewriting commit messages — including for staged changes, amended commits, or suggestions during a commit workflow.
---

# Writing Commits

Write commit messages that follow [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/) and the 50/72 rule.

## Format

```
<type>(<scope>)?(!)?: <subject>

<body>?
```

`?` = optional, `!` = breaking change. A blank line separates subject from body.

## Rules

**Subject**
- ≤ 50 characters total (including type and scope)
- Imperative mood ("add", not "added" or "adds"), no trailing period
- House style: lowercase after the colon
- `type` is one of: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`
- `scope` is optional; use it only when it genuinely narrows the subject
- Breaking change: append `!` before the colon (e.g. `feat(api)!: drop v1 endpoints`)

**Body — optional and discouraged**
- Omit the body unless the subject is an insufficient summary
- A body earns its place only when it adds information the subject cannot carry: *why* the change was made, a non-obvious constraint, or a user-visible behavior change
- Never describe *what* the diff does — the diff already shows that
- Never include implementation details (file names, function names, variable names, refactor mechanics, line counts)
- Never restate the subject
- Wrap lines at 72 characters

**Footers** (optional)
- `BREAKING CHANGE: <description>` for breaking changes, or
- `Refs: #123`, `Closes: #123`

## Process

1. Read the staged diff (`git diff --cached`) to understand the change
2. Pick the `type` based on intent, not the files touched
3. Draft a subject in the imperative mood. If it reads long, cut filler words ("the", "a", "that") before abbreviating
4. Ask: "Does the subject fully convey why this change matters?" If yes, stop. If no, add a body focused on *why*
5. Verify against the Rules above

## Examples

**Subject-only (preferred)**

```
fix(auth): reject expired refresh tokens
```

```
feat: add dark mode toggle
```

```
refactor: extract retry logic into shared module
```

**Subject + body (only when subject is insufficient)**

```
fix(api): return 409 on duplicate signup

Clients were retrying on the previous 500, creating duplicate
audit events. 409 lets them distinguish "already exists" from
a transient failure.
```

**Breaking change**

```
feat(api)!: require auth on /metrics

BREAKING CHANGE: /metrics now returns 401 without a bearer token.
Dashboards must send the service account credential.
```

## Anti-patterns

- `fix: fixed bug in getUserById where null was not handled` — implementation detail, past tense, over 50 chars
- `chore: update stuff` — vague, no information
- Body that lists changed files or functions
- Body that paraphrases the subject
- Subject ending with a period