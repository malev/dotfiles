return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				require("none-ls.code_actions.eslint"),
				null_ls.builtins.code_actions.gomodifytags,
				null_ls.builtins.code_actions.impl,

				null_ls.builtins.diagnostics.golangci_lint,

				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.gofmt,
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.golines,
				null_ls.builtins.formatting.prettier,
			},
		})
	end,
}
