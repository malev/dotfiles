local map = vim.keymap.set
local wk = require("which-key")
local builtin = require("telescope.builtin")

-- General keymaps
map("i", "jk", "<ESC>", { desc = "exit insert mode with jk" })
map("i", "ii", "<ESC>", { desc = "exit insert mode with ii" })
map("n", "<leader>wq", ":wq<CR>") -- save and quit
map("n", "<leader>qq", ":q!<CR>") -- quit without saving
map("n", "<leader>ww", ":w<CR>")  -- save

-- Split window management
wk.register({
    w = {
        name = "Window",
        h = { "<C-w>h", "Move to left window" },
        l = { "<C-w>l", "Move to rigth window" },
        j = { "<C-w>j", "Move to bottom window" },
        k = { "<C-w>k", "Move to top window" },
        v = { "<C-w>v", "Split window vertically" },
        s = { "<C-w>s", "Split window horizontally" },
        H = { "<C-w>H", "Move buffer to left window" },
        L = { "<C-w>L", "Move buffer to rigth window" },
        m = { ":MaximizerToggle!<CR>", { noremap = true, desc = 'Maximize' } },
    }
}, {
    prefix = "<leader>",
    mode = "n",
})

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>c", "<cmd>e #<cr>", { desc = "Switch to Last Buffer" })
map("n", "<leader>z", "<cmd>bdelete<cr>", { desc = "Close buffer" })

-- Undo tree
map("n", "<leader>cu", "<cmd>UndotreeToggle<CR>", { desc = "Open undotree" })

-- yank to system clipboard
map("n", "<leader>y", '"*y', { desc = "Yank to clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Yank to clipboard" })
map("n", "<leader>yy", '"+yy', { desc = "Yank line to clipboard" })

-- paste without changing current register
map("n", "<leader>p", '"*p', { desc = "Paste from clipboard" })

-- flash
wk.register({
    -- flash search
    l = {
        name = "flash",
        s = { function() require("flash").jump() end, "Flash Jump" },
        t = { function() require("flash").treesitter() end, "Flash Treesitter" },
        r = { function() require("flash").treesitter_search() end, "Flash Treesitter Search" },
    },
}, { prefix = "<leader>" })

-- LSP
wk.register({
    l = {
        name = "LSP",
        a = { vim.lsp.buf.code_action, "Code Action" },
        d = { builtin.lsp_definitions, "Definition" },
        r = { builtin.lsp_references, "References" },
        R = { vim.lsp.buf.rename, "Rename" },
        h = { vim.lsp.buf.hover, "Hover" },
        i = { builtin.lsp_implementations, "Implementation" },
        t = { builtin.lsp_type_definition, "Type Definition" },
        f = { vim.lsp.buf.formatting, "Format" },
        l = { vim.diagnostic.open_float, "Diagnostics" },
    }
}, {
    prefix = "<leader>",
    mode = "n",
})
map("n", "K", "vim.lsp.buf.hover", { desc = "Hover" })

-- nvim-tree
wk.register({
    e = {
        name = "NvimTree",
        e = { "<cmd>NvimTreeToggle<cr>", "Toggle" },
        f = { "<cmd>NvimTreeFindFile<cr>", "Find File" },
        h = { function() require("nvim-tree.api").tree.toggle_help() end, "Toggle" },
    }
}, {
    prefix = "<leader>",
    mode = "n",
})

-- Telescope keymappings
wk.register({
    f = {
        name = "Find / Telescope",
        f = { require('telescope.builtin').find_files, "Find File" },
        g = { require('telescope.builtin').live_grep, "Grep All" },
        b = { require('telescope.builtin').buffers, "Grep Buffers" },
        h = { require('telescope.builtin').help_tags, "Help" },
        s = { require('telescope.builtin').current_buffer_fuzzy_find, "Fuzzy Finder in current buffer" },
        e = { require("telescope").extensions.file_browser.file_browser, "File Browser" },
    }
}, {
    prefix = "<leader>",
    mode = "n"
})

-- Trouble
wk.register({
    x = {
        name = "Trouble",
        x = { require("trouble").toggle, "Toggle" },
        w = { function() require("trouble").toggle("workspace_diagnostics") end, "Workspace Diagnostics" },
        d = { function() require("trouble").toggle("document_diagnostics") end, "Document Diagnostics" },
        q = { function() require("trouble").toggle("quickfix") end, "Quickfix" },
        l = { function() require("trouble").toggle("loclist") end, "Loclist" },
    }
}, {
    prefix = "<leader>",
    mode = "n",
})
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
