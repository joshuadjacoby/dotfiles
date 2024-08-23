-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { -- Git
    'tpope/vim-fugitive',
    init = function()
      vim.keymap.set('n', '<leader>gg', '<cmd>Git<CR>', { desc = '[G]it Summary' })
    end,
  },
  'mg979/vim-visual-multi', -- multiple cursors
  'tipe/vim-surround', -- modify surroundings eg. parens, brackets
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
    init = function()
      vim.keymap.set('n', '<leader>tw', '<cmd>ToggleWorkspace<CR>', { desc = '[T]oggle [W]orkspace' })
    end,
  },
}
