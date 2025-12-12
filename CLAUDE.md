# CLAUDE.md — AI Assistant Instructions

## Project Overview

**polyglot-ssg-mcp** is a unified MCP server for 28 static site generators across 19 programming languages. No mainstream JS/Python/Ruby - this focuses on functional programming, systems languages, and academic tools.

## Quick Reference

```bash
# Start the server
deno task start

# Development with watch
deno task dev

# Build ReScript
deno task res:build
```

## Supported Languages

| Language | SSGs |
|----------|------|
| Rust | Zola, Cobalt, mdBook |
| Elixir | Serum, NimblePublisher, Tableau |
| Haskell | Hakyll, Ema |
| OCaml | YOCaml |
| F# | Fornax |
| Swift | Publish |
| Common Lisp | Coleslaw |
| Kotlin | Orchid |
| Julia | Franklin.jl, StaticWebPages.jl, Documenter.jl |
| Clojure | Cryogen, Perun, Babashka |
| Scala | Laika, ScalaTex |
| Erlang | Zotonic |
| Racket | Pollen, Frog |
| D | Reggae |
| Tcl | Wub |
| Crystal | Marmot |
| Nim | Nimrod |

## Architecture

```
index.js          — Main entry, MCP server setup
adapters/         — 28 SSG-specific adapters
src/              — ReScript source
  ├── Executor.res    — Type-safe command execution
  ├── Adapter.res     — Adapter interface types
  └── bindings/       — Deno API bindings
```

## Adding a New SSG Adapter

1. Create `adapters/yourssG.js`
2. Export: `name`, `language`, `description`, `connect()`, `disconnect()`, `isConnected()`, `tools`
3. Follow existing adapter patterns
4. Add SPDX header: `// SPDX-License-Identifier: MIT`
5. Import in `index.js`

## Code Standards

- **License**: MIT with SPDX headers
- **Primary Language**: ReScript (compiled to ES6)
- **Fallback**: JavaScript for adapters
- **No TypeScript**: Use ReScript instead

## Security

- Commands executed via `Deno.Command` (not shell)
- Whitelist approach for subcommands
- Argument sanitization

## Related Projects

- [polyglot-db-mcp](https://github.com/hyperpolymath/polyglot-db-mcp)
- [polyglot-container-mcp](https://github.com/hyperpolymath/polyglot-container-mcp)
