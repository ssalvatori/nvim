vim.pack.add({
    'https://github.com/wansmer/treesj'
  })

require('treesj').setup({
  use_default_keymaps = false,
})

vim.keymap.set('n', '<leader>m', function() require('treesj').toggle() end, { desc = 'Toggle split/join' })
