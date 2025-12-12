;; SPDX-License-Identifier: MIT
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

;; STATE.scm — Project State Tracking
;; polyglot-ssg-mcp: Unified MCP for 28 Static Site Generators

(define-module (polyglot-ssg-mcp state)
  #:export (project-state))

(define project-state
  '((metadata
     (title . "polyglot-ssg-mcp")
     (version . "1.0.0")
     (description . "Unified MCP server for 28 static site generators across 19 languages")
     (creator . "Jonathan D.A. Jewell")
     (date . "2025-12-12")
     (license . "MIT")
     (language . ("ReScript" "JavaScript"))
     (runtime . "Deno"))

    (statistics
     (ssgs . 28)
     (languages . 19)
     (adapters . 28)
     (tools-per-adapter . "5-8"))

    (languages
     (rust . ("Zola" "Cobalt" "mdBook"))
     (elixir . ("Serum" "NimblePublisher" "Tableau"))
     (haskell . ("Hakyll" "Ema"))
     (ocaml . ("YOCaml"))
     (fsharp . ("Fornax"))
     (swift . ("Publish"))
     (common-lisp . ("Coleslaw"))
     (kotlin . ("Orchid"))
     (julia . ("Franklin.jl" "StaticWebPages.jl" "Documenter.jl"))
     (clojure . ("Cryogen" "Perun" "Babashka"))
     (scala . ("Laika" "ScalaTex"))
     (erlang . ("Zotonic"))
     (racket . ("Pollen" "Frog"))
     (d . ("Reggae"))
     (tcl . ("Wub"))
     (crystal . ("Marmot"))
     (nim . ("Nimrod")))

    (roadmap
     (v1.0.0
      (status . "released")
      (features . ("28 SSG adapters"
                   "19 language support"
                   "Meta tools"
                   "ReScript core")))
     (v1.1.0
      (status . "planned")
      (features . ("Additional adapters"
                   "Template management"
                   "Cross-SSG migration"))))

    (rsr-compliance
     (level . "Silver")
     (requirements-met . ("SPDX headers"
                          "AsciiDoc documentation"
                          "Scheme metadata"
                          "justfile"
                          "CI/CD workflows")))))
