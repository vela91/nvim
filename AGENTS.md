# Repository Guidelines

## Project Structure & Module Organization
- `init.lua` bootstraps LazyVim, loads `lua/lazy-init.lua`, and wires globals, options, and keymaps.
- `lua/` holds topic modules: `globals.lua`, `options.lua`, `keymaps.lua`, and health checks in `health.lua`.
- Plugin specs sit in `lua/plugins/<domain>/`, grouped by concern (coding, ui, test); prefer new files over growing monoliths.
- `lazy-lock.json` pins plugin commits; update it via `:Lazy sync` and commit the resulting diff when dependencies change.
- `stylua.toml` defines the formatting contract for all Lua code here.

## Build, Test, and Development Commands
- Run `nvim --headless "+Lazy sync" +qa` after dependency edits to install or update plugins deterministically.
- Use `nvim --headless "+Lazy clean" +qa` before submitting to prune unused specs and catch accidental renames.
- Validate editor health with `nvim --headless "+checkhealth" +qa`; investigate any failing sections in `lua/health.lua`.
- Format Lua sources with `stylua lua/ init.lua` before committing.

## Coding Style & Naming Conventions
- Follow `stylua.toml`: 2-space indentation, Unix line endings, and prefer single quotes unless Lua interpolation requires double quotes.
- Keep module names snake_case; plugin spec files should mirror the plugin’s primary namespace (for example, `lua/plugins/coding/conform.lua`).
- Wrap non-trivial configuration blocks in helpers so they compose cleanly with Lazy’s `opts` tables.

## Testing Guidelines
- Use Neotest (`lua/plugins/test/core.lua`): `<leader>tt` runs the current file, `<leader>tr` runs the nearest test, and failures flow into Trouble for triage.
- For CI-style checks, run `nvim --headless "+lua require('neotest').run.run(vim.fn.getcwd())" +qa` to execute active adapters.
- Record new adapters or custom assertions in `lua/plugins/test/` and document external runtime needs alongside the spec.

## Commit & Pull Request Guidelines
- Commit subjects should be present-tense, imperative, and concise (`add neotest vitest adapter`, `tune cmp sources`); keep related changes together.
- When dependencies shift, include the relevant excerpt of `lazy-lock.json` so reviewers can audit version bumps.
- Pull requests should note user-facing impact, reference any linked issue, and list the commands you ran (`:Lazy sync`, `:checkhealth`, Neotest invocations). Attach screenshots or terminal excerpts for UI-affecting changes.

## Agent-Specific Instructions
- Cross-check automation updates with `CLAUDE.md`; apply the same conventions to any agent-specific prompt files you add.
- Keep agent setup scripts idempotent and document required environment variables near the top of the consumer file.
- When introducing AI-focused tooling, place shared utilities in `lua/plugins/util/` and gate experimental features behind toggles in `lua/globals.lua`.
