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
-- return {
--   'craftzdog/solarized-osaka.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require('solarized-osaka').setup {
--       transparent = true,
--       italic_comments = true,
--       borderless_telescope = false,
--     }
--     vim.cmd [[colorscheme solarized-osaka]]
--   end,
-- }

-- Or with configuration
return {
  'projekt0n/github-nvim-theme',
  name = 'github-theme',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('github-theme').setup {
      -- ...
    }

    vim.cmd 'colorscheme github_light'
  end,
}
