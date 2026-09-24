vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/github/copilot.vim',
  'https://github.com/saghen/blink.compat',
  'https://github.com/ThePrimeagen/99',
}

local _99 = require '99'

_99.setup {
  provider = _99.Providers.OpenCodeProvider,
  show_in_flight_requests = true,

  model = 'github-copilot/claude-opus-5.5',

  logger = {
    level = _99.DEBUG,
    path = '/tmp/99.debug',
    print_on_error = true,
  },

  tmp_dir = './tmp',

  completion = {
    custom_rules = {
      '~/.agents/skills/',
    },
    source = 'blink', -- "native" (default), "cmp", or "blink"
  },

  md_files = {
    'AGENTS.md',
  },
}

vim.keymap.set('v', '<leader>9v', function() _99.visual() end, { desc = '99 visual selection' })
vim.keymap.set('v', '<leader>9vp', function() _99.visual_prompt() end, { desc = '99 visual selection with prompt' })
vim.keymap.set('n', '<leader>9x', function() _99.stop_all_requests() end, { desc = '99 stop all requests' })
vim.keymap.set('n', '<leader>9s', function() _99.search() end, { desc = '99 search' })
vim.keymap.set('n', '<leader>9i', function() _99.info() end, { desc = '99 info' })
vim.keymap.set('n', '<leader>9m', function() require('99.extensions.telescope').select_model() end, { desc = '99 select model' })
