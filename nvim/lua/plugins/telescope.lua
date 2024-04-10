return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = function()
            return {
                defaults = {
                    file_ignore_patterns = { ".git/" },
                },
                extensions = {
                    file_browser = {
                        hijack_netrw = true,
                    },
                },
                extensions_list = {
                    "file_browser",
                },
            }
        end,
        config = function(_, opts)
            local telescope = require("telescope")
            telescope.setup(opts)

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
            vim.keymap.set("n", "<leader>cs", builtin.colorscheme, {})
            vim.keymap.set("n", "<leader>bb", builtin.buffers, {})
            vim.keymap.set("n", "<leader>tt", ":Telescope<CR>", {})

            require("telescope").load_extension "file_browser"
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        event = "VeryLazy",
    }
}
