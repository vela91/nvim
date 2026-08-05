-- Entrada cuando Neovim corre embebido en VSCode (vim.g.vscode == 1).
-- Solo carga opciones y keymaps útiles dentro del buffer, y una spec mínima
-- de plugins de edición pura. VSCode provee LSP, completion, file explorer,
-- git, fuzzy finder, terminal y colorscheme.

-- Opciones mínimas relevantes en VSCode
vim.opt.clipboard = 'unnamedplus'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undofile = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Keymaps de edición pura (no interactúan con UI de VSCode).
-- NOTA: mappings de insert mode (`jj`, `jk`) NO se ponen aquí: VSCode-Neovim
-- intercepta el insert mode y Neovim no ve las teclas. Usa la opción
-- `vscode-neovim.compositeKeys` en settings.json de VSCode.
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Indent en visual sin perder selección
keymap.set('v', '<', '<gv', opts)
keymap.set('v', '>', '>gv', opts)

-- Helper para invocar comandos de VSCode desde mappings de Neovim
local function vsc(cmd)
  return function()
    vim.fn.VSCodeNotify(cmd)
  end
end

-- Leaders que delegan en comandos de VSCode
keymap.set('n', '<leader>e', vsc 'workbench.action.toggleSidebarVisibility', { desc = 'Toggle Explorer/Sidebar' })
keymap.set('n', '<leader><leader>', vsc 'workbench.action.quickOpen', { desc = 'Find Files' })
keymap.set('n', '<leader>f', vsc 'workbench.action.findInFiles', { desc = 'Find in Files' })
keymap.set('n', '<leader>g', vsc 'workbench.view.scm', { desc = 'Source Control' })
keymap.set('n', '<leader>cf', vsc 'editor.action.formatDocument', { desc = 'Format Document' })
keymap.set('n', '<leader>ca', vsc 'editor.action.quickFix', { desc = 'Code Action' })
keymap.set('n', '<leader>cr', vsc 'editor.action.rename', { desc = 'Rename Symbol' })
keymap.set('n', '<leader>bd', vsc 'workbench.action.closeActiveEditor', { desc = 'Close Editor' })

-- Splits / duplicar ventana
keymap.set('n', '<leader>wv', vsc 'workbench.action.splitEditor', { desc = 'Split Right (duplicar)' })
keymap.set('n', '<leader>ws', vsc 'workbench.action.splitEditorDown', { desc = 'Split Down (duplicar)' })
keymap.set('n', '<leader>wd', vsc 'workbench.action.closeActiveEditor', { desc = 'Close Split' })

-- Terminal
keymap.set('n', '<leader>tt', vsc 'workbench.action.terminal.toggleTerminal', { desc = 'Toggle Terminal' })
keymap.set('n', '<leader>tn', vsc 'workbench.action.terminal.new', { desc = 'New Terminal' })

-- LSP "intrínsecos" (sin leader) que delegan en VSCode
keymap.set('n', 'gd', vsc 'editor.action.revealDefinition', { desc = 'Go to Definition' })
keymap.set('n', 'gD', vsc 'editor.action.revealDeclaration', { desc = 'Go to Declaration' })
keymap.set('n', 'gr', vsc 'editor.action.referenceSearch.trigger', { desc = 'Find References' })
keymap.set('n', 'gi', vsc 'editor.action.goToImplementation', { desc = 'Go to Implementation' })
keymap.set('n', 'K', vsc 'editor.action.showHover', { desc = 'Hover Doc' })
keymap.set('n', '[d', vsc 'editor.action.marker.prev', { desc = 'Prev Diagnostic' })
keymap.set('n', ']d', vsc 'editor.action.marker.next', { desc = 'Next Diagnostic' })

-- Acción global invocada desde settings.json (compositeKeys de vscode-neovim)
-- para reproducir el comportamiento de `jk` → Esc + guardar.
function _G.JKEscapeSave()
  vim.api.nvim_input('<Esc>')
  vim.schedule(function()
    pcall(vim.fn.VSCodeCall, 'workbench.action.files.save')
  end)
end

require 'lazy-init-vscode'
