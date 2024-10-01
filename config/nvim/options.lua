-- Set leader key to space
vim.g.mapleader = " "
-- set colour columns for good coding style
vim.opt.cc = "100"
-- middle-click paste with mouse
vim.opt.mouse = "a"
-- get bash-like tab completions
vim.opt.wildmode = "longest,list"
-- Indentation
vim.opt.expandtab = true             -- use spaces instead of tabs
vim.opt.tabstop = 2                  -- number of spaces that a <Tab> in the file counts for
vim.opt.softtabstop = 2              -- number of spaces that a <Tab> counts for while editing
vim.opt.shiftwidth = 2               -- number of spaces to use for each step of (auto)indent
vim.cmd("filetype plugin indent on") -- allows auto-indenting depending on file type
-- Vim Search Options
vim.opt.ignorecase = true            -- ignore case when searching
vim.opt.smartcase = true             -- unless capital letter in search
vim.opt.hlsearch = true              -- highlight all matches on previous search pattern
vim.opt.incsearch = true             -- incrementally highlight searches as you type
-- Scroll Options
vim.opt.scrolloff = 8                -- minimum number of lines to keep above and below the cursor
vim.opt.sidescrolloff = 8            --minimum number of columns to keep above and below the cursor
-- Line numbers
vim.wo.number = true
-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
-- colorscheme
local ok, _ = pcall(vim.cmd, 'colorscheme catppuccin-mocha')
if not ok then
    vim.cmd 'colorscheme default' -- if the above fails, then use default
end
