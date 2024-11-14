-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

local font_default = "GohuFont 11 Nerd Font Mono"

config.color_scheme = "One Dark (Gogh)"
config.colors = {
	background = "black",
}

config.font = wezterm.font(font_default)
config.font_size = 11
config.line_height = 1.25

config.window_frame = {
	font = wezterm.font({ family = font_default }),
	font_size = 11,
}

config.window_padding = {
	left = 7,
	right = 7,
	top = 7,
	bottom = 7,
}

return config
