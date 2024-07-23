local path_check = require("path_check")

if path_check.is_program_in_path("node") then
    return {
        {
            "CopilotC-Nvim/CopilotChat.nvim",
            branch = "canary",
            dependencies = {
                { "zbirenbaum/copilot.lua" },
                { "nvim-lua/plenary.nvim" },
            },
            opts = {
                debug = false,
            },
        },
    }
end

return {}
