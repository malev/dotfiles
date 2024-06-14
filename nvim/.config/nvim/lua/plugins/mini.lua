return {
    { 'echasnovski/mini.bufremove', version = '*' },
    { 'echasnovski/mini.comment',   version = '*', config = function() require('mini.comment').setup() end },
    { 'echasnovski/mini.notify',    version = '*', config = function() require('mini.notify').setup() end },
    {
        'echasnovski/mini.surround',
        version = '*',
        config = function()
            require('mini.surround').setup()
        end
    },
}
