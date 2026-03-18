return {
  'polarmutex/git-worktree.nvim',
  version = '^2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  enabled = true,
  config = function()
    require('telescope').load_extension 'git_worktree'

    vim.keymap.set('n', '<leader>wt', function()
      require('telescope').extensions.git_worktree.git_worktree()
    end, { desc = 'Worktrees' })

    -- create a worktree inserting branch name
    vim.keymap.set('n', '<leader>wc', function()
      require('telescope').extensions.git_worktree.create_git_worktree()
    end, { desc = 'Create Worktree' })
  end,
}
