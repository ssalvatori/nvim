return {
  'ambaradan/nvim-mkdocs-material',
  url = 'https://codeberg.org/ambaradan/nvim-mkdocs-material.git',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    -- require('nvim_mkdocs-material').setup {
    --   -- your custom config here
    -- }
  end,
}
