;; SPDX-License-Identifier: MIT
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

;; ECOSYSTEM.scm — Related Projects and Ecosystem
;; polyglot-ssg-mcp

(define-module (polyglot-ssg-mcp ecosystem)
  #:export (ecosystem))

(define ecosystem
  '((polyglot-mcp-family
     (polyglot-db-mcp
      (url . "https://github.com/hyperpolymath/polyglot-db-mcp")
      (description . "Multi-database MCP server")
      (adapters . 16))
     (polyglot-container-mcp
      (url . "https://github.com/hyperpolymath/polyglot-container-mcp")
      (description . "Multi-container runtime MCP server")
      (runtimes . ("nerdctl" "podman" "docker")))
     (polyglot-ssg-mcp
      (url . "https://github.com/hyperpolymath/polyglot-ssg-mcp")
      (description . "Multi-SSG MCP server")
      (ssgs . 28)
      (languages . 19)))

    (ssg-ecosystems
     (rust . ((zola . "https://www.getzola.org/")
              (cobalt . "https://cobalt-org.github.io/")
              (mdbook . "https://rust-lang.github.io/mdBook/")))
     (haskell . ((hakyll . "https://jaspervdj.be/hakyll/")
                 (ema . "https://ema.srid.ca/")))
     (elixir . ((serum . "https://dalgona.github.io/Serum/")
                (tableau . "https://github.com/elixir-tools/tableau")))
     (racket . ((pollen . "https://docs.racket-lang.org/pollen/")
                (frog . "https://github.com/greghendershott/frog")))
     (julia . ((franklin . "https://franklinjl.org/")
               (documenter . "https://documenter.juliadocs.org/"))))

    (mcp-directories
     (smithery . "https://smithery.ai/")
     (mcp-so . "https://mcp.so/")
     (awesome-mcp . "https://github.com/punkpeye/awesome-mcp-servers"))))
