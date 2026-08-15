vim.pack.add({ "https://github.com/tzachar/local-highlight.nvim" }, { confirm = false })

require("local-highlight").setup {
    disable_file_types = {'txt'},
    hlgroup = "Visual",
    animate = false,
}
