return {
  "yamatsum/nvim-nonicons",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  config = function()
    local icons = require "nvim-nonicons"
    local nonicons_nvimtree = require "nvim-nonicons.extentions.nvim-tree"

    require("telescope").setup {
      defaults = {
        prompt_prefix = "  " .. icons.get "telescope" .. "  ",
        selection_caret = " ❯ ",
        entry_prefix = "   ",
      },
    }

    require("nvim-tree").setup {
      renderer = {
        icons = {
          glyphs = nonicons_nvimtree.glyphs,
        },
      },
    }
  end,
}
