local on_attach = function(_, bufnr)
    local map = function(mode, keys, func, desc)
        vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
    end
    local telescope = require("telescope.builtin")
    map("n", "gd", telescope.lsp_definitions, "Goto Definition")
    map("n", "gD", vim.lsp.buf.declaration, "Lsp Go to declaration")
    map("n", "gr", telescope.lsp_references, "Show References")
    map("n", "gi", telescope.lsp_implementations, "Goto Implementation")
    map("n", "gt", telescope.lsp_type_definitions, "Goto Type Definition")
    map("n", "<leader>gs", telescope.lsp_document_symbols, 'Find Symbols')
    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
    map("n", "K", vim.lsp.buf.hover, "Hover")
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Lsp Code action")
    map("n", "gl", vim.diagnostic.open_float, "Diagnostics")
    map("n", "<leader>fo", function()
        vim.lsp.buf.format({ async = true })
    end, "Format code")
end

local servers = {
    cssls = {},
    eslint = {},
    gopls = {
        settings = {
            gopls = {
                completeUnimported = true,
                usePlaceholders = true,
                analyses = {
                    unusedparams = true,
                },
            },
        },
    },
    html = {},
    jsonls = {},
    lua_ls = {},
    tailwindcss = {},
    terraformls = {},
    tsserver = {},
    yamlls = {},
}
return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "single",
        })
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = "single",
            focusable = false,
            relative = "cursor",
            silent = true,
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

        local ensure_installed = vim.tbl_keys(servers or {})
        require("mason-lspconfig").setup {
            ensure_installed = ensure_installed,
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    -- This handles overriding only values explicitly passed
                    -- by the server configuration above. Useful when disabling
                    -- certain features of an LSP (for example, turning off formatting for tsserver)
                    server.on_attach = server.on_attach or on_attach or {}
                    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                    require('lspconfig')[server_name].setup(server)
                end,
            },
        }
    end
}
