local lsp = require("lsp-zero").preset({
    name = "recommended",
})

require("fg.lsp.nvim-cmp")
require("fg.lsp.on_attach")

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

require("fg.lsp.null-ls")
require("fg.lsp.mason-null-ls")
