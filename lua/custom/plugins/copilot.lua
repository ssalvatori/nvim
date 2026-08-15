vim.pack.add({
    'https://github.com/github/copilot.vim'
})

vim.g.copilot_assume_mapped = true
vim.api.nvim_set_keymap('i', '<M-s>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.keymap.set('i', '<M-w>', '<Plug>(copilot-accept-word)')
vim.g.copilot_enterprise_uri = 'https://mercedes-benz.ghe.com/'
