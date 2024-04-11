return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"bash",
				"html",
				"javascript",
				"json",
				"lua",
				"go",
				"gomod",
				"gowork",
				"gosum",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"yaml"
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
