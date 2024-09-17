local lsp = {}

local function configure_nvim()
    local border = {
        { '┌', 'FloatBorder' },
        { '─', 'FloatBorder' },
        { '┐', 'FloatBorder' },
        { '│', 'FloatBorder' },
        { '┘', 'FloatBorder' },
        { '─', 'FloatBorder' },
        { '└', 'FloatBorder' },
        { '│', 'FloatBorder' },
    }
    vim.opt.signcolumn = 'yes'
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            underline = true,
            virtual_text = false,
            signs = true,
            update_in_insert = true,
        }
    )
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "single"
    })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "single",
        focusable = false,
        relative = "cursor",
        silent = true,
    })
    vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = true,
        float = { border = border, width = 100 },
    })
end

function lsp.setup()
    configure_nvim()

    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- Executes the callback function every time a
    -- language server is attached to a buffer.
    vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
            local opts = { buffer = event.buf }

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        end
    })
    require('lspconfig').lua_ls.setup({})
    require('lspconfig').gopls.setup({
        capabilities = capabilities,
        settings = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = { unusedparams = true },
        }
    })
end

return lsp
