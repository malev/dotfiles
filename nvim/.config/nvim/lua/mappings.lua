local map = vim.keymap.set
local wk = require("which-key")
local builtin = require("telescope.builtin")

-- General keymaps
map("n", "<leader>wq", ":wq<CR>") -- save and quit
map("n", "<leader>qq", ":q!<CR>") -- quit without saving
map("n", "<leader>ww", ":w<CR>")  -- save

map("n", ":Q", ":q<CR>")          -- quit without saving
map("n", ":Qa", ":qa<CR>")        -- quit all without saving
map("n", ":W", ":w<CR>")          -- save

-- Split window management
wk.add({
    { "<leader>wh", "<C-w>h",                desc = "Move to left window", },
    { "<leader>wl", "<C-w>l",                desc = "Move to rigth window", },
    { "<leader>wj", "<C-w>j",                desc = "Move to bottom window", },
    { "<leader>wk", "<C-w>k",                desc = "Move to top window", },
    { "<leader>wv", "<C-w>v",                desc = "Split window vertically", },
    { "<leader>ws", "<C-w>s",                desc = "Split window horizontally", },
    { "<leader>wH", "<C-w>H",                desc = "Move buffer to left window", },
    { "<leader>wL", "<C-w>L",                desc = "Move buffer to rigth window", },
    { "<leader>wm", ":MaximizerToggle!<CR>", desc = "Maximize", },
})

-- Buffers
wk.add({
    { "<leader>bl", "<cmd>e #<cr>",                    desc = "Switch to last buffer" },
    { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>",  desc = "Delete Other Buffers" },
    { "<leader>bp", "<cmd>BufferLineTogglePin<cr>",    desc = "Toggle Pin" },
    { "<leader>br", "<cmd>e!<cr>",                     desc = "Reload buffer" },
    { "<leader>z",  "<cmd>bdelete<cr>",                desc = "Close buffer" },

    { "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",    desc = "Prev Bufer" },
    { "<S-l>",      "<cmd>BufferLineCycleNext<cr>",    desc = "Prev Bufer" },

    { "<leader>1",  "<Cmd>BufferLineGoToBuffer 1<CR>", desc = "Go to buffer 1" },
    { "<leader>2",  "<Cmd>BufferLineGoToBuffer 2<CR>", desc = "Go to buffer 2" },
    { "<leader>3",  "<Cmd>BufferLineGoToBuffer 3<CR>", desc = "Go to buffer 3" },
    { "<leader>4",  "<Cmd>BufferLineGoToBuffer 4<CR>", desc = "Go to buffer 4" },
})

-- Undo tree
wk.add(
    { "<leader>cu", "<cmd>UndotreeToggle<CR>", desc = "Open undotree" }
)

-- yank to system clipboard
wk.add({
    mode = { "v" },
    { "<leader>y", '"*y', desc = "Yank to clipboard" },
    { "<leader>Y", '"+Y', desc = "Yank line to clipboard" },
}, {
    mode = { "n" },
    { "<leader>yy", '"+yy', desc = "Yank line to clipboard" },
    { "<leader>p",  '"*p',  desc = "Paste from clipboard" }
})

-- flash
wk.add({
    { "<leader>ss", require('flash').jump,              group = "Flash", desc = "Flash Jump" },
    { "<leader>st", require('flash').treesitter,        group = "Flash", desc = "Flash Treesitter" },
    { "<leader>sr", require('flash').treesitter_search, group = "Flash", desc = "Flash Treesitter Search" },
})

-- GIT
wk.add({
    { "<leader>gs", "<cmd>Git<cr>",       group = "Git", desc = "Git Status" },
    { "<leader>gd", "<cmd>Git diff<cr>",  group = "Git", desc = "Git Diff" },
    { "<leader>gl", "<cmd>Git log<cr>",   group = "Git", desc = "Git Log" },
    { "<leader>gb", "<cmd>Git blame<cr>", group = "Git", desc = "Git Blame" },
    -- Consider:
    -- require('gitsigns').preview_hunk
    -- require('gitsigns').toggle_current_line_blame
})

-- LSP
wk.add({
    { "<leader>la", vim.lsp.buf.code_action,                            desc = "Code Action" },
    { "<leader>ld", builtin.lsp_definitions,                            desc = "Definition" },
    { "<leader>lr", builtin.lsp_references,                             desc = "References" },
    { "<leader>lR", vim.lsp.buf.rename,                                 desc = "Rename" },
    { "<leader>lh", vim.lsp.buf.hover,                                  desc = "Hover" },
    { "<leader>li", vim.lsp.buf.implementation,                         desc = "Implementation" },
    { "<leader>ln", vim.lsp.buf.type_definition,                        desc = "Type Definition" },
    { "<leader>lf", function() vim.lsp.buf.format { async = true } end, desc = "Format" },
    { "<leader>ll", vim.diagnostic.open_float,                          desc = "Diagnostics" },
    { "K",          vim.lsp.buf.hover,                                  desc = "Hover" },
})

-- nvim-tree
wk.add({
    { "<leader>ee", "<cmd>NvimTreeToggle<cr>",                 group = "NvimTree", desc = "Toggle" },
    { "<leader>ef", "<cmd>NvimTreeFindFile<cr>",               group = "NvimTree", desc = "Find File" },
    { "<leader>eh", require('nvim-tree.api').tree.toggle_help, group = "NvimTree", desc = "Toggle Help" },
})

-- Oil
wk.add(
    { "<leader>-", "<cmd>Oil<cr>", group = "Oil", desc = "Oil" }
)

-- Telescope keymappings
wk.add({
    { "<leader>ff", builtin.find_files,                                        group = "Telescope", desc = "Find File" },
    { "<leader>fg", builtin.live_grep,                                         group = "Telescope", desc = "Grep All" },
    { "<leader>fG", builtin.grep_string,                                       group = "Telescope", desc = "Grep current word" },
    { "<leader>fb", builtin.buffers,                                           group = "Telescope", desc = "Grep Buffers" },
    { "<leader>fh", builtin.help_tags,                                         group = "Telescope", desc = "Help" },
    { "<leader>fs", builtin.current_buffer_fuzzy_find,                         group = "Telescope", desc = "Fuzzy Finder in current buffer" },
    { "<leader>fe", require("telescope").extensions.file_browser.file_browser, group = "Telescope", desc = "File Browser" },

})

-- Trouble
wk.add({
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",              group = "Trouble", desc = "Workspace Diagnostics" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", group = "Trouble", desc = "Diagnostics current buffer" },
    { "<leader>xq", "<cmd>Trouble quickfix toggle<cr>",                 group = "Trouble", desc = "Quickfix" },
    { "<leader>xr", "<cmd>Trouble lsp_references toggle<cr>",           group = "Trouble", desc = "References" },
})
