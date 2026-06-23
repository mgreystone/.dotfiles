@../.agents/AGENTS.md
@RTK.md

## Subagent Dispatch (Claude Code)

- Prefer limited-tool agent types (e.g. `typescript-engineer`, `scout`) for
  subagent dispatch. `Explore` and `general-purpose` inherit every MCP tool
  schema and can exceed the context window before doing any work.
- When executing an approved multi-task implementation plan, default to
  `superpowers:subagent-driven-development` (implementers dispatched per the
  TypeScript-editing rule in `.claude/rules/typescript-editing.md`; controller
  judgments per the Controller Rules in the imported AGENTS.md). Skip it for
  single-task or trivial changes.
- Plan files under `~/.claude/plans/` are ephemeral — persist approved specs
  and plans into the target repo before execution ends.

### Model Selection for Agent Tool Calls

Always set `model` explicitly — never rely on session inheritance. Map the
`superpowers:subagent-driven-development` tiers to concrete names:

| Skill tier | Signals | `model` |
|---|---|---|
| fast / cheap | 1–2 files, complete spec, mechanical edit | `haiku` |
| standard | multi-file, integration, moderate judgment | `sonnet` |
| most capable | design review, deviation adjudication, final review | `opus` |
