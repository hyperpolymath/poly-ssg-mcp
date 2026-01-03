;; SPDX-License-Identifier: MIT
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; SATELLITES.scm - Hub-Satellite Registry for poly-ssg-mcp
;;
;; This file defines all satellite repositories that orbit the poly-ssg-mcp hub.
;; Satellites are SSG project implementations that use the unified MCP adapter interface.

(satellites
  (version "1.0.0")
  (hub
    (name "poly-ssg-mcp")
    (url "https://github.com/hyperpolymath/poly-ssg-mcp")
    (description "Unified MCP server for 28 static site generators across 19 languages")
    (adapters 28))

  ;; SSG Satellite Projects
  ;; Each satellite can use any adapter from the hub via MCP
  (satellite-repos
    ;; Core/Template
    (satellite
      (name "hackenbush-ssg")
      (url "https://github.com/hyperpolymath/hackenbush-ssg")
      (role "template")
      (description "Canonical RSR template for SSG projects"))

    (satellite
      (name "poly-ssg")
      (url "https://github.com/hyperpolymath/poly-ssg")
      (role "meta")
      (description "Polyglot SSG framework with multi-language engines"))

    ;; Individual SSG Satellites
    (satellite
      (name "anvil-ssg")
      (url "https://github.com/hyperpolymath/anvil-ssg"))

    (satellite
      (name "baremetal-ssg")
      (url "https://github.com/hyperpolymath/baremetal-ssg"))

    (satellite
      (name "befunge-ssg")
      (url "https://github.com/hyperpolymath/befunge-ssg"))

    (satellite
      (name "casket-ssg")
      (url "https://github.com/hyperpolymath/casket-ssg"))

    (satellite
      (name "chicxulub--ssg")
      (url "https://github.com/hyperpolymath/chicxulub--ssg"))

    (satellite
      (name "ddraig-ssg")
      (url "https://github.com/hyperpolymath/ddraig-ssg"))

    (satellite
      (name "divisionone-ssg")
      (url "https://github.com/hyperpolymath/divisionone-ssg"))

    (satellite
      (name "doit-ssg")
      (url "https://github.com/hyperpolymath/doit-ssg"))

    (satellite
      (name "eclipse-ssg")
      (url "https://github.com/hyperpolymath/eclipse-ssg"))

    (satellite
      (name "estate-ssg")
      (url "https://github.com/hyperpolymath/estate-ssg"))

    (satellite
      (name "gungir-ssg")
      (url "https://github.com/hyperpolymath/gungir-ssg"))

    (satellite
      (name "iota-ssg")
      (url "https://github.com/hyperpolymath/iota-ssg"))

    (satellite
      (name "labnote-ssg")
      (url "https://github.com/hyperpolymath/labnote-ssg"))

    (satellite
      (name "macrauchenia-ssg")
      (url "https://github.com/hyperpolymath/macrauchenia-ssg"))

    (satellite
      (name "milk-ssg")
      (url "https://github.com/hyperpolymath/milk-ssg"))

    (satellite
      (name "my-ssg")
      (url "https://github.com/hyperpolymath/my-ssg"))

    (satellite
      (name "noteg-ssg")
      (url "https://github.com/hyperpolymath/noteg-ssg"))

    (satellite
      (name "obli-ssg")
      (url "https://github.com/hyperpolymath/obli-ssg"))

    (satellite
      (name "odd-ssg")
      (url "https://github.com/hyperpolymath/odd-ssg"))

    (satellite
      (name "orbital-ssg")
      (url "https://github.com/hyperpolymath/orbital-ssg"))

    (satellite
      (name "parallax-ssg")
      (url "https://github.com/hyperpolymath/parallax-ssg"))

    (satellite
      (name "pharos-ssg")
      (url "https://github.com/hyperpolymath/pharos-ssg"))

    (satellite
      (name "prodigy-ssg")
      (url "https://github.com/hyperpolymath/prodigy-ssg"))

    (satellite
      (name "qed-ssg")
      (url "https://github.com/hyperpolymath/qed-ssg"))

    (satellite
      (name "rats-ssg")
      (url "https://github.com/hyperpolymath/rats-ssg"))

    (satellite
      (name "rescribe-ssg")
      (url "https://github.com/hyperpolymath/rescribe-ssg"))

    (satellite
      (name "saur-ssg")
      (url "https://github.com/hyperpolymath/saur-ssg"))

    (satellite
      (name "shift-ssg")
      (url "https://github.com/hyperpolymath/shift-ssg"))

    (satellite
      (name "sparkle-ssg")
      (url "https://github.com/hyperpolymath/sparkle-ssg"))

    (satellite
      (name "terrapin-ssg")
      (url "https://github.com/hyperpolymath/terrapin-ssg"))

    (satellite
      (name "wagasm-ssg")
      (url "https://github.com/hyperpolymath/wagasm-ssg"))

    (satellite
      (name "zigzag-ssg")
      (url "https://github.com/hyperpolymath/zigzag-ssg")))

  ;; Available Adapters (from hub)
  ;; Satellites can invoke any of these via MCP
  (available-adapters
    (adapter (name "babashka") (language "Clojure"))
    (adapter (name "cobalt") (language "Rust"))
    (adapter (name "coleslaw") (language "Common Lisp"))
    (adapter (name "cryogen") (language "Clojure"))
    (adapter (name "documenter") (language "Julia"))
    (adapter (name "ema") (language "Haskell"))
    (adapter (name "fornax") (language "F#"))
    (adapter (name "franklin") (language "Julia"))
    (adapter (name "frog") (language "Racket"))
    (adapter (name "hakyll") (language "Haskell"))
    (adapter (name "laika") (language "Scala"))
    (adapter (name "marmot") (language "Crystal"))
    (adapter (name "mdbook") (language "Rust"))
    (adapter (name "nimble-publisher") (language "Elixir"))
    (adapter (name "nimrod") (language "Nim"))
    (adapter (name "orchid") (language "Kotlin"))
    (adapter (name "perun") (language "Clojure"))
    (adapter (name "pollen") (language "Racket"))
    (adapter (name "publish") (language "Swift"))
    (adapter (name "reggae") (language "D"))
    (adapter (name "scalatex") (language "Scala"))
    (adapter (name "serum") (language "Elixir"))
    (adapter (name "staticwebpages") (language "Julia"))
    (adapter (name "tableau") (language "Elixir"))
    (adapter (name "wub") (language "Tcl"))
    (adapter (name "yocaml") (language "OCaml"))
    (adapter (name "zola") (language "Rust"))
    (adapter (name "zotonic") (language "Erlang"))))

;;; End of SATELLITES.scm
