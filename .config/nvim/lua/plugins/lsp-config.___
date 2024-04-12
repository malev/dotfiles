return {
    {
        "williamboman/mason.nvim",
        opts = {},
        config = function()
            require("mason").setup({
                ensure_installed = {
                    "cssls",
                    "html",
                    "lua_ls",
                    "tsserver",
                    "gopls",
                    "jsonls",
                    "hydra_lsp",
                    "pyright",
                    "terraformls",
                    "eslint",
                    "prettierd",
                },
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "cssls", "html", "lua_ls", "tsserver", "gopls", "jsonls", "hydra_lsp", "pyright", "terraformls", "eslint" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Lua
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })

            -- Terraform
            lspconfig.terraformls.setup({
                capabilities = capabilities,
            })

            -- TailWind CSS
            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
            })

            -- HTML
            lspconfig.html.setup({
                capabilities = capabilities,
            })

            -- JS
            lspconfig.tsserver.setup({
                capabilities = capabilities,
            })

            -- Eslint
            lspconfig.eslint.setup({
                capabilities = capabilities,
            })

            -- Go
            local util = require('lspconfig.util')
            lspconfig.gopls.setup({
                -- on_attach = on_attach,
                capabilities = capabilities,
                cmd = { "gopls" },
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
                root_dir = util.root_pattern("go.work", "go.mod", ".git"),
                settings = {
                    gopls = {
                        hints = {
                            assignVariableTypes = true,
                            compositeLiteralFields = true,
                            compositeLiteralTypes = true,
                            constantValues = true,
                            functionTypeParameters = true,
                            parameterNames = true,
                            rangeVariableTypes = true,
                        },
                        gofmt = true,
                        completeUnimported = true,
                        usePlaceholders = true,
                        staticcheck = true,
                        analyses = {
                            unusedparams = true,
                            nilness = true,
                        },
                        directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
                        semanticTokens = true,
                    },
                },
            })
        end,
    },
}
