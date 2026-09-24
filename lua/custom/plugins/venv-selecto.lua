vim.pack.add {
  'https://github.com/linux-cultist/venv-selector.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/neovim/nvim-lspconfig',
}

local function setup_venv_selector()
  local status_ok, venv_selector = pcall(require, 'venv-selector')
  if not status_ok then return end

  venv_selector.setup {
    settings = {
      options = {
        notify_user_on_venv_activation = true,
      },
    },
  }
end

-- Lazy-load setup when opening Python files
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function() setup_venv_selector() end,
  once = true,
})

-- Keymap to trigger the selection UI
vim.keymap.set('n', '<leader>vs', '<cmd>VenvSelect<cr>', {
  desc = 'Select Python Virtual Environment',
})
