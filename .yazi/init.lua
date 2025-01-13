require("yatline"):setup({
	-- section_separator = { open = "", close = "" },
	-- part_separator = { open = "", close = "" },
	-- inverse_separator = { open = "", close = "" },

	section_separator = { open = " ", close = " " },
	part_separator = { open = " ", close = " " },
	inverse_separator = { open = " ", close = " " },

	style_a = {
		fg = "#000000",
		bg_mode = {
			normal = "#efe100",
			select = "#C881E6",
			un_set = "red",
		},
	},
	style_b = {
		fg = "#efe100",
		-- bg_mode = {
		-- 	normal = "#efe100",
		-- 	select = "#d79921",
		-- 	un_set = "#d65d0e",
		-- },
	},
	style_c = {
		fg = "#000000",
		bg_mode = {
			normal = "#efe100",
			select = "#d79921",
			un_set = "#d65d0e",
		},
	},

	permissions_t_fg = "green",
	permissions_r_fg = "yellow",
	permissions_w_fg = "red",
	permissions_x_fg = "cyan",
	permissions_s_fg = "darkgray",

	tab_width = 20,
	tab_use_inverse = false,

	selected = { icon = "󰻭", fg = "yellow" },
	copied = { icon = "", fg = "green" },
	cut = { icon = "", fg = "red" },

	total = { icon = "󰮍", fg = "yellow" },
	succ = { icon = "", fg = "green" },
	fail = { icon = "", fg = "red" },
	found = { icon = "󰮕", fg = "blue" },
	processed = { icon = "󰐍", fg = "green" },

	show_background = true,

	display_header_line = false,
	display_status_line = true,

	-- header_line = {
	-- 	left = {
	-- 		section_a = {
	-- 			{ type = "line", custom = false, name = "tabs", params = { "left" } },
	-- 		},
	-- 		section_b = {
	-- 			{ type = "string", custom = false, name = "hovered_size" },
	-- 		},
	-- 		section_c = {},
	-- 	},
	-- 	right = {
	-- 		section_a = {
	-- 			{ type = "string", custom = false, name = "tab_mode" },
	-- 		},
	-- 		section_b = {
	-- 			{ type = "coloreds", custom = true, name = { { "󰇥 ", "#efe100" } } },
	-- 			-- { type = "coloreds", custom = true, name = { { "", "#373737" } } },
	-- 			{ type = "coloreds", custom = false, name = "count" },
	-- 			{ type = "coloreds", custom = true, name = { { "-", "#373737" } } },
	-- 		},
	-- 		section_c = {
	-- 			{ type = "coloreds", custom = false, name = "permissions" },
	-- 		},
	-- 	},
	-- },
	-- status_line = {
	-- 	left = {
	-- 		section_a = {
	-- 			-- { type = "coloreds", custom = true, name = { { " ", "#000000" } } },
	-- 			{ type = "string", custom = false, name = "tab_mode" },
	-- 		},
	-- 		section_b = {
	-- 			{ type = "string", custom = false, name = "hovered_size" },
	-- 		},
	-- 		section_c = {
	-- 			{ type = "string", custom = false, name = "hovered_name" },
	-- 			-- { type = "coloreds", custom = false, name = "count" },
	-- 		},
	-- 	},
	-- 	right = {
	-- 		section_a = {
	-- 			{ type = "string", custom = false, name = "cursor_position" },
	-- 		},
	-- 		section_b = {
	-- 			{ type = "string", custom = false, name = "cursor_percentage" },
	-- 		},
	-- 		section_c = {
	-- 			{ type = "string", custom = false, name = "hovered_file_extension", params = { true } },
	-- 			{ type = "coloreds", custom = false, name = "permissions" },
	-- 		},
	-- 	},
	-- },
	header_line = {
		left = {
			section_a = {},
			section_b = {},
			section_c = {},
		},
		right = {
			section_a = {},
			section_b = {},
			section_c = {},
		},
	},
	status_line = {
		left = {
			section_a = {
				-- { type = "line", custom = false, name = "tabs", params = { "left" }, bold = true },
			},
			section_b = {
				{ type = "string", custom = false, name = "hovered_path" },
			},
			section_c = {},
		},
		right = {
			section_a = {
				{ type = "string", custom = false, name = "tab_mode" },
			},
			section_b = {
				{ type = "coloreds", custom = true, name = { { "󰇥 ", "#efe100" } } },
				-- { type = "coloreds", custom = true, name = { { "", "#373737" } } },
				{ type = "coloreds", custom = false, name = "count" },
				{ type = "coloreds", custom = true, name = { { "-", "#373737" } } },
			},
			section_c = {
				{ type = "coloreds", custom = false, name = "permissions" },
			},
		},
	},
})
