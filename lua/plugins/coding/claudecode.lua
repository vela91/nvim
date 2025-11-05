-- -- Claude Code integration for terminal-based AI assistance (testing diff functionality)
-- return {
--   'greggh/claude-code.nvim',
--   dependencies = {
--     'nvim-lua/plenary.nvim',
--     'MunifTanjim/nui.nvim',
--   },
--   opts = {
--     window = {
--       position = 'vertical', -- 'botright' (horizontal), 'vertical', 'topleft', 'float'
--       split_ratio = 0.4,     -- porcentaje de pantalla (0.4 = 40%)
--     },
--     keymaps = {
--       window_navigation = true, -- Enable <C-h/j/k/l> navigation
--     },
--     welcome_message = true,
--     use_prompt = true,
--   },
--   keys = {
--     { '<leader>a',  nil,                       desc = 'AI/Claude' },
--     { '<leader>aa', '<cmd>ClaudeCode<cr>',     desc = 'Toggle Claude Code' },
--     { '<leader>aq', '<cmd>ClaudeCodeQuit<cr>', desc = 'Quit Claude Code' },
--     {
--       '<leader>ap',
--       function()
--         -- Function to paste image from clipboard to Claude Code terminal
--         local function paste_image_to_claude()
--           -- Check if we're in a Claude Code window
--           local bufname = vim.api.nvim_buf_get_name(0)
--           if not string.match(bufname, 'claude%-code') then
--             vim.notify('Not in Claude Code terminal', vim.log.levels.WARN)
--             return
--           end
--
--           local filename = vim.fn.input('Image filename: ', 'image_' .. os.date('%Y%m%d_%H%M%S') .. '.png')
--           if filename == '' then
--             return
--           end
--
--           -- Create a temporary directory for images
--           local temp_dir = vim.fn.tempname() .. '_images'
--           vim.fn.mkdir(temp_dir, 'p')
--
--           local filepath = temp_dir .. '/' .. filename
--
--           -- Use xclip to save clipboard image (Linux/WSL)
--           local cmd = string.format('xclip -selection clipboard -t image/png -o > %s', vim.fn.shellescape(filepath))
--           local result = os.execute(cmd)
--
--           if result == 0 then
--             -- Send the image path to Claude Code terminal
--             local image_message = string.format('Here is an image I want to share: %s', filepath)
--
--             -- Insert the message in terminal mode
--             if vim.api.nvim_get_mode().mode == 't' then
--               -- If in terminal mode, type the message
--               vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, false, true), 'n', false)
--               vim.schedule(function()
--                 vim.api.nvim_feedkeys('i' .. image_message .. '<CR>', 'n', false)
--               end)
--             else
--               -- If not in terminal mode, put the text at cursor
--               vim.api.nvim_put({ image_message }, 'l', true, true)
--             end
--
--             vim.notify('Image pasted to Claude Code: ' .. filename)
--           else
--             vim.notify('Failed to paste image from clipboard. Make sure you have an image in clipboard and xclip installed.', vim.log.levels.ERROR)
--           end
--         end
--
--         paste_image_to_claude()
--       end,
--       desc = 'Paste image to Claude Code terminal',
--     },
--   },
-- }
--
--
--
--
--
--
-- Testing minimal diff preview
return {
  'coder/claudecode.nvim',
  dependencies = { 'folke/snacks.nvim' },
  opts = {
    diff_opts = {
      vertical_split = false,        -- Use horizontal split for better readability
      auto_close_on_accept = true,   -- Auto-close diff after accepting
      open_in_current_tab = true,    -- Open in current tab, not new ones
      keep_terminal_focus = true,    -- Return focus to terminal after diff opens
    },
  },
  keys = {
    { '<leader>a', nil, desc = 'AI/Claude Code' },
    { '<leader>ac', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
    { '<leader>af', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude' },
    { '<leader>ar', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume Claude' },
    {
      '<leader>aC',
      '<cmd>ClaudeCode --continue<cr>',
      desc = 'Continue Claude',
    },
    {
      '<leader>am',
      '<cmd>ClaudeCodeSelectModel<cr>',
      desc = 'Select Claude model',
    },
    { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current buffer' },
    {
      '<leader>as',
      '<cmd>ClaudeCodeSend<cr>',
      mode = 'v',
      desc = 'Send to Claude',
    },
    {
      '<leader>as',
      '<cmd>ClaudeCodeTreeAdd<cr>',
      desc = 'Add file',
      ft = { 'NvimTree', 'neo-tree', 'oil', 'minifiles', 'netrw' },
    },
    -- Diff management
    { '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
    { '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny diff' },
  },
}
