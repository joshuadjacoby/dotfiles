-- Nvim-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-tree/nvim-tree.lua

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '\\', ':NvimTreeFindFileToggle<CR>', desc = 'NvimTreeFindFileToggle' },
  },
  config = function()
    require('nvim-tree').setup {
      filters = {
        dotfiles = true,
      },
    }
  end,
}
