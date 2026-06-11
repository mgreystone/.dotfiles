/Users/mgreystone/.agents/AGENTS.md
/Users/mgreystone/.codex/RTK.md

## Model Selection for Agent Tool Calls

Always set `model` explicitly for `multi_agent_v1.spawn_agent` calls — never
rely on session inheritance. Map the `superpowers:subagent-driven-development`
tiers to concrete Codex model names:

| Skill tier | Signals | `model` |
|---|---|---|
| fast / cheap | 1–2 files, complete spec, mechanical edit | `gpt-5.4-mini` |
| standard | multi-file, integration, moderate judgment | `gpt-5.4` |
| most capable | design review, deviation adjudication, final review | `gpt-5.5` |
