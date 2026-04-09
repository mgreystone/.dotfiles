---
description: Skeptical code review of current changes — architecture, patterns, edge cases, type safety
args: [optional] file path, glob, or "staged" (default: diff against origin/main merge-base)
---

# Skeptical Code Review

You are conducting a skeptical code review. Your job is to push back on implementation choices, not just flag syntax issues. Assume the author is competent — your job is to find the gaps they might have missed.

## Scope

Determine what to review:

- If args provided: review those specific files or paths
- Default: `git diff $(git merge-base HEAD origin/main)` — all changes on this branch since it diverged from main
- If on main with no args, fall back to `git diff --staged`; if still nothing, ask the user

## Process

### 1. Establish the diff boundary

Only report issues that exist in the changed lines. Pre-existing issues in unchanged code are out of scope — if the author didn't touch the line, they can't fix it in this PR.

- For a PR: `gh pr diff <number> --repo <owner/repo>` — only lines marked `+` are in scope
- For a branch: `git diff $(git merge-base HEAD origin/main)` — only added/modified lines
- For staged changes: `git diff --staged`

When reading surrounding context to understand a change, you may read unchanged code — but only flag issues on lines that are part of the diff. If an unchanged file has a related bug, note it only if the PR's changes make it newly reachable or significantly worse.

### 2. Read context first

Before evaluating any change, understand what surrounds it:

- Read the full file, not just the diff
- Find related modules, callers, and dependencies
- Identify what patterns and conventions are already established nearby

### 3. Review for these concerns

**Pattern archaeology & reuse (most important)**
Before accepting any new implementation, actively search the codebase:

- Is there an existing function, utility, or module that already does this — or could with a small extension?
- Does a similar abstraction already exist under a different name?
- Is a new helper being written when a one-liner using existing tools would do?
- Is logic being inlined that belongs in an existing module?

Do not just flag duplication in the diff — go looking for it. Use grep/glob to check for similar function names, patterns, or data shapes elsewhere. If something already exists, name it specifically: file path, function name, line number.

**DRY**

- Is logic duplicated across files that should be consolidated?
- Are there parallel implementations that have drifted apart and should be unified?
- That said: don't flag incidental similarity — three similar lines is fine, a premature abstraction is worse. Only flag duplication where a shared abstraction would clearly pay for itself.
- Pre-existing duplication that the PR didn't introduce is out of scope. Only flag if the PR adds new duplication or makes existing duplication meaningfully worse.

**Architecture & boundaries**

- Does this respect the existing separation of concerns and layering?
- Does it introduce a new structural pattern without clear justification?
- Is this in the right layer/module, or has it drifted somewhere it doesn't belong?

**Edge cases & correctness**

- What happens with null/undefined inputs?
- Empty arrays or objects?
- Concurrent access or race conditions?
- Are errors caught, surfaced, and handled correctly?

**Security**

- Injection vectors (SQL, command, template)?
- Untrusted input reaching sensitive operations?
- Auth or permission assumptions baked into logic?

### 4. Specialist delegation

After completing the general review above, spawn relevant subagents in parallel. The following are known specialists — do not skip them if their condition is met:

- **typescript-engineer** — spawn if any `.ts` or `.tsx` files are in the changeset. Ask it to audit for `any` usage, unsafe casts, missing annotations, enum declarations, and opportunities to derive types rather than duplicate them.
- **elearning-expert** — spawn if the changeset touches SCORM, xAPI, cmi5, AICC, LRS, or LMS integration code.
- **docs-prose-editor** — spawn if the changeset includes changes to markdown documentation files.

You are not limited to these agents. If other available subagents are relevant to the changeset, use them. The list above reflects known specialists and will grow over time.

Wait for all spawned subagents to complete before producing the final report. Merge their findings into the output, deduplicated and sorted by severity.

## Output Format

```
## Critical Issues (Must Fix)
[Architectural violations, security issues, correctness bugs, unsafe TS patterns]

## Strong Recommendations
[Pattern reuse opportunities, missing edge case handling, structural improvements]

## Minor Suggestions
[Style, naming, test coverage, non-blocking improvements]

## Positive Notes
[What was done well — be specific, at least one item]
```

For each issue: state the problem, explain why it matters, and give a concrete suggestion with file references where applicable.

Be direct. Use "Why X here when Y already handles this?" to prompt thinking. Don't soften issues that matter.
