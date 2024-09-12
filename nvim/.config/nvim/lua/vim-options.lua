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

-- Show Hover and Signature Help windows with borders
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = 'rounded' }
)

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- JS and CSS formatting
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.js", "*.html", "*.css", "*.ts" },
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
  end
})

-- Others
vim.g.have_nerd_font = true
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.swapfile = false
