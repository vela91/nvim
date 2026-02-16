-- return {
--   {
--     'scottmckendry/cyberdream.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require('cyberdream').setup {
--         transparent = true,
--         italic_comments = true,
--         borderless_telescope = false,
--       }
--       vim.cmd [[colorscheme cyberdream]]
--     end,
--   },
-- }
--
return {
  'craftzdog/solarized-osaka.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('solarized-osaka').setup {
      transparent = true,
      italic_comments = true,
      borderless_telescope = false,
    }
    vim.cmd [[colorscheme solarized-osaka]]

    -- Copilot highlight
    vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = '#6CC644' })

    -- Diff colors: right/proposed (green tones)
    vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#1a3a2a' })
    vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#1a2a3a' })
    vim.api.nvim_set_hl(0, 'DiffText', { bg = '#2a4a3a', bold = true })
    vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#2a1a1a' })
    -- Diff colors: left/original (red tones) - used via winhighlight
    vim.api.nvim_set_hl(0, 'DiffAddOld', { bg = '#3a1a1a' })
    vim.api.nvim_set_hl(0, 'DiffChangeOld', { bg = '#2a1a2a' })
    vim.api.nvim_set_hl(0, 'DiffTextOld', { bg = '#4a2222', bold = true })
    vim.api.nvim_set_hl(0, 'DiffDeleteOld', { bg = '#2a1a1a' })

    -- Apply red highlights to left diff window (original)
    vim.api.nvim_create_autocmd('BufWinEnter', {
      callback = function()
        vim.schedule(function()
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            if vim.wo[win].diff then
              local buf = vim.api.nvim_win_get_buf(win)
              local name = vim.api.nvim_buf_get_name(buf)
              if not name:match('%(proposed%)') then
                vim.wo[win].winhighlight = 'DiffAdd:DiffAddOld,DiffChange:DiffChangeOld,DiffText:DiffTextOld,DiffDelete:DiffDeleteOld'
              else
                vim.wo[win].winhighlight = ''
              end
            end
          end
        end)
      end,
    })
  end,
}

-- Or with configuration
-- return {
--   'projekt0n/github-nvim-theme',
--   name = 'github-theme',
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     require('github-theme').setup {
--       -- ...
--     }
--
--     vim.cmd 'colorscheme github_light'
--   end,
-- }
-- return {
--   {
--     'uloco/bluloco.nvim',
--     lazy = false,
--     priority = 1000,
--     dependencies = { 'rktjmp/lush.nvim' },
--     config = function()
--       require('bluloco').setup {
--         style = 'light', -- "auto" | "dark" | "light"
--       }
--       vim.cmd 'colorscheme bluloco'
--     end,
--   },
-- }

-- return {
--   'catppuccin/nvim',
--   name = 'catppuccin',
--   priority = 1000,
--   config = function()
--     require('catppuccin').setup {
--       flavour = 'auto', -- latte, frappe, macchiato, mocha
--       background = { -- :h background
--         light = 'latte',
--         dark = 'macchiato',
--       },
--       transparent_background = false, -- disables setting the background color.
--       show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
--       term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
--       dim_inactive = {
--         enabled = false, -- dims the background color of inactive window
--         shade = 'dark',
--         percentage = 0.15, -- percentage of the shade to apply to the inactive window
--       },
--       no_italic = false, -- Force no italic
--       no_bold = false, -- Force no bold
--       no_underline = false, -- Force no underline
--       styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
--         comments = { 'italic' }, -- Change the style of comments
--         conditionals = { 'italic' },
--         loops = {},
--         functions = {},
--         keywords = {},
--         strings = {},
--         variables = {},
--         numbers = {},
--         booleans = {},
--         properties = {},
--         types = {},
--         operators = {},
--         -- miscs = {}, -- Uncomment to turn off hard-coded styles
--       },
--       color_overrides = {},
--       custom_highlights = {},
--       default_integrations = true,
--       integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         treesitter = true,
--         notify = false,
--         mini = {
--           enabled = true,
--           indentscope_color = '',
--         },
--         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--       },
--     }
--
--     -- setup must be called before loading
--     vim.cmd.colorscheme 'catppuccin'
-- end,
-- }
