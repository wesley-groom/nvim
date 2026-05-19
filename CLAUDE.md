# CLAUDE.md

## General

1. Don't assume. Don't hide confusion. Surface tradeoffs.
2. Minimum code that solves the problem. Nothing speculative.
3. Touch only what you must. Clean up only your own mess.
4. Define success criteria. Loop until verified.

## Commands

Reload plugins after editing `lua/wes/plugins.lua`:
```
:PackerSync
```

Reload a specific module in Neovim without restarting:
```vim
:lua package.loaded['wes.<module>'] = nil; require('wes.<module>')
```

## Architecture

Lua-based Neovim config using **Packer.nvim** as the plugin manager. The entry point `init.lua` loads modules from `lua/wes/` in a fixed order — changing load order can cause dependency errors.

**Module load order (init.lua):**
1. `options` → `keymaps` → `plugins` → `colorscheme`
2. `cmp` → `telescope` → `treesitter` → `autopairs`
3. `gitsigns` → `nvimtree` → `toggleterm` → `bufferline`
4. LSP is currently **commented out** — `require("wes.lsp")` is disabled in `init.lua:6`

**LSP subsystem (`lua/wes/lsp/`):**
- `mason.lua` — installs/manages servers: `lua_ls`, `pyright`, `bashls`, `clangd`
- `handlers.lua` — shared diagnostic config, keymaps (`gd`, `gD`, `K`, etc.), and hover/float styling
- `null-ls.lua` — formatters: `clang_format`, `prettier`, `black`, `stylua`
- `settings/<server>.lua` — per-server LSP settings files

## Key Details

- **Leader key:** `<Space>`
- **Indentation:** 4-space tabs across all file types (set in `options.lua`)
- **Treesitter languages:** C, Python, Devicetree, Kconfig, Lua, Markdown, Bash — the `overlay` filetype is mapped to the `devicetree` parser
- **Custom terminals** (via toggleterm): lazygit, node REPL, python REPL, htop, ncdu — toggled with `<Ctrl-\>`
- Colorscheme uses `pcall()` guards so first-run (before plugins install) doesn't crash
- `plugin/packer_compiled.lua` is auto-generated and gitignored — do not edit it

## Adding a Plugin

1. Add the plugin spec in `lua/wes/plugins.lua` inside the `packer.startup` function
2. Create a config module at `lua/wes/<name>.lua` if it needs setup
3. Add `require("wes.<name>")` to `init.lua` after the `plugins` require
4. Run `:PackerSync` in Neovim

