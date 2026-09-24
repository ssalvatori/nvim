-- [[
--  This plugin is designed to enhance the built-in search functionality of Neovim.
--  It provides a more intuitive and visually appealing way to navigate through search results,
--  making it easier to locate and jump to specific matches in your code.
-- ]]

vim.pack.add { 'https://github.com/kevinhwang91/nvim-hlslens' }

require('hlslens').setup()
