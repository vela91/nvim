return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  opts = {
    defaults = {
      file_ignore_patterns = {
        'node_modules',
        '%.git/',
        '^%.', -- archivos ocultos (que empiezan con punto)
      },
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
      },
    },
    pickers = {
      live_grep = {
        additional_args = { '--no-hidden' },
      },
      find_files = {
        hidden = false,
      },
    },
  },
  keys = {
    {
      '<leader><leader>',
      '<cmd>Telescope find_files<cr>',
      desc = 'Find files',
    },
    { '<leader>sg', '<cmd>Telescope live_grep<cr>', desc = 'Grep files' },
    { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
    { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help' },
  },
}
