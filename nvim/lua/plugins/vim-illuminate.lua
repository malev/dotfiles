return {
    "RRethy/vim-illuminate",
    opts = {
        delay = 100,
        providers = {
            "lsp",
            "treesitter",
            "regex",
        },
    },
    config = function(_, opts)
        require("illuminate").configure(opts)
    end,
}
