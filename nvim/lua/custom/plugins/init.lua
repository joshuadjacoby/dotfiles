return {
  { -- GitHub integration
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'ibhagwan/fzf-lua',
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('octo').setup { picker = 'fzf-lua' }
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
    opts = {},
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
      --     prompt = 'Live Grep in Open Files> ',
      --     grep_open_files = true,
      --   }
      -- end, { desc = '[S]earch [/] in Open Files' })

      vim.keymap.set('n', '<leader>sn', function()
        builtin.files {
          prompt = 'Search Neovim files> ',
          cwd = vim.fn.stdpath 'config',
        }
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
  { -- Workspace
    'thaerkh/vim-workspace',
    config = function()
      vim.keymap.set('n', '<leader>tw', '<cmd>ToggleWorkspace<CR>', { desc = '[T]oggle [W]orkspace' })
    end,
  },
}
