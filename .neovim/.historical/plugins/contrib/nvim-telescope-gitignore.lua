return {
  "chaosbaby/telescope-gitignore.nvim",
  config = function()
    require("telescope").load_extension "gitignore"
  end,
}
