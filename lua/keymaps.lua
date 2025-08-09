local keymap = vim.keymap
local opts = { noremap = true, silent = true }
-- Lazy
vim.keymap.set('n', '<leader>ll', ':Lazy<CR>', { desc = 'Lazy load' })
vim.keymap.set('n', '<leader>qq', ':qa<CR>', { desc = 'quit neovim' })

-- Clear highlights on search when pressing <Esc> in normal mode
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
keymap.set('i', 'jj', '<Esc>')
keymap.set('i', 'jk', '<Esc>:w<CR>', { noremap = true, silent = true })
keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
keymap.set('i', '<C-s>', '<Esc>:w<CR>a', { noremap = true, silent = true })

-- Split windows
keymap.set('n', 'ss', ':vsplit<Return>', opts)
keymap.set('n', 'sv', ':split<Return>', opts)

-- Window navigation
keymap.set('n', '<C-h>', '<C-w>h', opts)
keymap.set('n', '<C-j>', '<C-w>j', opts)
keymap.set('n', '<C-k>', '<C-w>k', opts)
keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Tabs
keymap.set('n', 'te', ':tabedit', opts)
keymap.set('n', '<tab>', ':tabnext<Return>', opts)
keymap.set('n', '<s-tab>', ':tabprev<Return>', opts)
keymap.set('n', '<leader><tab>d', ':tabclose<Return>', opts)

-- IncRename
vim.keymap.set('n', '<leader>cr', function()
  return ':IncRename ' .. vim.fn.expand '<cword>'
end, { desc = 'LSP Rename', expr = true })

-- Show notifications history
keymap.set('n', '<leader>n', function()
  Snacks.notifier.show_history()
end, { desc = 'Notifications' })

-- Buffers
keymap.set('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
keymap.set('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
keymap.set('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
keymap.set('n', ']b', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
keymap.set('n', '<leader>bd', function()
  Snacks.bufdelete()
end, { desc = 'Delete Buffer' })
keymap.set('n', '<leader>bo', function()
  Snacks.bufdelete.other()
end, { desc = 'Delete Other Buffers' })
keymap.set(
  'n',
  '<leader>bD',
  '<cmd>:bd<cr>',
  { desc = 'Delete Buffer and Window' }
)
keymap.set(
  'n',
  '<leader>wd',
  '<cmd>:close<cr>',
  { desc = 'Close Split Window' }
)

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup(
    'kickstart-highlight-yank',
    { clear = true }
  ),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Better indenting
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')

-- oil pluging
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
