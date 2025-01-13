return {
  "jackMort/tide.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("tide").setup {
      -- optional configuration
      keys = {
        leader = ";", -- Leader key to prefix all Tide commands
        panel = ";", -- Open the panel (uses leader key as prefix)
        add_item = "a", -- Add a new item to the list (leader + 'a')
        delete = "d", -- Remove an item from the list (leader + 'd')
        clear_all = "x", -- Clear all items (leader + 'x')
        horizontal = "-", -- Split window horizontally (leader + '-')
        vertical = "|", -- Split window vertically (leader + '|')
      },
      animation_duration = 300, -- Animation duration in milliseconds
      animation_fps = 30, -- Frames per second for animations
      hints = {
        dictionary = "qwertzuiopsfghjklycvbnm", -- Key hints for quick access
      },
      vim.api.nvim_set_hl(0, "TideBg", { bg = User_bg }),
      vim.api.nvim_set_hl(0, "TideHeader", { fg = User_accent, bold = true }),
      vim.api.nvim_set_hl(0, "TideSeparator", { fg = User_bg }),
    }
  end,
}
