---
name: init-typescript-project
description: Initialize new TypeScript projects with pnpm, Corepack, ESLint using eslint-config-love, eslint-plugin-simple-import-sort, Prettier no-semi 80-column formatting, Knip, lint-staged, Husky, and an ordered npm-run-all2 lint pipeline. Use when Codex needs to create or scaffold a fresh TypeScript package or pnpm workspace with these standard checks and hooks.
---

# Init TypeScript Project

## Workflow

Ask for the package name if the user did not provide one. Ask for the directory
name only when it cannot be derived safely. For scoped package names, default the
directory to the unscoped part, e.g. `@scope/foo` -> `foo`.

Ask whether this is a single package or a pnpm workspace only if the request
does not make that clear.

Prefer package-manager commands over custom file mutation:

```bash
corepack enable
mkdir <directory-name>
cd <directory-name>
pnpm init
corepack use pnpm@latest
pnpm pkg set name=<package-name>
pnpm pkg set type=module
pnpm pkg set --json private=true
pnpm pkg set 'scripts.lint=run-s lint:types lint:eslint lint:prettier lint:knip'
pnpm pkg set 'scripts.lint:types=tsc --noEmit'
pnpm pkg set 'scripts.lint:eslint=eslint'
pnpm pkg set 'scripts.lint:prettier=prettier --check .'
pnpm pkg set 'scripts.lint:knip=knip'
pnpm pkg set 'scripts.lint-staged=lint-staged --concurrent false'
pnpm pkg set 'scripts.prepare=husky'
pnpm add -D --strict-peer-dependencies --ignore-scripts typescript@latest eslint@latest eslint-config-love@latest eslint-config-prettier@latest eslint-plugin-import-x@latest eslint-plugin-simple-import-sort@latest prettier@latest knip@latest lint-staged@latest husky@latest npm-run-all2@latest
mkdir -p .husky
printf 'pnpm lint-staged\n' > .husky/pre-commit
chmod +x .husky/pre-commit
```

For workspace projects, write a complete `pnpm-workspace.yaml`:

```yaml
packages:
  - packages/*
```

Do not put pnpm-specific settings or workspace membership in `package.json`.

Use `src/` as the source root for single-package projects. Use
`packages/<directory-name>/src/` as the first package source root for workspace
projects.

## Config Files

Write small complete config files rather than trying to patch existing JSON or
YAML fragments.

For single-package projects, use `tsconfig.json`:

```json
{
  "compilerOptions": {
    "allowImportingTsExtensions": true,
    "allowSyntheticDefaultImports": true,
    "erasableSyntaxOnly": true,
    "esModuleInterop": true,
    "forceConsistentCasingInFileNames": true,
    "isolatedModules": true,
    "module": "NodeNext",
    "moduleResolution": "NodeNext",
    "noEmit": true,
    "noImplicitOverride": true,
    "noUncheckedIndexedAccess": true,
    "resolveJsonModule": true,
    "skipLibCheck": true,
    "strict": true,
    "target": "ESNext",
    "verbatimModuleSyntax": true
  },
  "include": ["src/**/*.ts"]
}
```

For workspace projects, use the same complete `tsconfig.json` but set
`include` to:

```json
{
  "include": ["packages/*/src/**/*.ts"]
}
```

Use `eslint.config.mjs`:

```js
/* eslint-disable import/no-default-export -- ESLint requires a default export for flat config files */
import { defineConfig, globalIgnores } from 'eslint/config'
import love from 'eslint-config-love'
import prettier from 'eslint-config-prettier'
import importX from 'eslint-plugin-import-x'
import simpleImportSort from 'eslint-plugin-simple-import-sort'

const files = ['**/*.{js,cjs,mjs,ts,tsx}']

export default defineConfig(
  globalIgnores(['**/coverage/**', '**/dist/**']),
  { ...love, files },
  { ...prettier, files },
  {
    files,
    plugins: {
      'import-x': importX,
      'simple-import-sort': simpleImportSort,
    },
    rules: {
      '@typescript-eslint/no-magic-numbers': 'off',
      '@typescript-eslint/prefer-destructuring': 'off',
      eqeqeq: ['error', 'always', { null: 'ignore' }],
      'import/extensions': ['error', 'ignorePackages'],
      'import-x/prefer-namespace-import': [
        'error',
        { patterns: ['/^node:(?!assert)/'] },
      ],
      'import/no-default-export': 'error',
      'simple-import-sort/imports': 'error',
      'simple-import-sort/exports': 'error',
    },
  }
)
```

Use `prettier.config.mjs`:

```js
/* eslint-disable import/no-default-export -- Prettier config files use default exports */
export default {
  arrowParens: 'always',
  bracketSpacing: true,
  endOfLine: 'lf',
  objectWrap: 'preserve',
  printWidth: 80,
  quoteProps: 'as-needed',
  semi: false,
  singleQuote: true,
  tabWidth: 2,
  trailingComma: 'es5',
  useTabs: false,
}
```

Use `.prettierignore`:

```gitignore
pnpm-lock.yaml
```

For single-package projects, use `knip.json`:

```json
{
  "$schema": "https://unpkg.com/knip@5/schema.json",
  "entry": ["src/index.ts"],
  "project": ["src/**/*.ts"]
}
```

For workspace projects, use `knip.json`:

```json
{
  "$schema": "https://unpkg.com/knip@5/schema.json",
  "workspaces": {
    "packages/*": {
      "entry": ["src/index.ts"],
      "project": ["src/**/*.ts"]
    }
  }
}
```

Use `.lintstagedrc.mjs`:

```js
export default {
  '*.{js,cjs,mjs,ts,tsx}': ['prettier --write', 'eslint --fix'],
  '*.{json,jsonc,md,yaml,yml}': ['prettier --write'],
  '*': () => 'pnpm lint',
}
```

Use `.husky/pre-commit`:

```bash
pnpm lint-staged
```

## Peer Dependencies

Latest dependency versions are intentionally resolved when the skill is used.
Do not look them up ahead of time.

If `pnpm add` reports a peer-dependency conflict, stop and ask the user what to
do using the actual pnpm output. The meaningful choices are:

- Add a targeted `peerDependencyRules.allowedVersions` exception in
  `pnpm-workspace.yaml`.
- Downgrade the conflicting direct dependency to a compatible version.
- Abort.

Only apply the option the user chooses. If adding pnpm policy, write it in
`pnpm-workspace.yaml`, not `package.json`.
