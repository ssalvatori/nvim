vim.pack.add { 'https://github.com/rachartier/tiny-cmdline.nvim' }

require('vim._core.ui2').enable {}

vim.o.cmdheight = 0

require('tiny-cmdline').setup({

  on_reposition = require("tiny-cmdline").adapters.blink,

  width = {
    value = "70%",
  },

})
