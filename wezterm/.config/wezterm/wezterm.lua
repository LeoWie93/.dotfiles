local wezterm = require 'wezterm'

local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- custom
config.color_scheme = 'Tokyo Night'
-- config.color_scheme = 'Catppuccin Mocha'
-- config.color_scheme = 'rose-pine'
-- config.font = wezterm.font 'FiraCode Nerd Font Mono'
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.window_background_opacity = 1
config.scrollback_lines = 5000

config.window_decorations = 'NONE'
config.detect_password_input = true
config.audible_bell = 'Disabled'
config.enable_tab_bar = false

-- defaults
config.exit_behavior = 'CloseOnCleanExit'
config.front_end = 'OpenGL'
config.enable_wayland = true
config.default_domain = 'local'
config.bypass_mouse_reporting_modifiers = 'SHIFT'
config.debug_key_events = false

return config
