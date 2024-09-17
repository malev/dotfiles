-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
    vim.cmd('echo "Installing `mini.nvim`" | redraw')
    local clone_cmd = {
        'git', 'clone', '--filter=blob:none',
        'https://github.com/echasnovski/mini.nvim', mini_path
    }
    vim.fn.system(clone_cmd)
    vim.cmd('packadd mini.nvim | helptags ALL')
    vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

add("nvim-lua/plenary.nvim")
add("folke/tokyonight.nvim")
add("windwp/nvim-autopairs")
add("hrsh7th/nvim-cmp")
add("hrsh7th/cmp-nvim-lsp")
add("hrsh7th/cmp-buffer")
add("hrsh7th/cmp-path")
add("windwp/nvim-ts-autotag")
add("neovim/nvim-lspconfig")
add("nvim-telescope/telescope.nvim")
add("stevearc/conform.nvim")
add({
    source = 'nvim-treesitter/nvim-treesitter',
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
})

now(require('mini.bufremove').setup)
now(require('mini.comment').setup)
now(require('mini.cursorword').setup)
now(require('mini.files').setup)
now(require('mini.icons').setup)
now(require('mini.indentscope').setup)
now(require('mini.jump2d').setup)
now(require('mini.surround').setup)
now(require('mini.starter').setup)
now(function()
    require('mini.notify').setup()
    vim.notify = require('mini.notify').make_notify()
end)
now(require("options").setup)

later(require('mini.tabline').setup)
later(require('mini.statusline').setup)
later(require("lsp").setup)
later(require("autoformat").setup)
later(require("completion").setup)
later(require("treesitter").setup)
later(require("mappings").setup)


-- Display Whitespace
local space = "·"
vim.opt.list = true
vim.opt.listchars:append {
    tab = "│─",
    multispace = space,
    lead = space,
    trail = space,
    nbsp = space
}

local nvim_set_hl = vim.api.nvim_set_hl
vim.cmd([[match TrailingWhitespace /\s\+$/]])
nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })

vim.cmd([[match TrailingWhitespace /\s\+$/]])
nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })
