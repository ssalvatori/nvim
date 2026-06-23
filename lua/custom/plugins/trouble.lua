vim.pack.add({ "https://github.com/folke/trouble.nvim" })

require("trouble").setup({
  -- focus = true,
  -- win = {
  --  type = "float",
  -- },
})

vim.keymap.set('n', '<leader>tt', function()
  require('trouble').toggle()
end)

vim.keymap.set('n', '[t', function()
  require('trouble').next { skip_groups = true, jump = true }
end)

vim.keymap.set('n', ']t', function()
  require('trouble').previous { skip_groups = true, jump = true }
end)
