-- Pull in the wezterm API
local wezterm 		= require 'wezterm'

-- This will hold the configuration.
local config 		= wezterm.config_builder()

config.font			= wezterm.font('ShureTechMono Nerd Font')
config.font_size	= 14 
config.line_height	= 1.5

config.window_frame = {
  font 				= wezterm.font { family = 'ShureTechMono Nerd Font' },
  font_size			= 14,
  line_height		= 1.5,
}

config.window_padding = {
	left 			= 7,
	right 			= 7,
	top 			= 7,
	bottom 			= 7,
}

return config
