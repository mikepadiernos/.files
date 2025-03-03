return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		{ "b0o/nvim-tree-preview.lua", config = function() end },
	},
	cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	config = function(_)
		local function label(path)
			path = path:gsub(os.getenv("HOME"), "~", 1)
			return path:gsub("([a-zA-Z])[a-z0-9]+", "%1") .. (path:match("[a-zA-Z]([a-z0-9]*)$") or "")
		end
		require("nvim-tree").setup({
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			view = {
				width = 40,
			},
			sort = {
				sorter = "case_sensitive",
			},
			update_focused_file = {
				enable = true,
				update_root = true,
			},
			renderer = {
				-- root_folder_label = ":~:s?$?/..?",
				-- group_empty = false,
				root_folder_label = label,
				group_empty = label,
				icons = {
					git_placement = "after",
					modified_placement = "before",
					hidden_placement = "before",
					diagnostics_placement = "signcolumn",
					bookmarks_placement = "signcolumn",
					padding = " ",
					symlink_arrow = " ➛ ",
					show = {
						file = true,
						folder = true,
						folder_arrow = false,
						git = true,
						modified = true,
						hidden = true,
						diagnostics = true,
						bookmarks = true,
					},
					glyphs = {
						default = "",
						symlink = "",
						bookmark = "󰆤",
						modified = "●",
						hidden = "󰜌",
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			diagnostics = {
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			filters = {
				dotfiles = false,
				git_ignored = false,
				custom = { "^.git$", "^\\.cache$", "^.vscode$", "^.idea" },
			},
		})
	end,
}
