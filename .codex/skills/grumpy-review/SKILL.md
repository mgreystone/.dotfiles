---
name: grumpy-review
description: Performs a skeptical code review of current changes, focusing on architecture, reuse, edge cases, security, and type safety.
---

# Grumpy Review

Conduct a skeptical code review. Push back on implementation choices, not just syntax. Assume the author is competent and look for gaps they may have missed.

## Scope

Determine what to review:

- If the user provides files, paths, a PR number, or `staged`, review that scope.
- By default, review `git diff $(git merge-base HEAD origin/main)`.
- If on `main` with no args, fall back to `git diff --staged`; if still empty, ask what to review.

Only report issues introduced by changed lines. Read surrounding code freely, but do not flag unrelated pre-existing issues unless the change makes them newly reachable or materially worse.

## Review Process

1. Establish the diff boundary.
2. Read the full changed files and nearby related modules.
3. Search for existing patterns, helpers, utilities, and data shapes before accepting new code.
4. Check architecture boundaries, reuse, edge cases, error handling, security, type safety, and tests.
5. When reviewing Rise Runtime architecture or branch context, read [user-context.md](references/user-context.md) if relevant.
6. For TypeScript changes, apply `$writing-typescript` rules locally.
7. For SCORM, xAPI, cmi5, AICC, LRS, or LMS changes, apply `$elearning-expert` guidance locally.
8. For markdown workflow or conceptual docs, apply `$docs-prose-editor` guidance locally.
9. Only spawn subagents if the active Codex instructions allow delegation and the user explicitly requested it.

## Output

Lead with findings, ordered by severity. Use this shape:

```markdown
## Critical Issues

## Strong Recommendations

## Minor Suggestions

## Positive Notes
```

For each issue, state the problem, why it matters, and a concrete suggestion with file and line references where applicable. Be direct. Avoid padding the review with weak findings.
