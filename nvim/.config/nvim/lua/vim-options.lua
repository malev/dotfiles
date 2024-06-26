-- Set leader key to space
vim.g.mapleader = " "

-- Set tab options
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.cmd("set nocompatible") -- disable compatibility to old-time vi
vim.cmd("set showmatch")    -- show matching brackets.
vim.cmd("set ignorecase")   -- case insensitive matching
vim.cmd("set mouse=v")      -- middle-click paste with mouse
vim.cmd("set hlsearch")     -- highlight search results
-- vim.cmd("set autoindent")            -- indent a new line the same amount as the line just typed
-- vim.cmd("set number")                -- add line numbers
vim.cmd("set wildmode=longest,list") -- get bash-like tab completions
vim.cmd("set cc=100")                -- set colour columns for good coding style
vim.cmd("filetype plugin indent on") -- allows auto-indenting depending on file type

vim.lsp.set_log_level('info')
vim.g.background = "light"
vim.g.have_nerd_font = true
vim.wo.number = true

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.swapfile = false

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

-- Vim Search Options
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true  -- unless capital letter in search

vim.opt.hlsearch = false  -- do not highlight all matches on previous search pattern
vim.opt.incsearch = true  -- incrementally highlight searches as you type

-- Scroll Options
vim.opt.scrolloff = 8     -- minimum number of lines to keep above and below the cursor
vim.opt.sidescrolloff = 8 --minimum number of columns to keep above and below the cursor

-- JS and CSS formatting
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.js", "*.html", "*.css", "*.ts" },
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
  end
})
