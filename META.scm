;; SPDX-License-Identifier: MIT
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

;; META.scm — Architectural Decisions and Development Practices
;; polyglot-ssg-mcp

(define-module (polyglot-ssg-mcp meta)
  #:export (architecture-decisions))

(define architecture-decisions
  '((design-philosophy
     (polyglot . "Support SSGs from 19+ programming languages")
     (foss-first . "Prioritize FOSS tools over proprietary")
     (no-mainstream . "Exclude mainstream JS/Python/Ruby SSGs")
     (functional-focus . "Emphasize FP languages: Haskell, OCaml, Racket, etc."))

    (language-selection-criteria
     (included . ("Functional programming languages"
                  "Systems programming languages"
                  "Academic/research languages"
                  "Lisp family languages"
                  "ML family languages"))
     (excluded . ("JavaScript frameworks (Hugo, Eleventy, Astro)"
                  "Python SSGs (Pelican, MkDocs)"
                  "Ruby SSGs (Jekyll, Bridgetown)"
                  "PHP generators")))

    (adapter-pattern
     (rationale . "Each SSG has unique CLI and workflow")
     (interface . ("name" "language" "description" "connect" "disconnect" "isConnected" "tools"))
     (tool-naming . "{ssg}_{action} e.g., zola_build, hakyll_watch"))

    (security-model
     (execution . "Deno.Command (no shell)")
     (commands . "Whitelist approach")
     (arguments . "Sanitization before execution")
     (permissions . "--allow-run --allow-read --allow-write --allow-env"))

    (type-safety
     (core . "ReScript for Executor and Adapter interfaces")
     (adapters . "JavaScript for SSG-specific implementations")
     (rationale . "Balance type safety with adapter flexibility"))))
