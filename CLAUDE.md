# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

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
- **Completion**: nvim-cmp with multiple sources
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

### Indentation
- Uses 2 spaces for indentation across all files
- Configured in both init.lua and stylua.toml

### Key Bindings
- Leader key is set to Space
- Custom keymaps include jj/jk for escape, Ctrl+S for save
- LSP keybindings are configured in the lspconfig plugin file

### Colorscheme
- Currently using solarized-osaka with transparency enabled
- Multiple alternative colorschemes are available but commented out in `lua/plugins/ui/colorscheme.lua`

### Tool Installation
Mason automatically installs these tools:
- Language servers: astro, css, docker, eslint, pyright, tailwindcss, vtsls
- Formatters: prettier, prettierd, stylua, ruff
- Debuggers: debugpy, js-debug-adapter
- Linters: hadolint, ruff-lsp

## Security Note
The init.lua file contains an exposed OpenAI API key on line 13-14. This should be moved to environment variables or a secure configuration method before committing any changes.