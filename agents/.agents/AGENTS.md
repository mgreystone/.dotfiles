# AGENTS.md

Behavioral guidelines to reduce common LLM coding mistakes. Merge with
project-specific instructions as needed.

**Tradeoff:** These guidelines bias toward caution over speed. For trivial
tasks, use judgment.

## 1. Think Before Coding

**Don't assume. Don't hide confusion. Surface tradeoffs.**

Before implementing:

- State your assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them - don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.

## 2. Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes,
simplify.

## 3. Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:

- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- If you notice unrelated dead code, mention it - don't delete it.

When your changes create orphans:

- Remove imports/variables/functions that YOUR changes made unused.
- Don't remove pre-existing dead code unless asked.

The test: Every changed line should trace directly to the user's request.

## 4. Goal-Driven Execution

**Define success criteria. Loop until verified.**

Transform tasks into verifiable goals:

- "Add validation" → "Write tests for invalid inputs, then make them pass"
- "Fix the bug" → "Write a test that reproduces it, then make it pass"
- "Refactor X" → "Ensure tests pass before and after"

For multi-step tasks, state a brief plan:

```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```

Strong success criteria let you loop independently. Weak criteria ("make it
work") require constant clarification.

---

**These guidelines are working if:** fewer unnecessary changes in diffs, fewer
rewrites due to overcomplication, and clarifying questions come before
implementation rather than after mistakes.

--

## Controller Rules For Subagent Work

When orchestrating subagents or delegated workers (in any harness), the
controlling agent owns these judgments — do not delegate them:

- **Deviation adjudication.** When an implementer reports a deviation from the
  spec, restate the governing invariant and prove the deviation preserves it
  before accepting. If the deviation exists to make a test pass, audit the test
  first — a wrong test plus an invariant-violating "fix" presents as green with
  a plausible explanation, and downstream reviewers will not catch it.
- **Measurement sanity.** Any measured number used as evidence needs an
  order-of-magnitude first-principles cross-check and an explicit
  workload-realism statement before it reaches the user. A too-good number is a
  finding about the measurement, not the system.
- **The deletion question.** After any accepted design change, ask "what does
  this make unnecessary?" and propose concrete removals. Design changes that
  only add are suspect.
- **Model tiering.** Reserve the strongest available model for judging (design
  review, deviation adjudication, final cross-cutting review); use cheaper
  models for implementation.
- **Plan execution.** When executing an approved multi-task implementation plan,
  default to the local subagent-driven development workflow where the harness
  supports it (for example, the `superpowers:subagent-driven-development`
  skill): a fresh implementer per task, then a spec-compliance review, then a
  code-quality review, with review findings fixed and re-reviewed before the
  next task. Skip this for single-task or trivial changes.

## Plans And Specs

An approved design spec or implementation plan must be persisted into the target
repo before execution ends. Plan files stored outside the repo are ephemeral and
do not survive the session.

## Global Git Safety

- Never create a git commit without explicit user approval.
- Never amend, append to, squash into, or otherwise modify an existing commit
  under any circumstances.
- Never push to GitHub or any remote without explicit user approval.

### Consent must be explicit and current

Committing, pushing, opening/editing PRs, and other hard-to-reverse or
outward-facing actions require explicit consent in the user's current message.
Treat them as separate from editing files.

- "Make the change", "fix it", "apply this", "do it", "make it so" authorize
  editing files only — not committing, pushing, or publishing. Stop after the
  edit, report, and offer the next step rather than taking it.
- An offer I made does not become consent. If I asked "want me to apply this and
  push?" and the reply is "yes, make the change", that approves the change, not
  the push — consent attaches to the user's words, not the menu I presented.
  When the reply is narrower or ambiguous, take the narrower action.
- Approval for one action (e.g. commit) does not extend to the next (push, PR),
  and approval in one turn does not carry to later turns.

## Documentation First

When the user requests code examples, setup or configuration steps, or
library/API documentation, check official docs or Context7 first when available.

## Package Management

- Check `package.json` for the `packageManager` field before adding, removing,
  or updating dependencies.
- Use the specified package manager and workspace-aware commands.
- Do not edit `package.json` directly to change dependencies when a package
  manager command can do it.
- If no package manager is declared, inspect lock files; if still ambiguous and
  the choice matters, ask.

## Safety

- Do not read `.env` files unless the user explicitly asks and the active
  permissions allow it.
- Avoid commands that download and execute arbitrary packages unless the project
  already uses that tool and the command is necessary.
- Preserve user changes and unrelated local work.
