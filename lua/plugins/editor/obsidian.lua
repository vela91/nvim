return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'study',
        path = '~/Obsidian/Study',
      },
    },
    daily_notes = {
      folder = '',
      date_format = '%Y-%m-%d',
      alias_format = '%B %-d, %Y',
      default_tags = { 'daily-notes' },
    },
    templates = {
      folder = 'templates',
      date_format = '%Y-%m-%d',
      time_format = '%H:%M',
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    picker = {
      name = 'telescope.nvim',
    },
    preferred_link_style = 'wiki',
  },
  config = function(_, opts)
    require('obsidian').setup(opts)

    local cmp_ok, cmp = pcall(require, 'cmp')
    if cmp_ok then
      cmp.setup.filetype('markdown', {
        sources = cmp.config.sources({
          { name = 'obsidian' },
          { name = 'obsidian_new' },
          { name = 'obsidian_tag' },
        }, {
          { name = 'buffer' },
          { name = 'path' },
        }),
      })
    end
  end,
  keys = {
    { '<leader>z', nil, desc = 'Obsidian' },
    { '<leader>zo', '<cmd>ObsidianQuickSwitch<cr>', desc = 'Quick switch note' },
    { '<leader>zn', '<cmd>ObsidianNew<cr>', desc = 'New note' },
    { '<leader>zs', '<cmd>ObsidianSearch<cr>', desc = 'Search notes' },
    { '<leader>zt', '<cmd>ObsidianToday<cr>', desc = 'Today' },
    { '<leader>zy', '<cmd>ObsidianYesterday<cr>', desc = 'Yesterday' },
    { '<leader>zb', '<cmd>ObsidianBacklinks<cr>', desc = 'Backlinks' },
    { '<leader>zl', '<cmd>ObsidianLinks<cr>', desc = 'Links in note' },
    { '<leader>zf', '<cmd>ObsidianFollowLink<cr>', desc = 'Follow link' },
    { '<leader>zk', '<cmd>ObsidianToggleCheckbox<cr>', desc = 'Toggle checkbox' },
  },
}
