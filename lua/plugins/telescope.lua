return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "BurntSushi/ripgrep" },
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").setup({
                    extensions = {
                        fzf = {
                            fuzzy = true, -- false will only do exact matching
                            override_generic_sorter = true, -- override the generic sorter
                            override_file_sorter = true, -- override the file sorter
                            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                            -- the default case_mode is "smart_case"
                        },
                    },
                })
                require("telescope").load_extension("fzf")
            end,
        },
    },
    cmd = "Telescope",
    tag = "0.1.1", -- telescope did only one release, so use HEAD for now
    keys = {
        -- find
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
        { "<leader>ff", require("fg.utils").telescope("files"), desc = "Find Files (root dir)" },
        { "<leader>fF", require("fg.utils").telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
        -- git
        { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
        { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
        -- search
        { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
        { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
        { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
        { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
        { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
        { "<leader>fw", require("fg.utils").telescope("live_grep"), desc = "Grep (root dir)" },
        { "<leader>fW", require("fg.utils").telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
        { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
        { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
        { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
        { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
        { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
        { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
        { "<leader>fs", require("fg.utils").telescope("grep_string"), desc = "Word (root dir)" },
        { "<leader>fS", require("fg.utils").telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
        {
            "<leader>uC",
            require("fg.utils").telescope("colorscheme", { enable_preview = true }),
            desc = "Colorscheme with preview",
        },
        {
            "<leader>ss",
            require("fg.utils").telescope("lsp_document_symbols", {
                symbols = {
                    "Class",
                    "Function",
                    "Method",
                    "Constructor",
                    "Interface",
                    "Module",
                    "Struct",
                    "Trait",
                    "Field",
                    "Property",
                },
            }),
            desc = "Goto Symbol",
        },
    },
    opts = {
        defaults = {
            prompt_prefix = " ",
            selection_caret = " ",
            mappings = {
                i = {
                    ["<c-t>"] = function(...)
                        return require("trouble.providers.telescope").open_with_trouble(...)
                    end,
                    ["<a-i>"] = function()
                        require("fg.utils").telescope("find_files", { no_ignore = true })()
                    end,
                    ["<a-h>"] = function()
                        require("fg.utils").telescope("find_files", { hidden = true })()
                    end,
                    ["<C-Down>"] = function(...)
                        return require("telescope.actions").cycle_history_next(...)
                    end,
                    ["<C-Up>"] = function(...)
                        return require("telescope.actions").cycle_history_prev(...)
                    end,
                    ["<C-f>"] = function(...)
                        return require("telescope.actions").preview_scrolling_down(...)
                    end,
                    ["<C-b>"] = function(...)
                        return require("telescope.actions").preview_scrolling_up(...)
                    end,
                },
                n = {
                    ["q"] = function()
                        return require("telescope.actions").close()
                    end,
                },
            },
        },
    },
}
