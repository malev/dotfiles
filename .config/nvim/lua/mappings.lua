local map = vim.keymap.set
local wk = require("which-key")

-- Undo tree
map("n", "<leader>cu", "<cmd>UndotreeToggle<CR>", { desc = "Open undotree" })

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>c", "<cmd>e #<cr>", { desc = "Switch to Last Buffer" })
map("n", "<leader>x", "<cmd>bdelete<cr>", { desc = "Close buffer" })

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

-- telescope keymappings
local builtin = require("telescope.builtin")
wk.register({
    f = {
        name = "Find / Telescope",
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        b = { "<cmd>Telescope buffers<cr>", "Buffers" },
        g = { "<cmd>Telescope live_grep<cr>", "Grep" },
        h = { "<cmd>Telescope help_tags<cr>", "Help" },
        e = { ":Telescope file_browser hidden=true<CR>", "File Browser" },
        n = { "New File" },
    }
}, {
    prefix = "<leader>",
    mode = "n"
})

-- nvim-tree
wk.register({
    b = {
        name = "NvimTree",
        b = { "<cmd>NvimTreeToggle<cr>", "Toggle" },
        n = { "<cmd>NvimTreeFindFile<cr>", "Find File" },
        z = "g? to get help"
    }
}, {
    prefix = "<leader>",
    mode = "n",
})

-- Trouble
wk.register({
    x = {
        name = "Trouble",
        x = { function() require("trouble").toggle() end, "Toggle" },
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

-- Windows
map("n", "<leader>ws", "<cmd>split<cr>", { desc = "Split" })
map("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
map('n', '<C-w>m', ':MaximizerToggle!<CR>', { noremap = true, silent = true, desc = 'Maximize' })
