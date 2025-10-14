return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      open_mapping = [[<C-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      direction = 'vertical', -- puede ser 'vertical' o 'horizontal'
      size = 70,
      float_opts = { border = 'curved' },
    }

    -- Keymap alternativo
    vim.keymap.set('n', '<leader>t', '<cmd>ToggleTerm<CR>', { desc = 'Toggle terminal' })
  end,
}
