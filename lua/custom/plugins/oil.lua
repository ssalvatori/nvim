vim.pack.add {
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/refractalize/oil-git-status.nvim',
}

require('oil').setup {
  columns = { 'icon' },
  keymaps = {
    ['<C-h>'] = false,
    ['<C-l>'] = false,
    ['<C-k>'] = false,
    ['<C-j>'] = false,
    ['<M-h>'] = 'actions.select_split',
    ['gd'] = {
      desc = 'Toggle file detail view',
      callback = function()
        detail = not detail
        if detail then
          require('oil').set_columns { 'icon', 'permissions', 'size', 'mtime' }
        else
          require('oil').set_columns { 'icon' }
        end
      end,
    },
  },
  view_options = {
    show_hidden = true,
  },
  win_options = {
    signcolumn = 'yes:2',
  },
  watch_for_changes = true,
  skip_confirm_for_simple_edits = true,
}

require('oil-git-status').setup {
  show_ignored = true,
}

-- Open parent directory in current window
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- Open parent directory in floating window
vim.keymap.set('n', '<space>-', require('oil').toggle_float)

