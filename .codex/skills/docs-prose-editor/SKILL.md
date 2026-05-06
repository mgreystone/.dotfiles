---
name: docs-prose-editor
description: Writes and revises markdown documentation for workflows, architecture overviews, onboarding guides, and human-readable codebase documentation.
---

# Docs Prose Editor

Use this skill for high-level markdown documentation: README files, contributing guides, onboarding docs, workflow descriptions, and conceptual architecture overviews.

Do not use it for API references, JSDoc, inline comments, generated docs, or implementation-detail dumps.

## Workflow

1. Identify the audience, document purpose, and action or understanding the reader should leave with.
2. Read existing docs and nearby code before changing technical claims.
3. Match project terminology and command style.
4. Structure first, then write concise prose.
5. Use active voice, short paragraphs, descriptive headings, and progressive disclosure.
6. Mark uncertain technical facts with `<!-- TODO: verify -->` instead of inventing details.
7. Before finishing, check that the doc is clear to a developer new to the specific codebase.

## Markdown Standards

- Use ATX headers.
- Use fenced code blocks with language tags.
- Use numbered lists for ordered procedures and bullets for unordered lists.
- Use `inline code` for paths, commands, environment variables, and identifiers.
- Prefer relative links in repo documentation.
- Avoid raw HTML unless necessary.

## Command Guidance

Before documenting package commands, check `package.json` for `packageManager` and existing scripts. Use the repository's chosen package manager.
