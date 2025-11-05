# CLAUDE.md

This file provides guidance to Claude AI when working with code in this repository.

## Overview

This is a Neovim configuration using the Lazy.nvim plugin manager. The configuration is organized into modular files under the `lua/` directory with plugins categorized by function.

## Architecture

### Core Structure
- `init.lua`: Main entry point that sets up leader keys, loads core modules, and configures basic editor settings
- `lua/lazy-init.lua`: Lazy.nvim configuration and plugin specifications
- `lua/options.lua`: Core Neovim options and settings
- `lua/keymaps.lua`: Global keymaps and key bindings
- `lua/globals.lua`: Global variables and configurations

### Plugin Organization
Plugins are organized into logical categories under `lua/plugins/`:

- **coding/**: Development tools (LSP, completion, debugging, copilot, etc.)
- **editor/**: Editor enhancements (file explorers, git integration, fuzzy finders)
- **formatting/**: Code formatting tools (conform.nvim, prettier)
- **languages/**: Language-specific configurations (typescript, python, go, etc.)
- **linting/**: Code linting configurations
- **test/**: Testing frameworks and tools
- **ui/**: UI/UX enhancements (colorschemes, status lines)
- **util/**: Utility plugins and helpers

### Key Components
- **Plugin Manager**: Lazy.nvim with lazy loading and performance optimizations
- **LSP Setup**: Uses mason.nvim for automatic LSP server installation and nvim-lspconfig for configuration
- **Completion**: nvim-cmp with multiple sources (LSP, LuaSnip, path, codecompanion)
- **File Navigation**: Neo-tree, telescope, oil.nvim for different file management needs
- **Git Integration**: Gitsigns, lazygit for version control workflow

## Common Commands

### Formatting
- `stylua .` - Format Lua files using stylua (configuration in stylua.toml)

### Plugin Management
- `:Lazy` - Open Lazy.nvim plugin manager
- `:Lazy sync` - Update all plugins
- `:Mason` - Open Mason tool installer

### LSP and Development
- `:LspInfo` - Show LSP server status
- `:Mason` - Manage LSP servers and tools

## Configuration Notes

### Plugin Loading Strategy
- Uses modular plugin imports via `{ import = 'plugins.category.name' }` pattern in lazy-init.lua
- Each plugin category has its own directory with individual plugin files
- Plugins define their own keymaps using the `keys` table in their specification
- Some plugins are commented out but available (avante, codecompanion, fzf, smear-cursor)

### Indentation
- Uses 2 spaces for indentation across all files
- Configured in both init.lua and stylua.toml

### Key Bindings Architecture
- Leader key is set to Space (`<leader>`)
- Global keymaps are defined in `lua/keymaps.lua`
- Plugin-specific keymaps are defined within each plugin file using the `keys` table
- Common patterns:
  - `jj`/`jk` for escape variations
  - `<C-s>` for save operations
  - Window navigation with `<C-h/j/k/l>`
  - Buffer navigation with `<S-h/l>` and `[b/]b`
  - Tab operations with `te`, `<tab>`, `<s-tab>`

### Key Keymap Categories
- **Session Management**: `<leader>w*` (wr=search, ws=save, wa=toggle)
- **Buffer Operations**: `<leader>b*` (bd=delete, bo=delete others, bD=delete+window)
- **LSP Operations**: `<leader>c*` (ca=code action, cr=rename)
- **Window Management**: `<leader>w*` (wd=close split)
- **File Navigation**: `-` (oil parent dir), `<leader>-` (oil root)

### Colorscheme
- Currently using solarized-osaka with transparency enabled
- Multiple alternative colorschemes are available but commented out in `lua/plugins/ui/colorscheme.lua`
- Alternatives include: cyberdream, github-theme, bluloco, catppuccin

### Tool Installation
Mason automatically installs these tools:
- Language servers: astro-language-server, css-lsp, docker-compose-language-service, dockerfile-language-server, eslint-lsp, pyright, tailwindcss-language-server, vtsls
- Formatters: prettier, prettierd, stylua, ruff
- Debuggers: debugpy, js-debug-adapter
- Linters: hadolint, ruff-lsp
- Other tools: neocmakelsp

### Performance Optimizations
- Disabled default vim plugins: gzip, tarPlugin, zipPlugin, netrwPlugin, matchit, matchparen, shada, spellfile
- Lazy loading enabled for most plugins with appropriate triggers
- Oil.nvim explicitly set to `lazy = false` due to recommended practices

### AI/Code Assistance Integration
- Multiple AI coding assistants available: copilot, claude-code.nvim
- Optional: codecompanion, avante (commented out)
- Completion integration through nvim-cmp with codecompanion source
- claude-code.nvim: Terminal-based Claude integration with split support

## Development Workflow

### Making Plugin Changes
1. Add new plugins to appropriate category directory under `lua/plugins/`
2. Import the plugin in `lua/lazy-init.lua` using the import pattern
3. Define plugin-specific keymaps within the plugin file using `keys` table
4. Use `:Lazy sync` to install/update plugins

### Adding Language Support
1. Create language-specific config in `lua/plugins/languages/`
2. Add LSP server to ensure_installed list in `lua/plugins/coding/lspconfig.lua`
3. Add formatters/linters to respective plugin configurations

### Keymap Conventions
- Use descriptive `desc` fields for all keymaps
- Group related functionality under common leader key prefixes
- Define plugin-specific keymaps within plugin files, not globally
- Use `noremap = true, silent = true` for most mappings

## Neovim Diff Preview Tools

IMPORTANT: This project has Neovim diff preview tools available. You MUST use these tools for ALL file operations:

- **ALWAYS use `nvim_edit_with_diff`** instead of `Edit` for editing files
- **ALWAYS use `nvim_write_with_diff`** instead of `Write` for writing/creating files

These tools will show changes in Neovim before applying them, allowing the user to review and approve/reject changes interactively.

### Why use these tools?
1. Users can see exactly what changes will be made before they're applied
2. Changes can be reviewed in Neovim's familiar diff interface
3. Users maintain full control over what modifications are accepted

### Usage:
When you need to edit or write files, use:
- `nvim_edit_with_diff` with parameters: file_path, old_string, new_string
- `nvim_write_with_diff` with parameters: file_path, content

DO NOT use the standard Edit/Write tools when these Neovim-specific tools are available.
