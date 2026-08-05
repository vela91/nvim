vim.api.nvim_set_keymap(
  'n',
  '<Space>',
  '<Nop>',
  { noremap = true, silent = true }
)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

require 'globals'

if vim.g.vscode then
  -- Modo VSCode-Neovim: config mínima y plugins de edición pura
  require 'vscode-init'
  return
end

require 'options'
require 'keymaps'
require 'lazy-init'

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
