local options = {}

function options.setup()
  vim.g.mapleader = " "
  vim.opt.cc = "100"
  vim.opt.mouse = "a"
  vim.opt.wildmode = "longest,list"
  vim.opt.expandtab = true
  vim.opt.tabstop = 2
  vim.opt.softtabstop = 2
  vim.opt.shiftwidth = 2
  vim.cmd("filetype plugin indent on")

  vim.opt.ignorecase = true
  vim.opt.smartcase = true
  vim.opt.hlsearch = true
  vim.opt.incsearch = true

  vim.opt.scrolloff = 8
  vim.opt.sidescrolloff = 8

  vim.wo.number = true

  vim.o.termguicolors = true
  vim.g.have_nerd_font = true
  vim.cmd('colorscheme tokyonight-moon')

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
end

return options
