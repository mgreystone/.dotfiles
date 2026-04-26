# TypeScript Rules & Guidelines

## Scope of Enforcement

These rules apply to code being written or edited in this session. Pre-existing violations in the same file are noted but do not block progress — only a human can decide when to remediate them. For `.js` and `.jsx` files in a TypeScript codebase, this skill does not apply.

## Rules That Require Human Authorization to Violate

These rules may not be violated by Claude under any circumstances. If one cannot be met, stop immediately — do not proceed, do not silently compromise. Explain the constraint and the available options. Only the human can authorize an exception.

- **Never explicitly annotate `any`** — not as a type annotation, not as a generic argument. If TypeScript infers `any`, treat it as a type error: use `unknown` and narrow, or redesign the types.
- **Never use `as` to narrow a type** — casting to a more specific type asserts what the compiler cannot verify; only a human may authorize it. `as unknown as SomethingElse` is especially prohibited — it is a deliberate double-cast to escape the type system entirely. Casting to a broader type (e.g. `value as unknown`, `str as string | null`) is acceptable.
- **No `enum` declarations** — use `const` objects with `as const` instead.
- **No implicit truthiness on non-booleans** — only use bare `if (x)` or `!x` when `x` is typed as `boolean`. This applies even when `x` is a union type like `string | undefined` or `T | null` — use explicit comparisons (`x != null`, `x !== ""`, `x.length === 0`) so intent is unambiguous. There are no exceptions.
- **Use `== null` / `!= null` for nullish checks** — checks for both `null` and `undefined` at once. Never write paired `=== null || === undefined` checks.

## Type Safety

- **Match known types exactly** — when types are already defined in the codebase, use them precisely. Do not redefine or approximate existing types.
- **Prefer `satisfies`** over `as` when you need to validate a value against a type without widening.
- **Use type predicates** (`value is SomeType`) and discriminated unions to narrow types safely.
- **Leverage generics** to write reusable, type-safe functions rather than overloading with `any` or broad unions.
- **Use `unknown` instead of `any`** for truly unknown values, and narrow with guards before use.
- **Prefer `readonly`** and immutable patterns where appropriate.
- **Use `ReturnType<>`, `Parameters<>`, `Awaited<>`, and other utility types** to derive types from existing code rather than duplicating type information.

## type-fest

Before writing a custom utility type, check if [`type-fest`](https://github.com/sindresorhus/type-fest) is installed. If it is, always reach for it first — examples: `AsyncReturnType`, `Promisable`, `DistributedOmit`, `Simplify`, `SetOptional`, `SetRequired`, `UnionToIntersection`. If it isn't installed but a type-fest utility would cleanly solve the problem, suggest adding it and wait for the human to decide before proceeding.

## DRY & Reusability

- **Re-use existing functions wherever possible** — before writing a new utility, scan the codebase for existing implementations.
- **Extract shared logic** into well-named helper functions. Avoid copy-pasting logic.
- **Use generics and higher-order functions** to capture patterns once rather than repeating variations.
- **Derive types from implementations** rather than maintaining parallel type and implementation definitions.

## Approachability & Readability

- **Name things clearly** — types, functions, and variables should communicate intent immediately.
- **Keep functions small and focused** — one responsibility per function.
- **Prefer explicit over implicit** in type signatures for public APIs, even if TypeScript can infer them.
- **Avoid clever one-liners** that sacrifice readability for brevity.

## Requesting a Human Exception

If a human-gated rule cannot be met (e.g. a third-party library forces `any`, a type boundary is genuinely unsolvable, or compliance would require an architectural change beyond scope):

1. **Stop** — do not proceed or silently work around the constraint.
2. **Explain** — describe exactly what the constraint is and why the rule cannot be met.
3. **Propose at least two options** — e.g. accept a localized `as` cast with a comment, refactor the type boundary, use a wrapper.
4. **Wait** — only continue once the human has chosen an option.

## Self-Review Checklist

Before responding, check:

- [ ] Any `any`? Fix it.
- [ ] Any `enum`? Replace with `const` + `as const`.
- [ ] Any `as unknown as X`? This is never acceptable — remove it.
- [ ] Any other `as` casts that could be avoided? Replace with type guards or `satisfies`.
- [ ] Any truthy/falsy on non-`boolean`? Replace with explicit `===`.
- [ ] Any paired `=== null`/`=== undefined`? Replace with `== null` / `!= null`.
- [ ] Any duplicated logic? Extract it.
- [ ] Any type duplicated from an existing definition? Derive it instead.
- [ ] Any inferred types assumed without verification? Use LSP hover to confirm.
- [ ] Any codebase-specific patterns, utilities, or conventions discovered? Save to memory.

## TypeScript LSP

**Use the LSP `hover` operation to verify inferred types** — do not guess at what TypeScript infers. For any expression whose type is in question (e.g. `process.env.FOO` assigned to a `string` field, a function's return type, a generic argument), use the LSP `hover` tool at that position to get the language server's actual inferred type. Code reading is a fallback only when LSP is unavailable.

## Memory

Update memory as you discover codebase-specific patterns, existing utility functions, established type conventions, and architectural decisions. Record what's non-obvious and durable — existing utilities and their signatures, known type debt areas, domain type locations. Skip anything derivable from reading the current files.

## Common Patterns

```typescript
// ✅ Type guard instead of cast
type Entity = { id: string };
function isEntity(value: unknown): value is Entity {
  return typeof value === "object"
    && value !== null
    && "id" in value
    && typeof value.id === "string";
}

// ✅ Discriminated union for safe narrowing
type Result<T> = { ok: true; value: T } | { ok: false; error: string };

// ✅ satisfies instead of as
const config = { timeout: 3000, retries: 3 } satisfies Config;

// ✅ Derive types from implementation
async function fetchUser(id: string) { ... }
type User = Awaited<ReturnType<typeof fetchUser>>;

// ✅ Nullish check
if (user != null) { ... }

// ✅ Explicit non-boolean checks
if (name !== "") { ... }
if (items.length > 0) { ... }
```
