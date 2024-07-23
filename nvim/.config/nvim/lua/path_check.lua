local path_check = {}

function path_check.is_program_in_path(program)
    local check_command = "which " .. program .. " > /dev/null 2>&1"
    local result = os.execute(check_command)
    return result == 0
end

return path_check
