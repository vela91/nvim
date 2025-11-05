return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    dependencies = {
      { 'zbirenbaum/copilot.lua' },
      { 'nvim-lua/plenary.nvim' },
    },
    opts = {
      debug = false,
      window = {
        layout = 'float', -- 'vertical', 'horizontal', 'float'
        width = 0.7, -- fractional width of parent
        height = 0.2, -- fractional height of parent
      },
      mappings = {
        complete = {
          detail = 'Use @<Tab> or /<Tab> for options.',
          insert = '<Tab>',
        },
        close = {
          normal = 'q',
          insert = '<C-c>',
        },
        reset = {
          normal = '<C-l>',
          insert = '<C-l>',
        },
        submit_prompt = {
          normal = '<CR>',
          insert = '<C-s>',
        },
        accept_diff = {
          normal = '<C-y>',
          insert = '<C-y>',
        },
        yank_diff = {
          normal = 'gy',
        },
        show_diff = {
          normal = 'gd',
        },
        show_system_prompt = {
          normal = 'gp',
        },
        show_user_selection = {
          normal = 'gs',
        },
      },
    },
    keys = {
      -- Quick chat
      {
        '<leader>ccq',
        function()
          local input = vim.fn.input 'Quick Chat: '
          if input ~= '' then
            require('CopilotChat').ask(
              input,
              { selection = require('CopilotChat.select').buffer }
            )
          end
        end,
        desc = 'CopilotChat - Quick chat',
      },
      -- Show help actions
      {
        '<leader>cch',
        function()
          local actions = require 'CopilotChat.actions'
          require('CopilotChat.integrations.telescope').pick(
            actions.help_actions()
          )
        end,
        desc = 'CopilotChat - Help actions',
      },
      -- Show prompts actions
      {
        '<leader>ccP',
        function()
          local actions = require 'CopilotChat.actions'
          require('CopilotChat.integrations.telescope').pick(
            actions.prompt_actions()
          )
        end,
        desc = 'CopilotChat - Prompt actions (list)',
      },
      -- Code related commands

      {
        '<leader>cce',
        '<cmd>CopilotChatExplain<cr>',
        desc = 'CopilotChat - Explain code',
      },
      {
        '<leader>cct',
        '<cmd>CopilotChatTests<cr>',
        desc = 'CopilotChat - Generate tests',
      },
      {
        '<leader>ccr',
        '<cmd>CopilotChatReview<cr>',
        desc = 'CopilotChat - Review code',
      },
      {
        '<leader>ccR',
        '<cmd>CopilotChatRefactor<cr>',
        desc = 'CopilotChat - Refactor code',
      },
      {
        '<leader>ccn',
        '<cmd>CopilotChatBetterNamings<cr>',
        desc = 'CopilotChat - Better Naming',
      },
      -- Chat commands
      {
        '<leader>ccv',
        '<cmd>CopilotChatToggle<cr>',
        desc = 'CopilotChat - Toggle',
      },
      {
        '<leader>ccx',
        '<cmd>CopilotChatReset<cr>',
        desc = 'CopilotChat - Reset',
      },
      {
        '<leader>ccs',
        '<cmd>CopilotChatStop<cr>',
        desc = 'CopilotChat - Stop',
      },
      -- Custom prompts
      {
        '<leader>ccd',
        '<cmd>CopilotChatDocs<cr>',
        desc = 'CopilotChat - Write documentation',
        mode = { 'n', 'v' },
      },
      {
        '<leader>ccf',
        '<cmd>CopilotChatFix<cr>',
        desc = 'CopilotChat - Fix code',
        mode = { 'n', 'v' },
      },
      {
        '<leader>cco',
        '<cmd>CopilotChatOptimize<cr>',
        desc = 'CopilotChat - Optimize code',
        mode = { 'n', 'v' },
      },
      {
        '<leader>ccp',
        '<cmd>CopilotChatPrompt<cr>',
        desc = 'CopilotChat - Refine Prompt for Clarity',
        mode = { 'n', 'v' },
      },
    },
    config = function(_, opts)
      local chat = require 'CopilotChat'
      local select = require 'CopilotChat.select'

      -- Override default prompts
      opts.prompts = {
        Explain = {
          prompt = '/COPILOT_EXPLAIN Escribe una explicación del código seleccionado como párrafos de texto.',
        },
        Review = {
          prompt = '/COPILOT_REVIEW Revisa el código seleccionado.',
        },
        Fix = {
          prompt = '/COPILOT_GENERATE Hay un problema en este código. Reescribe el código para mostrármelo con el bug corregido.',
        },
        Optimize = {
          prompt = '/COPILOT_GENERATE Optimiza el código seleccionado para mejorar el rendimiento y legibilidad.',
        },
        Docs = {
          prompt = '/COPILOT_GENERATE Agrega documentación al código seleccionado.',
        },
        Prompt = {
          prompt = '/COPILOT_GENERATE Ayúdame a reformular el prompt para que sea más claro y directo. Podemos iterar varias veces hasta perfeccionarlo.',
        },
        Tests = {
          prompt = '/COPILOT_GENERATE Genera tests para mi código.',
        },
        FixDiagnostic = {
          prompt = 'Por favor ayuda con el siguiente problema de diagnóstico en el archivo:',
          selection = select.diagnostics,
        },
        Commit = {
          prompt = 'Escribe un mensaje de commit para el cambio con convenciones de commits convencionales. Asegúrate de que el título tenga un máximo de 50 caracteres y el mensaje esté envuelto en 72 caracteres. Envuelve todo el mensaje en un bloque de código con el lenguaje gitcommit.',
          selection = select.gitdiff,
        },
        CommitStaged = {
          prompt = 'Escribe un mensaje de commit para el cambio con convenciones de commits convencionales. Asegúrate de que el título tenga un máximo de 50 caracteres y el mensaje esté envuelto en 72 caracteres. Envuelve todo el mensaje en un bloque de código con el lenguaje gitcommit.',
          selection = function(source)
            return select.gitdiff(source, true)
          end,
        },
      }

      chat.setup(opts)

      -- Setup autocommands
      vim.api.nvim_create_autocmd('BufEnter', {
        pattern = 'copilot-*',
        callback = function()
          vim.opt_local.relativenumber = true
          vim.opt_local.number = true
        end,
      })
    end,
  },
}
