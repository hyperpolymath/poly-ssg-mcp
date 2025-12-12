// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

// Deno API bindings for ReScript

module Command = {
  type t

  type output = {
    success: bool,
    code: int,
    stdout: Js.TypedArray2.Uint8Array.t,
    stderr: Js.TypedArray2.Uint8Array.t,
  }

  type commandOptions = {
    args: array<string>,
    cwd: option<string>,
    env: option<Js.Dict.t<string>>,
  }

  @new @scope("Deno")
  external make: (string, commandOptions) => t = "Command"

  @send
  external output: t => Js.Promise.t<output> = "output"
}

module TextDecoder = {
  type t

  @new
  external make: unit => t = "TextDecoder"

  @send
  external decode: (t, Js.TypedArray2.Uint8Array.t) => string = "decode"
}

module Env = {
  @scope(("Deno", "env")) @val
  external get: string => option<string> = "get"

  @scope(("Deno", "env")) @val
  external set: (string, string) => unit = "set"
}

module Fs = {
  @scope("Deno") @val
  external readTextFile: string => Js.Promise.t<string> = "readTextFile"

  @scope("Deno") @val
  external writeTextFile: (string, string) => Js.Promise.t<unit> = "writeTextFile"

  @scope("Deno") @val
  external mkdir: (string, {"recursive": bool}) => Js.Promise.t<unit> = "mkdir"

  @scope("Deno") @val
  external remove: (string, {"recursive": bool}) => Js.Promise.t<unit> = "remove"

  type fileInfo = {
    isFile: bool,
    isDirectory: bool,
    size: float,
  }

  @scope("Deno") @val
  external stat: string => Js.Promise.t<fileInfo> = "stat"
}
