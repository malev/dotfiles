return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    cmd = "WhichKey",
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.register({
            ["<leader>c"] = { name = "Code" },
            ["<leader>f"] = { name = "Find" },
            ["<leader>g"] = { name = "LSP" },
            ["<leader>l"] = { name = "Search" },
        })
    end,
}
