-- [[ Colorscheme ]]
-- You can easily change to a different colorscheme.
-- Change the name of the colorscheme plugin below, and then
-- change the command under that to load whatever the name of that colorscheme is.
--
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
vim.pack.add { 'https://github.com/boningmaple/mac-clear' }
---@diagnostic disable-next-line: missing-fields
-- require('mac-clear').setup {
--   styles = {
--     comments = { italic = false }, -- Disable italics in comments
--   },
-- }

-- Load the colorscheme here.
-- Like many other themes, this one has different styles, and you could load
-- any other, such as 'mac-clear-light', 'mac-clear-dark', or 'mac-clear-dimmed'.
vim.cmd.colorscheme 'mac-clear-dark'

-- vim: ts=2 sts=2 sw=2 et
