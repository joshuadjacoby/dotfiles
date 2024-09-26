return {
  { -- GitHub integration
    'pwntester/octo.nvim',
    enabled = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'ibhagwan/fzf-lua',
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('octo').setup { picker = 'fzf-lua' }
    end,
  },
  { -- Buffers in the tabline
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('bufferline').setup {}
      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { desc = '[B]uffer: ' .. desc })
      end

      -- Move to previous/next
      map('<A-,>', '<Cmd>BufferLineCyclePrev<CR>', 'Previous')
      map('<A-.>', '<Cmd>BufferLineCycleNext<CR>', 'Next')
      -- Re-order to previous/next
      map('<A-<>', '<Cmd>BufferLineMovePrev<CR>', 'Move Previous')
      map('<A->>', '<Cmd>BufferLineMoveNext<CR>', 'Move Next')
      -- Goto buffer in position...
      map('<A-1>', '<Cmd>BufferLineGoToBuffer 1<CR>', 'Goto 1')
      map('<A-2>', '<Cmd>BufferLineGoToBuffer 2<CR>', 'Goto 2')
      map('<A-3>', '<Cmd>BufferLineGoToBuffer 3<CR>', 'Goto 3')
      map('<A-4>', '<Cmd>BufferLineGoToBuffer 4<CR>', 'Goto 4')
      map('<A-5>', '<Cmd>BufferLineGoToBuffer 5<CR>', 'Goto 5')
      map('<A-6>', '<Cmd>BufferLineGoToBuffer 6<CR>', 'Goto 6')
      map('<A-7>', '<Cmd>BufferLineGoToBuffer 7<CR>', 'Goto 7')
      map('<A-8>', '<Cmd>BufferLineGoToBuffer 8<CR>', 'Goto 8')
      map('<A-9>', '<Cmd>BufferLineGoToBuffer 9<CR>', 'Goto 9')
      map('<A-0>', '<Cmd>BufferLineGoToBuffer -1<CR>', 'Goto Last')
      -- Pin/unpin buffer
      -- map('<A-p>', '<Cmd>BufferLineTogglePin<CR>', 'Pin')
      -- Close buffer
      map('<leader>bc', '<Cmd>BufferLinePickClose<CR>', 'Pick [C]lose')
      -- Close commands
      map('<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', 'Close [O]thers')
      map('<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', 'Close [L]eft')
      map('<leader>br', '<Cmd>BufferLineCloseRight<CR>', 'Close [R]ight')
      -- Magic buffer-picking mode
      map('<C-p>', '<Cmd>BufferLinePick<CR>', 'Pick')
      -- Sort automatically by...
      map('<leader>bd', '<Cmd>BufferLineSortByDirectory<CR>', 'Order By [D]irectory')
      map('<leader>be', '<Cmd>BufferLineSortByExtension<CR>', 'Order By [E]xtension')
      map('<leader>bt', '<Cmd>BufferLineSortByTabs<CR>', 'Order By [T]abs')
    end,
  },
  { -- Buffers in the tabline
    'romgrk/barbar.nvim',
    enabled = false,
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font }, -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    config = function()
      require('barbar').setup {
        animation = false,
      }

      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { desc = '[B]uffer: ' .. desc })
      end

      -- Move to previous/next
      map('<A-,>', '<Cmd>BufferPrevious<CR>', 'Previous')
      map('<A-.>', '<Cmd>BufferNext<CR>', 'Next')
      -- Re-order to previous/next
      map('<A-<>', '<Cmd>BufferMovePrevious<CR>', 'Move Previous')
      map('<A->>', '<Cmd>BufferMoveNext<CR>', 'Move Next')
      -- Goto buffer in position...
      map('<A-1>', '<Cmd>BufferGoto 1<CR>', 'Goto 1')
      map('<A-2>', '<Cmd>BufferGoto 2<CR>', 'Goto 2')
      map('<A-3>', '<Cmd>BufferGoto 3<CR>', 'Goto 3')
      map('<A-4>', '<Cmd>BufferGoto 4<CR>', 'Goto 4')
      map('<A-5>', '<Cmd>BufferGoto 5<CR>', 'Goto 5')
      map('<A-6>', '<Cmd>BufferGoto 6<CR>', 'Goto 6')
      map('<A-7>', '<Cmd>BufferGoto 7<CR>', 'Goto 7')
      map('<A-8>', '<Cmd>BufferGoto 8<CR>', 'Goto 8')
      map('<A-9>', '<Cmd>BufferGoto 9<CR>', 'Goto 9')
      map('<A-0>', '<Cmd>BufferLast<CR>', 'Goto Last')
      -- Pin/unpin buffer
      map('<A-p>', '<Cmd>BufferPin<CR>', 'Pin')
      -- Close buffer
      map('<A-c>', '<Cmd>BufferClose<CR>', 'Close')
      -- Restore buffer
      map('<A-s-c>', '<Cmd>BufferRestore<CR>', 'Restore')
      -- Wipeout buffer
      --                 :BufferWipeout
      -- Close commands
      --                 :BufferCloseAllButCurrent
      --                 :BufferCloseAllButPinned
      --                 :BufferCloseAllButCurrentOrPinned
      --                 :BufferCloseBuffersLeft
      --                 :BufferCloseBuffersRight
      -- Magic buffer-picking mode
      map('<C-p>', '<Cmd>BufferPick<CR>', 'Pick')
      -- Sort automatically by...
      map('<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', 'Order By [B]uffer Number')
      map('<leader>bn', '<Cmd>BufferOrderByName<CR>', 'Order By [N]ame')
      map('<leader>bd', '<Cmd>BufferOrderByDirectory<CR>', 'Order By [D]irectory')
      map('<leader>bl', '<Cmd>BufferOrderByLanguage<CR>', 'Order By [L]anguage')
      map('<leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>', 'Order By [W]indow Number')

      -- Other:
      -- :BarbarEnable - enables barbar (enabled by default)
      -- :BarbarDisable - very bad command, should never be used
    end,
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  { -- Session
    'rmagatti/auto-session',
    dependencies = {
      {
        'tiagovla/scope.nvim',
        config = true,
      },
    },
    config = function()
      vim.opt.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions,globals'
      require('auto-session').setup {
        suppressed_dirs = { '~/', '~/projects', '~/Downloads', '/' },

        pre_save_cmds = {
          'ScopeSaveState',
        },

        post_restore_cmds = {
          'ScopeLoadState',
        },
      }
    end,
  },
  {
    'tiagovla/scope.nvim',
    config = function()
      require('scope').setup {}
      vim.keymap.set('n', '<leader>bm', '<cmd>ScopeMoveBuf<CR>', { desc = '[B]uffer: Scope [M]ove' })
    end,
  },
  { -- Better TypeScript LSP integration
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
  { -- Status Bar
    'nvim-lualine/lualine.nvim',
    dependencies = { { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font } },
    opts = {
      sections = {
        lualine_c = {
          function()
            return require('auto-session.lib').current_session_name(true)
          end,
        },
      },
    },
  },
  { -- Fzf
    'ibhagwan/fzf-lua',
    enabled = vim.g.use_fzf_lua,
    dependencies = { { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font } },
    config = function()
      require('fzf-lua').setup { 'telescope' }

      local builtin = require 'fzf-lua'
      vim.keymap.set('n', '<leader>sh', builtin.helptags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect builtin' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_cword, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics_workspace, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      vim.keymap.set('n', '<leader>/', function()
        builtin.blines {
          prompt = 'Current Buffer Fuzzy> ',
          winopts = {
            height = 0.3,
            width = 0.6,
          },
          previewer = false,
        }
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- Doesn't work like in telescope
      -- vim.keymap.set('n', '<leader>s/', function()
      --   builtin.live_grep {
      --     grep_open_files = true,
      --     prompt = 'Live Grep in Open Files> ',
      --   }
      -- end, { desc = '[S]earch [/] in Open Files' })

      vim.keymap.set('n', '<leader>sn', function()
        builtin.files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
  { -- Git
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gg', '<cmd>Git<CR>', { desc = '[G]it Summary' })
      vim.keymap.set('n', '<leader>gb', '<cmd>Git blame<CR>', { desc = '[G]it [B]lame' })
    end,
  },
  'mg979/vim-visual-multi', -- multiple cursors
  { -- new vim surround in lua
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    opts = {},
  },
  'google/vim-searchindex', -- display search index
  'romainl/vim-cool', -- auto clear highlight after search
  { -- JsDoc
    'heavenshell/vim-jsdoc',
    ft = { 'javascript', 'javascript.jsx', 'typescript', 'typescript.tsx' },
    build = 'make install',
  },
  'ntpeters/vim-better-whitespace', -- highlights trailing whitespace
}
