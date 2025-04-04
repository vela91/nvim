vim.api.nvim_set_keymap(
  'n',
  '<Space>',
  '<Nop>',
  { noremap = true, silent = true }
)
vim.g.mapleader = ' '
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

require 'globals'
require 'options'
require 'keymaps'
require 'lazy-init'

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'astro',
--   callback = function()
--     vim.opt_local.tabstop = 2
--     vim.opt_local.shiftwidth = 2
--     vim.opt_local.expandtab = true
--   end,
-- })
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
