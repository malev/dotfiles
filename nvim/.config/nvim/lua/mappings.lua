local map = vim.keymap.set
local wk = require("which-key")
local builtin = require("telescope.builtin")

-- General keymaps
map("i", "jk", "<ESC>", { desc = "exit insert mode with jk" })
map("i", "ii", "<ESC>", { desc = "exit insert mode with ii" })
map("n", "<leader>wq", ":wq<CR>") -- save and quit
map("n", "<leader>qq", ":q!<CR>") -- quit without saving
map("n", "<leader>ww", ":w<CR>")  -- save

map("n", ":Q", ":q<CR>")          -- quit without saving
map("n", ":Qa", ":qa<CR>")        -- quit all without saving
map("n", ":W", ":w<CR>")          -- save

-- Which Key Help
wk.add({
    "<leader>?",
    function()
        require("which-key").show({ global = false })
    end,
    desc = "Buffer Local Keymaps (which-key)",
})
-- Split window management

wk.add({
    { "<leader>wh", "<C-w>h",                desc = "Move to left window",         group = "Window" },
    { "<leader>wl", "<C-w>l",                desc = "Move to rigth window",        group = "Window" },
    { "<leader>wj", "<C-w>j",                desc = "Move to bottom window",       group = "Window" },
    { "<leader>wk", "<C-w>k",                desc = "Move to top window",          group = "Window" },
    { "<leader>wv", "<C-w>v",                desc = "Split window vertically",     group = "Window" },
    { "<leader>ws", "<C-w>s",                desc = "Split window horizontally",   group = "Window" },
    { "<leader>wH", "<C-w>H",                desc = "Move buffer to left window",  group = "Window" },
    { "<leader>wL", "<C-w>L",                desc = "Move buffer to rigth window", group = "Window" },
    { "<leader>wm", ":MaximizerToggle!<CR>", desc = "Maximize",                    group = "Window" },
})

-- Buffers
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "<leader>z", "<cmd>bdelete<cr>", { desc = "Close buffer" })
map("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { desc = "Go to buffer 1" })
map("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { desc = "Go to buffer 2" })
map("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { desc = "Go to buffer 3" })
map("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { desc = "Go to buffer 4" })
wk.add({
    { "<leader>bl", "<cmd>e #<cr>",                   group = "Buffer", desc = "Switch to last buffer" },
    { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", group = "Buffer", desc = "Delete Other Buffers" },
    { "<leader>bp", "<cmd>BufferLineTogglePin<cr>",   group = "Buffer", desc = "Toggle Pin" },
    { "<leader>br", "<cmd>e!<cr>",                    group = "Buffer", desc = "Reload buffer" },
    {},
})

-- Undo tree
map("n", "<leader>cu", "<cmd>UndotreeToggle<CR>", { desc = "Open undotree" })

-- yank to system clipboard
map("v", "<leader>y", '"*y', { desc = "Yank to clipboard" })
map("v", "<leader>Y", '"+Y', { desc = "Yank to clipboard" })
map("n", "<leader>yy", '"+yy', { desc = "Yank line to clipboard" })

-- paste without changing current register
map("n", "<leader>p", '"*p', { desc = "Paste from clipboard" })

-- flash
wk.add({
    { "<leader>ss", "<cmd>lua require('flash').jump()<cr>",              group = "Flash", desc = "Flash Jump" },
    { "<leader>st", "<cmd>lua require('flash').treesitter()<cr>",        group = "Flash", desc = "Flash Treesitter" },
    { "<leader>sr", "<cmd>lua require('flash').treesitter_search()<cr>", group = "Flash", desc = "Flash Treesitter Search" },
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
    { "<leader>la", "vim.lsp.buf.code_action",     group = "LSP", desc = "Code Action" },
    { "<leader>ld", "builtin.lsp_definitions",     group = "LSP", desc = "Definition" },
    { "<leader>lr", "builtin.lsp_references",      group = "LSP", desc = "References" },
    { "<leader>lR", "vim.lsp.buf.rename",          group = "LSP", desc = "Rename" },
    { "<leader>lh", "vim.lsp.buf.hover",           group = "LSP", desc = "Hover" },
    { "<leader>li", "builtin.lsp_implementations", group = "LSP", desc = "Implementation" },
    { "<leader>lt", "builtin.lsp_type_definition", group = "LSP", desc = "Type Definition" },
    { "<leader>lf", "vim.lsp.buf.formatting",      group = "LSP", desc = "Format" },
    { "<leader>ll", "vim.diagnostic.open_float",   group = "LSP", desc = "Diagnostics" },
})
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })

-- nvim-tree
wk.add({
    { "<leader>ne", "<cmd>NvimTreeToggle<cr>",                                   group = "NvimTree", desc = "Toggle" },
    { "<leader>nf", "<cmd>NvimTreeFindFile<cr>",                                 group = "NvimTree", desc = "Find File" },
    { "<leader>nh", "<cmd>lua require('nvim-tree.api').tree.toggle_help() <cr>", group = "NvimTree", desc = "Toggle Help" },
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
    { "<leader>xx", "<cmd>TroubleToggle<cr>",                           group = "Trouble", desc = "Trouble" },
    { "<leader>xw", "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", group = "Trouble", desc = "Workspace Diagnostics" },
    { "<leader>xd", "<cmd>TroubleToggle lsp_document_diagnostics<cr>",  group = "Trouble", desc = "Document Diagnostics" },
    { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",                  group = "Trouble", desc = "Quickfix" },
    { "<leader>xl", "<cmd>TroubleToggle loclist<cr>",                   group = "Trouble", desc = "Loclist" },
    { "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>",            group = "Trouble", desc = "References" },

})
