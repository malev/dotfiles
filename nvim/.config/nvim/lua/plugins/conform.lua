vim.g.enable_autoformat = true
vim.g.toggle_autoformat = function()
    vim.g.enable_autoformat = not vim.g.enable_autoformat
    if vim.g.enable_autoformat then
        vim.api.nvim_notify("Autoformat is now enabled", vim.log.levels.INFO, {})
    else
        vim.api.nvim_notify("Autoformat is now disabled", vim.log.levels.WARN, {})
    end
end

return {
    'stevearc/conform.nvim',
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            -- Conform will run multiple formatters sequentially
            -- Use a sub-list to run only the first available formatter
            css = { "prettier" },
            go = { { "gofumpt", "gofmt" }, "goimports", "golines" },
            html = { "prettier" },
            javascript = { { "prettierd", "prettier" } },
            javascriptreact = { "prettier" },
            lua = { "stylua" },
            python = { "isort", "black" },
            terraform = { "terraform_fmt" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            ["_"] = { "trim_whitespace" },
        },
        -- Set up format-on-save
        format_on_save = function()
            if vim.g.enable_autoformat then
                return { async = false, timeout_ms = 500, lsp_fallback = true }
            end
        end
    },
    config = function(_, opts)
        require('conform').setup(opts)
    end
}
