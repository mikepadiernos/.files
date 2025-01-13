return {
  "gcmt/vessel.nvim",
  config = function()
    require("vessel").setup {
      create_commands = true,
      commands = { -- not required unless you want to customize each command name
        view_marks = "Marks",
        view_jumps = "Jumps",
        view_buffers = "Buffers"
      }
    }
  end
}
