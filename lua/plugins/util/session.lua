return {
  'rmagatti/auto-session',
  lazy = false,
  keys = {
    { '<leader>wr', '<cmd>AutoSession search<CR>', desc = 'Session search' },
    { '<leader>ws', '<cmd>AutoSession save<CR>', desc = 'Save session' },
    { '<leader>wa', '<cmd>AutoSession toggle<CR>', desc = 'Toggle autosave' },
  },
  opts = {
    auto_session_suppress_dirs = { '~/' },
    session_lens = {
      load_on_setup = true,
      picker_opts = {
        theme_conf = {
          border = true,
          position = 'bottom',
          width = 80,
          height = 16,
        },
        previewer = false,
      },
      mappings = {
        delete_session = { 'i', '<C-d>' },
        alternate_session = { 'i', '<C-s>' },
        copy_session = { 'i', '<C-y>' },
      },
    },
  },
}
