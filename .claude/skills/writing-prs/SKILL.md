---
name: writing-prs
description: Drafts and creates pull requests interactively. Use when generating PR titles, descriptions, implementation overviews, test instructions, issue or dependency notes, or when the user asks to open/create a PR. Requires explicit user approval before creating a PR.
---

# Writing PRs

Create pull requests through an interactive drafting workflow. Generate PR content from the current session context, repository conventions, branch, diff, commits, and user input; then iterate with the user until they explicitly approve PR creation.

## Required Output

Draft these fields, adapted to the selected repository PR template:

- **Title**: Conventional Commit format.
- **Issues / Dependencies**: Top section when applicable. Include linked issues, depending PRs, prerequisite merges, rollout notes, or follow-ups. Omit this section entirely when not applicable.
- **Description**: One paragraph describing the high-level purpose of the change.
- **Implementation**: Brief overview of the main implementation details.
- **Testing**: Practical test instructions, including commands already run and any manual checks.

## Process

1. Inspect repository state:
   - Current branch: `git branch --show-current`
   - Changed files: `git status --short`
   - Diff against the likely base branch, preferring the PR base if known.
   - Recent commits if the branch contains multiple commits.
2. Find repository PR templates before drafting:
   - Check common locations such as `.github/pull_request_template.md`, `.github/PULL_REQUEST_TEMPLATE.md`, `.github/PULL_REQUEST_TEMPLATE/`, `docs/`, and repository-specific contribution docs.
   - If there is one clear best template, use it.
   - If multiple templates are plausible or the correct choice is unclear, ask the user which template to use before drafting the final PR body.
   - Preserve the selected template's section names, prompts, checklist items, and ordering unless the user asks to revise them.
3. Ask early for missing issue links and depending PRs. If the user says there are none or they are not applicable, omit the section instead of writing `None`.
4. Infer a conventional PR title from the intent of the change, not just the files touched.
5. Draft the required fields from all available evidence:
   - The current conversation/session context.
   - User-provided intent, constraints, and decisions.
   - Code changes, commit history, and repository conventions.
   - Test output and manual verification performed in the session.
6. Present the draft and ask what to change. Iterate until the user says the wording is approved.
7. Before creating the PR, ask for explicit approval with clear language such as: `Approve creating this PR?`
8. Create the PR only after the user explicitly approves. Ambiguous responses, silence, or approval of the text alone are not approval to create the PR.

## Drafting Rules

**Title**

- Must follow Conventional Commits:
  `<type>(<scope>)?(!)?: <subject>`
- Use one of: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`.
- Use imperative mood, lowercase after the colon, and no trailing period.
- Keep it concise; prefer <= 72 characters for PR readability.
- Mark breaking changes with `!` only when the diff or user context supports it.

**Issues / Dependencies**

- Put this first in the PR body when applicable.
- Prompt specifically for:
  - Issue IDs or URLs this PR closes, fixes, or references.
  - Depending PRs that must merge first.
  - Related follow-up PRs when relevant.
- Do not invent issue links or dependencies.
- Omit the section entirely when the user confirms it is not applicable.

**Description**

- Single paragraph.
- Explain the purpose and user or system value.
- Use session context to capture the reason behind the change, not only what appears in the diff.
- Avoid file-by-file summaries and low-level mechanics.

**Implementation**

- Brief bullets are preferred unless the template requires another format.
- Summarize notable code paths, data flow, UI behavior, migrations, configuration, or integration changes.
- Include risk-relevant details without overwhelming the PR.

**Testing**

- Include exact commands run when known.
- Include manual verification steps when useful.
- If tests were not run, state that plainly and give the most relevant instructions for the reviewer.

## Creating The PR

Prefer the repository's established PR tooling. If there is no local convention, use `gh pr create` when available.

Before running the create command:

- Confirm the target base branch.
- Confirm the selected PR template.
- Confirm the final title and body.
- Confirm issues and dependencies are included or omitted correctly.
- Ask for explicit creation approval.

Do not create a PR from a dirty worktree without calling out uncommitted changes and confirming the intended scope with the user.

## Fallback PR Body

Use this only when the repository has no applicable PR template. Omit the first section when there are no issues or dependencies.

```markdown
## Issues / Dependencies
- <issue, depending PR, rollout note, or follow-up>

## Description
<single paragraph>

## Implementation
- <brief detail>
- <brief detail>

## Testing
- <command or manual check>
```
