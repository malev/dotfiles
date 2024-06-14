return {
    {
        "folke/flash.nvim",
        cond = vim.g.vscode,
        event = "VeryLazy",
        opts = {
            modes = {
                char = {
                    jump_labels = true
                }
            }
        },
    }
}
