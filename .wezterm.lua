local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

config.color_scheme = 'tokyonight_moon'
config.font_size = 15.0
config.font = wezterm.font "JetBrainsMono Nerd Font"

config.enable_tab_bar = false
config.macos_window_background_blur = 30
config.window_background_opacity = 1
config.window_decorations = 'RESIZE'
config.audible_bell = "Disabled"

-- config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

config.mouse_bindings = {
    -- Ctrl-click will open the link under the mouse cursor
    {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'CTRL',
        action = act.OpenLinkAtMouseCursor,
    },
}

config.keys = {
    -- Clears the scrollback and viewport leaving the prompt line the new first line.
    {
        key = 'K',
        mods = 'CTRL',
        action = act.ClearScrollback 'ScrollbackAndViewport',
    },
}

return config
