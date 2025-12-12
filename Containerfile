# SPDX-License-Identifier: MIT
# SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
# polyglot-ssg-mcp - Wolfi base image

FROM ghcr.io/wolfi-dev/wolfi-base:latest

LABEL org.opencontainers.image.title="polyglot-ssg-mcp"
LABEL org.opencontainers.image.description="Unified MCP server for 28 static site generators"
LABEL org.opencontainers.image.authors="Jonathan D.A. Jewell"
LABEL org.opencontainers.image.source="https://github.com/hyperpolymath/polyglot-ssg-mcp"
LABEL org.opencontainers.image.licenses="MIT"

# Install Deno
RUN apk add --no-cache deno

WORKDIR /app

# Copy application files
COPY deno.json package.json rescript.json ./
COPY index.js ./
COPY adapters/ ./adapters/
COPY src/ ./src/
COPY lib/ ./lib/

# Cache dependencies
RUN deno cache --config=deno.json index.js

# SSG CLIs expected to be available via volume mount or installed in derived image
# Example: podman run -v /usr/local/bin:/host-bin:ro ...

USER nonroot
EXPOSE 3000

ENTRYPOINT ["deno", "run", "--allow-run", "--allow-read", "--allow-write", "--allow-env", "index.js"]
