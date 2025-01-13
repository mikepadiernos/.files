return {
    'echasnovski/mini.starter',
    enabled = true,
    version = false,
    config = function()
	  local starter = require('mini.starter')
	  local items = {
		starter.sections.builtin_actions(),
		{ name = 'Sessions', action = ":lua require'telescope'.extensions.sessions.sessions{}", section = 'Telescope' },
		{ name = 'Recent Files', action = ':Telescope oldfiles', section = 'Telescope' },
		{ name = 'File Brower', action = ':Telescope file_browser', section = 'Telescope' },
		-- starter.sections.recent_files(10, false),
		-- starter.sections.recent_files(10, true),
		-- Use this if you set up 'mini.sessions'
		starter.sections.sessions(9, true),
		-- { name = 'Addons', action = ':e ~/.config/blender/2.82/scripts/addons', section = 'Bookmarks' },
		-- { name = 'NvimPlugs', action = ':e ~/.local/share/nvim/site/pack/packer/start', section = 'Bookmarks' },
	  }
	  starter.setup {
		autoopen = true,

		evaluate_single = false,

		items = items,

		header = nil,

		footer = nil,

		content_hooks = {
		  starter.gen_hook.adding_bullet(),
		  starter.gen_hook.indexing('all', { 
			'Builtin actions', 
			'Telescope', 
			-- 'Bookmarks'
		  }),
		  starter.gen_hook.padding(5, 2),
		  starter.gen_hook.aligning('left', 'top'),
		},

		query_updaters = 'abcdefghijklmnopqrstuvwxyz0123456789_-.',

		silent = false,
	  }
  end
}
