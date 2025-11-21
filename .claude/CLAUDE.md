## Documentation First

When the user requests code examples, setup or configuration steps, or library/API documentation, first check the docs with context7

## Package Management

- **Always use the correct package manager** - Check for `packageManager` field in package.json and use the specified tool (npm, pnpm, yarn, etc.)
- **Never edit package.json files directly** - Always use the package manager to add, remove, or update dependencies
- **When packageManager field is not present** - Ask the user which package manager to use
- Examples:
  - If `"packageManager": "pnpm@8.6.0"` → use `pnpm add <package>`
  - If `"packageManager": "yarn@3.2.0"` → use `yarn add <package>`
  - If `"packageManager": "npm@9.0.0"` → use `npm install <package>`
  - For monorepos with workspaces, use appropriate workspace commands (e.g., `pnpm --filter=<workspace> add <package>`)
