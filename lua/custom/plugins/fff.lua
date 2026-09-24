-- Package name changed from `fff.nvim` to `fff`. If you installed fff.nvim before, clean with `:packdel fff.nvim`
vim.pack.add { 'https://github.com/dmtrKovalenko/fff' }

vim.g.fff = {
  lazy_sync = true,
  debug = { enabled = true, show_scores = true },
}

vim.keymap.set('n', '<Leader>ff', function() require('fff').find_files() end, { desc = '[FFF] [F]ind [F]iles' })
vim.keymap.set('n', '<leader>fg', function() require('fff').live_grep() end, { desc = '[FFF] Live [G]rep' })
vim.keymap.set('n', '<leader>fw', function()
  require('fff').live_grep {
    query = vim.fn.expand '<cword>',
  }
end, { desc = '[FFF] Search [W]ord' })

-- Search in open files with live grep
vim.keymap.set(
  'n',
  '<leader>f/',
  function()
    require('fff').live_grep {
      prompt_title = 'Live Grep in Open Files',
    }
  end,
  { desc = '[S]earch [/] in Open Files' }
)

-- Shortcut for searching your Neovim configuration files
vim.keymap.set(
  'n',
  '<leader>fsn',
  function() require('fff').find_files { cwd = vim.fn.stdpath 'config', follow = true } end,
  { desc = '[FFF] [S]earch [N]eovim files' }
)
