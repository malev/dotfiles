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
            go = { { "gofumpt", "gofmt" }, { "goimports-revise", "goimports" }, "golines" },
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
        format_on_save = { async = false, timeout_ms = 500, lsp_fallback = true },
    },
    config = function(_, opts)
        require('conform').setup(opts)
    end
}
