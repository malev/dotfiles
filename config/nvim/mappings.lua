local map = vim.keymap.set
local builtin = require("telescope.builtin")
local lsp_format = function()
    vim.lsp.buf.format({ async = true })
end

-- General keymaps
map("n", "<leader>wq", ":wq<CR>", { desc = "Quit" })                -- save and quit
map("n", "<leader>qq", ":q!<CR>", { desc = "Quit without saving" }) -- quit without saving
map("n", "<leader>ww", ":w<CR>", { desc = "Save" })                 -- save

map("n", ":Q", ":q<CR>")                                            -- quit without saving
map("n", ":Qa", ":qa<CR>")                                          -- quit all without saving
map("n", ":W", ":w<CR>")                                            -- save

-- Window
map("n", "<leader>w", "<C-w>", { desc = "More accessible window management" })
map("n", "<leader>wm", ":only<cr>", { desc = "Maximize" })

-- Buffers
map("n", "<leader>bb", "<cmd>:b#<cr>", { desc = "Go Back" })
map("n", "<leader>br", "<cmd>e!<cr>", { desc = "Reload buffer" })
map("n", "<leader>bx", ":bdelete<cr>", { desc = "Close buffer" })
map("n", "<S-h>", "<cmd>:bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>:bnext<cr>", { desc = "Next Buffer" })

-- yank to system clipboard
map("v", "<leader>y", '"*y', { desc = "Yank to clipboard" })
map("v", "<leader>Y", '"+Y', { desc = "Yank line to clipboard" })
map("n", "<leader>yy", '"+yy', { desc = "Yank line to clipboard" })
map("n", "<leader>p", '"*p', { desc = "Paste from clipboard" })

-- LSP
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>ld", builtin.lsp_definitions, { desc = "Definition" })
map("n", "<leader>lr", builtin.lsp_references, { desc = "References" })
map("n", "<leader>lR", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>lh", vim.lsp.buf.hover, { desc = "Hover" })
map("n", "<leader>li", vim.lsp.buf.implementation, { desc = "Implementation" })
map("n", "<leader>ln", vim.lsp.buf.type_definition, { desc = "Type Definition" })
map("n", "<leader>lf", lsp_format, { desc = "Format" })
map("n", "<leader>ll", vim.diagnostic.open_float, { desc = "Diagnostics" })
map("n", "<leader>lu", vim.g.toggle_autoformat, { desc = "Toggle autoformat" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })

-- mini files
map("n", "<leader>ee", require("mini.files").open, { desc = "Mini files" })
map("n", "<leader>eh", require("mini.files").show_help, { desc = "Mini files help" })

-- Telescope
map("n", "<leader>ff", builtin.find_files, { desc = "Find File" })
map("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Grep All" })
map("n", "<leader>fG", builtin.grep_string, { desc = "Grep Current Word" })
map("n", "<leader>fb", builtin.buffers, { desc = "Grep Buffers" })
map("n", "<leader>fs", builtin.current_buffer_fuzzy_find, { desc = "FF Current Buffer" })
