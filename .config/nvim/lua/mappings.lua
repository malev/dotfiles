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

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
    desc = 'LSP actions',
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gw', vim.lsp.buf.document_symbol, opts)
        vim.keymap.set('n', 'gW', vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
        end, opts)
        -- bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
        -- bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
    end,
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
