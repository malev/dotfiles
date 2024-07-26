return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'AndreM222/copilot-lualine' },
    config = function()
        require('lualine').setup {
            options = {
                theme = 'tokyonight'
            },
            sections = {
                lualine_x = { 'copilot', 'encoding', 'fileformat', 'filetype' },
            }
        }
    end
}
