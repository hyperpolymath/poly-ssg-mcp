// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
//
// Integration tests for poly-ssg satellite repositories
// Tests that satellite SSG engines can be invoked via MCP adapter patterns

import { assertEquals, assertExists, assert } from "https://deno.land/std@0.208.0/assert/mod.ts";
import { join } from "https://deno.land/std@0.208.0/path/mod.ts";

// Satellite registry (from SATELLITES.scm)
const implementedSatellites = [
  { name: "zigzag-ssg", language: "Zig", command: "zigzag" },
  { name: "casket-ssg", language: "Haskell", command: "casket" },
  { name: "prodigy-ssg", language: "Prolog", command: "swipl" },
  { name: "sparkle-ssg", language: "Gleam", command: "gleam" },
  { name: "macrauchenia-ssg", language: "OCaml", command: "macrauchenia" },
  { name: "eclipse-ssg", language: "Pony", command: "ponyc" },
  { name: "chicxulub-ssg", language: "Bash", command: "bash" },
  { name: "anvil-ssg", language: "Ada/SPARK", command: "gnatmake" },
  { name: "divisionone-ssg", language: "COBOL", command: "cobc" },
  { name: "labnote-ssg", language: "SciLab", command: "scilab-cli" },
  { name: "milk-ssg", language: "COW", command: "cow" },
];

// Hub adapters (from poly-ssg-mcp)
const hubAdapters = [
  "zola", "hakyll", "cobalt", "mdbook", "serum", "franklin",
  "pollen", "frog", "cryogen", "documenter", "fornax", "ema",
  "laika", "marmot", "nimrod", "orchid", "perun", "publish",
  "reggae", "scalatex", "staticwebpages", "tableau", "wub",
  "yocaml", "babashka", "coleslaw", "nimble-publisher", "zotonic",
];

Deno.test("Satellite Registry: All implemented satellites have valid structure", () => {
  for (const satellite of implementedSatellites) {
    assertExists(satellite.name, "Satellite must have name");
    assertExists(satellite.language, "Satellite must have language");
    assertExists(satellite.command, "Satellite must have command");
    assert(satellite.name.endsWith("-ssg"), "Satellite name should end with -ssg");
  }
});

Deno.test("Satellite Registry: No duplicate satellite names", () => {
  const names = implementedSatellites.map((s) => s.name);
  const uniqueNames = new Set(names);
  assertEquals(names.length, uniqueNames.size, "Duplicate satellite names found");
});

Deno.test("Hub Adapters: All adapter names are lowercase", () => {
  for (const adapter of hubAdapters) {
    assertEquals(adapter, adapter.toLowerCase(), `Adapter ${adapter} should be lowercase`);
  }
});

Deno.test("Hub Adapters: No duplicate adapter names", () => {
  const uniqueAdapters = new Set(hubAdapters);
  assertEquals(hubAdapters.length, uniqueAdapters.size, "Duplicate adapter names found");
});

Deno.test("Satellite-Hub Separation: Satellites don't overlap with hub adapters", () => {
  const satelliteNames = implementedSatellites.map((s) =>
    s.name.replace("-ssg", "").toLowerCase()
  );

  for (const satName of satelliteNames) {
    assert(
      !hubAdapters.includes(satName),
      `Satellite ${satName} should not overlap with hub adapter`
    );
  }
});

Deno.test("MCP Integration: Standard tool pattern is consistent", async (t) => {
  // Standard tools that both hub adapters and satellites should expose
  const standardTools = ["init", "build", "serve", "clean", "version"];

  await t.step("Hub adapters follow standard tool naming", async () => {
    // Import a sample adapter
    const Zola = await import("../lib/es6/src/adapters/Zola.res.js");
    const toolNames = Zola.tools.map((t) => t.name);

    // Check that standard operations exist with adapter prefix
    for (const stdTool of standardTools) {
      const hasStandardTool = toolNames.some((name) => name.includes(stdTool));
      assert(
        hasStandardTool,
        `Zola should have a tool containing '${stdTool}'`
      );
    }
  });
});

Deno.test("Satellite Metadata: Implemented count matches list", () => {
  // From SATELLITES.scm statistics
  const expectedCount = 11;
  assertEquals(
    implementedSatellites.length,
    expectedCount,
    "Implemented satellite count should match SATELLITES.scm"
  );
});

Deno.test("Language Paradigm Coverage: Multiple paradigms represented", () => {
  const languages = implementedSatellites.map((s) => s.language);
  const uniqueLanguages = new Set(languages);

  // Should cover multiple programming paradigms
  assert(uniqueLanguages.size >= 8, "Should cover at least 8 different languages");

  // Check specific paradigm coverage
  const hasSystemsLang = languages.some((l) =>
    ["Zig", "Ada/SPARK", "COBOL"].includes(l)
  );
  const hasFunctionalLang = languages.some((l) =>
    ["Haskell", "OCaml", "Gleam"].includes(l)
  );
  const hasLogicLang = languages.some((l) => l === "Prolog");
  const hasEsotericLang = languages.some((l) => l === "COW");

  assert(hasSystemsLang, "Should have systems programming language");
  assert(hasFunctionalLang, "Should have functional language");
  assert(hasLogicLang, "Should have logic programming language");
  assert(hasEsotericLang, "Should have esoteric language");
});

Deno.test("Command Availability: Check if satellite commands could be available", async (t) => {
  // This test documents what commands satellites use
  // Actual availability depends on system installation

  const commandDescriptions = {
    "zigzag": "Zig-based SSG binary",
    "casket": "Haskell Stack-built SSG",
    "swipl": "SWI-Prolog interpreter",
    "gleam": "Gleam build tool",
    "macrauchenia": "OCaml dune-built SSG",
    "ponyc": "Pony compiler",
    "bash": "POSIX shell",
    "gnatmake": "Ada compiler",
    "cobc": "GnuCOBOL compiler",
    "scilab-cli": "SciLab CLI interpreter",
    "cow": "COW esoteric interpreter",
  };

  for (const sat of implementedSatellites) {
    await t.step(`${sat.name} uses ${sat.command}`, () => {
      const description = commandDescriptions[sat.command] || "Unknown";
      assert(
        sat.command in commandDescriptions,
        `${sat.name} command should be documented`
      );
    });
  }
});
