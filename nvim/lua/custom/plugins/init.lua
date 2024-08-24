-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { -- Fzf
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- calling `setup` is optional for customization
      require('fzf-lua').setup()
      vim.keymap.set('n', ';', require('fzf-lua').files, { desc = 'Fzf Files' })
      vim.keymap.set('n', '<C-f>', require('fzf-lua').live_grep, { desc = 'Fzf Rg' })
    end,
    enabled = false,
  },
  { -- Git
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gg', '<cmd>Git<CR>', { desc = '[G]it Summary' })
      vim.keymap.set('n', '<leader>gb', '<cmd>Git blame<CR>', { desc = '[G]it [B]lame' })
    end,
  },
  'mg979/vim-visual-multi', -- multiple cursors
  'tpope/vim-surround', -- modify surroundings eg. parens, brackets
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
