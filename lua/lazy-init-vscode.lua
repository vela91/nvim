local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require('lazy').setup({
  spec = {
    {
      'echasnovski/mini.nvim',
      event = 'VeryLazy',
      config = function()
        require('mini.ai').setup { n_lines = 500 }

        require('mini.surround').setup {
          mappings = {
            add = 'gza',
            delete = 'gzd',
            find = 'gzf',
            find_left = 'gzF',
            highlight = 'gzh',
            replace = 'gzr',
            update_n_lines = 'gzn',
          },
        }

        require('mini.comment').setup()

        require('mini.move').setup {
          mappings = {
            left = 'H',
            right = 'L',
            down = 'J',
            up = 'K',
            line_left = '',
            line_right = '',
            line_down = '',
            line_up = '',
          },
        }
      end,
    },

    {
      'ggandor/flit.nvim',
      keys = function()
        local ret = {}
        for _, key in ipairs { 'f', 'F', 't', 'T' } do
          ret[#ret + 1] = { key, mode = { 'n', 'x', 'o' } }
        end
        return ret
      end,
      opts = { labeled_modes = 'nx' },
    },
    {
      'ggandor/leap.nvim',
      keys = {
        { 's', mode = { 'n', 'x', 'o' }, desc = 'Leap Forward to' },
        { 'S', mode = { 'n', 'x', 'o' }, desc = 'Leap Backward to' },
        { 'gs', mode = { 'n', 'x', 'o' }, desc = 'Leap from Windows' },
      },
      config = function()
        require('leap').add_default_mappings(true)
        pcall(vim.keymap.del, { 'x', 'o' }, 'x')
        pcall(vim.keymap.del, { 'x', 'o' }, 'X')
      end,
    },
    { 'tpope/vim-repeat', event = 'VeryLazy' },

    {
      'nvim-treesitter/nvim-treesitter',
      branch = 'master',
      build = ':TSUpdate',
      main = 'nvim-treesitter.configs',
      event = { 'BufReadPost', 'BufNewFile' },
      dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
      opts = {
        ensure_installed = { 'lua', 'vim', 'vimdoc' },
        auto_install = true,
        -- VSCode maneja highlighting nativo; lo dejamos apagado para no duplicar
        highlight = { enable = false },
        indent = { enable = true, disable = { 'ruby' } },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              [']f'] = '@function.outer',
              [']c'] = '@class.outer',
            },
            goto_previous_start = {
              ['[f'] = '@function.outer',
              ['[c'] = '@class.outer',
            },
          },
        },
      },
    },

    {
      'ThePrimeagen/harpoon',
      branch = 'harpoon2',
      opts = {
        settings = { save_on_toggle = true },
      },
      keys = function()
        local keys = {
          {
            '<leader>H',
            function()
              require('harpoon'):list():add()
            end,
            desc = 'Harpoon File',
          },
          {
            '<leader>h',
            function()
              local harpoon = require 'harpoon'
              harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
            desc = 'Harpoon Quick Menu',
          },
        }
        for i = 1, 5 do
          table.insert(keys, {
            '<leader>' .. i,
            function()
              require('harpoon'):list():select(i)
            end,
            desc = 'Harpoon to File ' .. i,
          })
        end
        return keys
      end,
    },
  },
  defaults = {},
  rocks = { enabled = false },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'tarPlugin',
        'zipPlugin',
        'netrwPlugin',
        'matchit',
        'matchparen',
        'shada',
        'spellfile',
      },
    },
  },
}, {})
