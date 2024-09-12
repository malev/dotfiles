local ensure_installed = {
	"bash",
	"html",
	"javascript",
	"json",
	"lua",
	"luadoc",
	"go",
	"gomod",
	"gowork",
	"gosum",
	"gotmpl",
	"markdown",
	"markdown_inline",
	"nix",
	"python",
	"query",
	"regex",
	"ruby",
	"terraform",
	"toml",
	"tsx",
	"typescript",
	"vimdoc",
	"yaml",
	"tsx",
}

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = ensure_installed,
		highlight = {
			enable = true,
			use_languagetree = true,
		},
		indent = {
			enable = true
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
