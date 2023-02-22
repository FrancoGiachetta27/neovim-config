-- See mason-null-ls.nvim's documentation for more details:
-- https://github.com/jay-babu/mason-null-ls.nvim#setup
require("mason-null-ls").setup({
    ensure_installed = nil,
    automatic_installation = true, -- You can still set this to `true`
    automatic_setup = true,
})

-- Required when `automatic_setup` is true
require("mason-null-ls").setup_handlers()
