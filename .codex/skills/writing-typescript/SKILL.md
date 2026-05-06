---
name: writing-typescript
description: Applies strict TypeScript type safety rules and coding standards when creating, editing, reviewing, or refactoring .ts, .tsx, .mts, .cts, or .d.ts files.
---

# Writing TypeScript

Use this skill when creating, editing, reviewing, or refactoring TypeScript files.

Before touching TypeScript, read [rules.md](references/rules.md) and apply it to the task. The rules are intentionally strict: no explicit `any`, no unsafe narrowing casts, no `enum`, no non-boolean truthiness checks, no suppression directives, and no duplicated type definitions when types can be derived.

If a rule cannot be met without a user-approved exception, stop and explain the tradeoff before proceeding.
