return {
  "utilyre/barbecue.nvim",
  lazy = false,
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  opts = {
    -- configurations go here
  },
  config = function()
    require("barbecue").setup {
      theme = {
        normal = { bg = User_bg },
      },
    }
  end,
}
