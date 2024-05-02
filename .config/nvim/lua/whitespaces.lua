local opt = vim.opt
local cmd = vim.cmd
local api = vim.api
local nvim_set_hl = api.nvim_set_hl

-- Display Whitespace
opt.list = true
local space = "·"
opt.listchars:append {
    tab = "│─",
    multispace = space,
    lead = space,
    trail = space,
    nbsp = space
}

cmd([[match TrailingWhitespace /\s\+$/]])
nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })

cmd([[match TrailingWhitespace /\s\+$/]])
nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })
