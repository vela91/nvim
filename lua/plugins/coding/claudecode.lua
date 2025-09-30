return {
  'greggh/claude-code.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    window = {
      position = 'vertical', -- 'botright' (horizontal), 'vertical', 'topleft', 'float'
      split_ratio = 0.4,     -- porcentaje de pantalla (0.4 = 40%)
    },
    keymaps = {
      window_navigation = true, -- Enable <C-h/j/k/l> navigation
    },
    welcome_message = true,
    use_prompt = true,
  },
  keys = {
    { '<leader>a',  nil,                       desc = 'AI/Claude' },
    { '<leader>aa', '<cmd>ClaudeCode<cr>',     desc = 'Toggle Claude Code' },
    { '<leader>aq', '<cmd>ClaudeCodeQuit<cr>', desc = 'Quit Claude Code' },
  },
}
