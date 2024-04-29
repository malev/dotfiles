return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'AndreM222/copilot-lualine' },
    config = function()
        require('lualine').setup {
            options = {
                theme = 'dracula'
            },
            sections = {
                lualine_x = { 'copilot', 'encoding', 'fileformat', 'filetype' },
            }
        }
    end
}
