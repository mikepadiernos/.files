return {
  "gbprod/yanky.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    require("yanky").setup({
      preserve_cursor_position = {
        enabled = true,
      },
    })
  end,
}
