return {
    { 'echasnovski/mini.bufremove', version = '*' },
    {
        'echasnovski/mini.comment',
        version = '*',
        config = function()
            require('mini.comment').setup()
        end
    },
    {
        'echasnovski/mini.jump2d',
        version = '*',
        config = function()
            require('mini.jump2d').setup({
                view = {
                    n_steps_ahead = 0,
                },
            })
        end
    },
    {
        'echasnovski/mini.notify',
        version = '*',
        config = function()
            require('mini.notify').setup()
        end
    },
    {
        'echasnovski/mini.surround',
        version = '*',
        config = function()
            require('mini.surround').setup()
        end
    },
}
