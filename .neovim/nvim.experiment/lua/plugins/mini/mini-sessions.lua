return {
  "echasnovski/mini.sessions",
  version = false,
  config = function()
    require("mini.sessions").setup {
      -- Whether to read latest session if Neovim opened without file arguments
      autoread = false,

      -- Whether to write current session before quitting Neovim
      autowrite = false, -- done manually in my config

      -- Directory where global sessions are stored (use `''` to disable)
      directory = "~/.config/nvim/session", --<"session" subdir of user data directory from |stdpath()|>,

      -- File for local session (use `''` to disable)
      file = "",

      -- Whether to force possibly harmful actions (meaning depends on function)
      force = { read = false, write = true, delete = false },

      -- Whether to print session path after action
      verbose = { read = false, write = true, delete = true },
    }
  end,
}
