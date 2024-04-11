return {
    {
        "nvim-telescope/telescope.nvim",
        event = "VeryLazy",
        tag = "0.1.6",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = function()
            return {
                defaults = {
                    file_ignore_patterns = { ".git/", "node_modules" },
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
            require("telescope").load_extension "file_browser"
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        event = "VeryLazy",
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
