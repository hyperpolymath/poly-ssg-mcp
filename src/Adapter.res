// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

// Adapter interface types for SSG MCP server

type toolInput = {.}

type tool = {
  name: string,
  description: string,
  inputSchema: Js.Json.t,
}

type adapterState = {
  mutable connected: bool,
  mutable projectPath: option<string>,
}

type adapter = {
  name: string,
  description: string,
  language: string,
  connect: unit => Js.Promise.t<bool>,
  disconnect: unit => Js.Promise.t<unit>,
  isConnected: unit => bool,
  tools: array<tool>,
}

// Standard tools that every SSG adapter should implement
let standardTools = [
  "init",      // Initialize new project
  "build",     // Build the site
  "serve",     // Start dev server
  "clean",     // Clean build artifacts
  "version",   // Show version
  "new_post",  // Create new content
  "new_page",  // Create new page
  "check",     // Check/validate site
  "deploy",    // Deploy site
]
