vim.pack.add {
  'https://github.com/OXY2DEV/markview.nvim',
  'https://github.com/saghen/blink.cmp',
  'https://github.com/nvim-tree/nvim-web-devicons',
}

require('markview').setup {
  preview = { enable = false },
}
