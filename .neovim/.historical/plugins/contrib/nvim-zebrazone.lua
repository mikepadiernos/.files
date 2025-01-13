return {
  "notomo/zebrazone.nvim",
  lazy = false,
  config = function()
    require("zebrazone").start()
    require("zebrazone").stop()
  end,
}
