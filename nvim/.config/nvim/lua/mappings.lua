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
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "<leader>z", "<cmd>bdelete<cr>", { desc = "Close buffer" })
map("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { desc = "Go to buffer 1" })
map("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { desc = "Go to buffer 2" })
map("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { desc = "Go to buffer 3" })
map("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { desc = "Go to buffer 4" })
wk.register({
    b = {
        name = "Buffer",
        l = { "<cmd>e #<cr>", "Switch to last buffer" },
        o = { "<cmd>BufferLineCloseOthers<cr>", "Delete Other Buffers" },
        p = { "<cmd>BufferLineTogglePin<cr>", "Toggle Pin" },
        r = { "<cmd>e!<cr>", "Reload buffer" },
    }
}, {
    prefix = "<leader>",
    mode = "n",
})

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
    s = {
        name = "flash",
        s = { function() require("flash").jump() end, "Flash Jump" },
        t = { function() require("flash").treesitter() end, "Flash Treesitter" },
        r = { function() require("flash").treesitter_search() end, "Flash Treesitter Search" },
    },
}, { prefix = "<leader>" })

-- GIT
wk.register({
    g = {
        name = "Git",
        p = { require('gitsigns').preview_hunk, "Preview Hunk" },
        t = { require('gitsigns').toggle_current_line_blame, "Toggle Blame" },
    }
}, {
    prefix = "<leader>",
    mode = "n"
})

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
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })

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

-- Oil
wk.register({
    ["<leader>-"] = { "<cmd>Oil<cr>", "Oil" },
})

-- Telescope keymappings
wk.register({
    f = {
        name = "Find / Telescope",
        f = { require('telescope.builtin').find_files, "Find File" },
        g = { require('telescope.builtin').live_grep, "Grep All" },
        G = { require('telescope.builtin').grep_string, "Grep current word" },
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
        r = { function() require("trouble").toggle("lsp_references") end, "References" }, -- not working
    }
}, {
    prefix = "<leader>",
    mode = "n",
})
