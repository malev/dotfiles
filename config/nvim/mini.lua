require("mini.bufremove").setup()
require("mini.comment").setup()
require("mini.cursorword").setup()
require("mini.fuzzy").setup()
require("mini.icons").setup()
require("mini.indentscope").setup()
require("mini.jump2d").setup()
require("mini.notify").setup()
require("mini.surround").setup()
require("mini.starter").setup()
require("mini.statusline").setup()
require("mini.tabline").setup()

vim.g.mapleader = " " -- Needed here so mini.clue can capture it
vim.notify = require("mini.notify").make_notify()
local miniclue = require("mini.clue")
miniclue.setup({
    triggers = {
        -- Leader triggers
        { mode = "n", keys = "<Leader>" },
        { mode = "x", keys = "<Leader>" },

        -- `g` key
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },

        -- Marks
        { mode = "n", keys = "'" },
        { mode = "n", keys = "`" },
        { mode = "x", keys = "'" },
        { mode = "x", keys = "`" },

        -- Registers
        { mode = "n", keys = '"' },
        { mode = "x", keys = '"' },
        { mode = "i", keys = "<C-r>" },
        { mode = "c", keys = "<C-r>" },

        -- Window commands
        { mode = "n", keys = "<C-w>" },
    },

    clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
    },
})
