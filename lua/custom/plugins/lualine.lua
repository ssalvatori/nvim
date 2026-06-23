vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim'
})

require('lualine').setup {
  options = {
    theme = 'material',
    icons_enabled = true,
    component_separators = '|',
    section_separators = '',
  }
}
