local treesitter = {}

function treesitter.setup()
    require('nvim-treesitter.configs').setup({
        ensure_installed = {
            'bash', 'go', 'gotmpl', 'html', 'javascript', 'json', 'lua', 'markdown', 'nix', 'python', 'ruby', 'sql',
            'terraform', 'typescript', 'vim', 'vimdoc', 'yaml'
        },
        highlight = { enable = true },
    })
end

return treesitter
