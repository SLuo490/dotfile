# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a [LazyVim](https://lazyvim.github.io)-based Neovim configuration. LazyVim is a framework built on top of [lazy.nvim](https://github.com/folke/lazy.nvim) that provides a curated set of default plugins and configuration.

## Architecture

**Entry point**: `init.lua` — single line that bootstraps the config via `require("config.lazy")`.

**Core config** (`lua/config/`):
- `lazy.lua` — bootstraps lazy.nvim, imports LazyVim framework + custom plugins from `lua/plugins/`
- `options.lua` — editor settings (4-space tabs, no mouse, space as leader)
- `keymaps.lua` — custom keybindings added on `VeryLazy` event
- `autocmds.lua` — custom autocommands (currently empty; LazyVim defaults apply)

**Custom plugins** (`lua/plugins/`): Each file returns a Lua table of plugin specs that override or extend LazyVim defaults. Files are auto-imported by lazy.nvim.

**LazyVim extras** (enabled in `lazyvim.json`):
- `coding.luasnip`, `coding.nvim-cmp` — snippets and completion
- `formatting.prettier` — Prettier formatter
- `lang.typescript` — TypeScript/JavaScript LSP support

## Key Plugins

- **avante.nvim** — AI assistant (Gemini provider); references `avante.md` for project instructions
- **toggleterm.nvim** — terminal integration; `<leader>t1`/`<leader>t2` toggle instances
- **lazygit.nvim** — Git UI; `<leader>lg`
- **nvim-ufo** + **nvim-origami** — code folding; `zm`/`zr`/`z?`
- **noice.nvim** — replaces cmdline/messages UI
- **incline.nvim** — floating filename display

## Lua Formatting

Use `stylua` for formatting Lua files:
- 2-space indentation
- 120-character column width

Config: `stylua.toml`

## Adding Plugins

Create a new file in `lua/plugins/` returning a table of lazy.nvim plugin specs. The file is auto-discovered. See `lua/plugins/example.lua` (disabled) for patterns.

To override a LazyVim default plugin, return a spec with the same plugin short name and your customizations.

## Plugin Lock File

`lazy-lock.json` pins exact plugin commits. After updating plugins inside Neovim (`:Lazy update`), commit this file to track the versions.
