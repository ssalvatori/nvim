-- For `plugins/markview.lua` users.
return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  priority = 49,

  -- Completion for `blink.cmp`
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'saghen/blink.cmp'
  },

  config = function()
    require("markview").setup({
      preview = { enable = false }
    })

    vim.api.nvim_set_keymap("n", "<leader>m", "<CMD>Markview<CR>", { desc = "Toggles `markview` previews globally." })
  end

}
