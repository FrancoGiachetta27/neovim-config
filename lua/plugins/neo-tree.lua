return {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "NeoTree",
    branch = "v2.x",
    keys = {
        { "<C-n>", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    opts = {
        follow_current_file = true,
        hijack_netrw_behavior = "open_current",
        enable_git_status = true,
        enable_diagnostics = true,
        window = {
            position = "left",
            width = 25,
            mapping_options = {
                noremap = true,
                nowait = true,
            },
        },
    }, -- optional, updated every week. (see issue #1193)
}
