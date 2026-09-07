-- Package name changed from `fff.nvim` to `fff`. If you installed fff.nvim before, clean with `:packdel fff.nvim`
vim.pack.add { 'https://github.com/dmtrKovalenko/fff' }

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'fff' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then vim.cmd.packadd 'fff' end
      require('fff.download').download_or_build_binary()
    end
  end,
})

vim.g.fff = {
  lazy_sync = true,
  debug = { enabled = true, show_scores = true },
}

vim.keymap.set('n', '<Leader>ff', function() require('fff').find_files() end, { desc = '[FFF] Find files' })
vim.keymap.set('n', '<leader>fg', function() require('fff').live_grep() end, { desc = '[FFF] Live grep' })
vim.keymap.set('n', '<leader>fc', function() require('fff').live_grep { query = vim.fn.expand '<cword>' } end, { desc = '[FFF] Search word' })

-- Search in open files with live grep
vim.keymap.set('n', '<leader>f/', function()
  require('fff').live_grep {
    -- file_info_section = { show_path = true, show_line_number = true, title "Live Grep in Open Files" },
    -- { grep = { modes = { 'fuzzy', 'plain' } } }
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>fsn', function()   require('fff').find_files { cwd = vim.fn.stdpath 'config', follow = true }
end, { desc = '[FFF] [S]earch [N]eovim files' })
