return {
  "echasnovski/mini.starter",
  version = false,
  config = function()
    local starter = require "mini.starter"

    -- local project_nvim = require("project_nvim")
    -- local recent_projects = project_nvim.get_recent_projects()

    -- print(vim.inspect(recent_projects))

    local items = {
      starter.sections.builtin_actions(),
      -- { name = 'Sessions', action = ":lua require'telescope'.extensions.sessions.sessions{}", section = 'Telescope' },
      { name = "Projects", action = ":Telescope projects", section = "Telescope" },
      { name = "Recent Files", action = ":Telescope oldfiles", section = "Telescope" },
      -- { name = 'Restore session', action = [[lua require("persistence").load()]], section = 'Session' },
      -- { name = 'File Browser', action = ':Telescope file_browser', section = 'Telescope' },
      -- starter.sections.recent_files(9, false),
      -- starter.sections.recent_files(11, true),
      -- Use this if you set up 'mini.sessions'
      -- starter.sections.sessions(9, true),
      -- { name = 'Projects', action = ':e ~/Projects', section = 'Bookmarks' },
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
        starter.gen_hook.indexing("all", {
          "Builtin actions",
          "Telescope",
          -- 'Bookmarks'
        }),
        starter.gen_hook.padding(0, 1),
        starter.gen_hook.aligning("center", "center"),
      },

      query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_-.",

      silent = false,
    }
  end,
}
