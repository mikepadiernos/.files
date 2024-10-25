-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- local font_default = "ShureTechMono Nerd Font"
local font_default = "Atari ST 8x16 System Font"

config.color_scheme = "One Dark (Gogh)"
config.colors = {
  background = 'black'
}

config.font = wezterm.font(font_default)
config.font_size = 13
config.line_height = 1.5

config.window_frame = {
	font = wezterm.font({ family = font_default }),
	font_size = 13,
}

config.window_padding = {
	left = 7,
	right = 7,
	top = 7,
	bottom = 7,
}

local function get_current_working_dir(tab)
	local current_dir = tab.active_pane.current_working_dir
	local HOME_DIR = string.format("file://%s", os.getenv("HOME"))

	return current_dir == HOME_DIR and "." or string.gsub(current_dir, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover)
	local title = string.format(" %s  %s ~ %s  ", "❯", get_current_working_dir(tab))

	return {
		{ Text = title },
	}
end)

return config
