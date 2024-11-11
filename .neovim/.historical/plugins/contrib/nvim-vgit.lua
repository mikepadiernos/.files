-- https://github.com/tanvirtin/vgit.nvim
--
return {
  "tanvirtin/vgit.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("vgit").setup()
  end,
}
