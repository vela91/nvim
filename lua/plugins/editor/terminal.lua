-- Integración con Claude desactivada temporalmente (ver plugins/coding/claudecode.lua).
-- -- Cierra Claude si está visible para que el terminal pueda ocupar la columna derecha.
-- local function close_claude()
--   for _, win in ipairs(vim.api.nvim_list_wins()) do
--     local buf = vim.api.nvim_win_get_buf(win)
--     local name = vim.api.nvim_buf_get_name(buf)
--     if name:match('claude') or vim.bo[buf].filetype == 'snacks_terminal' then
--       pcall(vim.api.nvim_win_close, win, false)
--     end
--   end
-- end
--
-- -- Alterna toggleterm cerrando Claude primero si aún no había terminal abierto.
-- local function toggle_terminal()
--   local terms_ok, terms = pcall(require, 'toggleterm.terminal')
--   local any_open = false
--   if terms_ok then
--     for _, term in pairs(terms.get_all()) do
--       if term:is_open() then
--         any_open = true
--         break
--       end
--     end
--   end
--   if not any_open then
--     close_claude()
--   end
--   vim.cmd('ToggleTerm')
-- end

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      direction = 'vertical',
      size = 70,
      float_opts = { border = 'curved' },
    }

    vim.keymap.set({ 'n', 't' }, '<C-\\>', '<cmd>ToggleTerm<CR>', { desc = 'Toggle terminal' })
    vim.keymap.set('n', '<leader>t', '<cmd>ToggleTerm<CR>', { desc = 'Toggle terminal' })
  end,
}
