return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup()
        vim.keymap.set("n", "<leader>gp", "<cmd>lua require('gitsigns').preview_hunk()<cr>", { desc = "Preview hunk" })
        vim.keymap.set("n", "<leader>gt", "<cmd>lua require('gitsigns').toggle_current_line_blame()<cr>",
            { desc = "Toggle current line blame" })
    end
}
