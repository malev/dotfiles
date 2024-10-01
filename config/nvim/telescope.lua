require('telescope').setup({
    defaults = {
        generic_sorter = require('mini.fuzzy').get_telescope_sorter,
        file_ignore_patterns = { ".git/", "node_modules" },
    },
})
