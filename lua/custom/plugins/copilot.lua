return {
  'github/copilot.vim',
  event = 'VeryLazy',
  config = function()
    -- Additional Copilot configuration if needed
    vim.g.copilot_assume_mapped = true
    vim.api.nvim_set_keymap('i', '<M-s>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
    vim.keymap.set('i', '<M-w>', '<Plug>(copilot-accept-word)')
    vim.g.copilot_enterprise_uri = 'https://mercedes-benz.ghe.com/'
  end,
}
