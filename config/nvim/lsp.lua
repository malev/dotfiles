local servers = {
    bashls = {},
    cssls = {},
    denols = {},
    eslint = {},
    golangci_lint_ls = {},
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
    nil_ls = {
        settings = {
            ["nil"] = {
                formatting = {
                    command = { "nixpkgs-fmt" },
                },
            },
        },
    },
    pyright = {},
    ruby_lsp = {},
    ts_ls = {},
}

local border = {
    { "┌", "FloatBorder" },
    { "─", "FloatBorder" },
    { "┐", "FloatBorder" },
    { "│", "FloatBorder" },
    { "┘", "FloatBorder" },
    { "─", "FloatBorder" },
    { "└", "FloatBorder" },
    { "│", "FloatBorder" },
}
vim.opt.signcolumn = "yes"
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = true,
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
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

local capabilities = require("cmp_nvim_lsp").default_capabilities()

for lsp, config in pairs(servers) do
    config.capabilities = capabilities
    require("lspconfig")[lsp].setup(config)
end
