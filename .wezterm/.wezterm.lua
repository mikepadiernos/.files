-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

local font_default = "ShureTechMono Nerd Font"

config.color_scheme = "One Dark (Gogh)"

config.font = wezterm.font(font_default)
config.font_size = 14
config.line_height = 1.5

config.window_frame = {
	font = wezterm.font({ family = font_default }),
	font_size = 14,
	line_height = 1.5,
}

config.window_padding = {
	left = 7,
	right = 7,
	top = 7,
	bottom = 7,
}

return config
