return {
  "smsimone/todolist.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("todolist").setup {}
  end,
}
