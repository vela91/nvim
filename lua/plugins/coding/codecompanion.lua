-- Define a prefix for leader-based keymaps
local prefix = '<leader>a'

return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    cmd = {
      'CodeCompanion',
      'CodeCompanionActions',
      'CodeCompanionToggle',
      'CodeCompanionAdd',
      'CodeCompanionChat',
    },
    keys = {
      -- Action Palette
      {
        prefix .. 'a',
        '<cmd>CodeCompanionActions<CR>',
        mode = { 'n', 'v' },
        desc = 'Action Palette',
      },
      -- Start a New Chat
      {
        prefix .. 'c',
        '<cmd>CodeCompanionChat<CR>',
        mode = { 'n', 'v' },
        desc = 'New Chat',
      },
      -- Add Code (visual mode only)
      {
        prefix .. 'A',
        '<cmd>CodeCompanionAdd<CR>',
        mode = 'v',
        desc = 'Add Code',
      },
      -- Inline Prompt
      {
        prefix .. 'i',
        '<cmd>CodeCompanion<CR>',
        mode = 'n',
        desc = 'Inline Prompt',
      },
      -- Toggle Chat
      {
        prefix .. 'C',
        '<cmd>CodeCompanionToggle<CR>',
        mode = 'n',
        desc = 'Toggle Chat',
      },
    },
    opts = {
      -- Define strategies for chat and inline prompts
      strategies = {
        chat = {
          adapter = 'copilot', -- Use Copilot as the backend for chat
        },
        inline = {
          adapter = 'copilot', -- Use Copilot for inline prompts
        },
      },
      -- Additional options
      log_level = 'DEBUG', -- Set log level to DEBUG for detailed output
    },
  },
}
