return {
  "basilgood/nvim-sensible",
  config = function()
    require("sensible").setup {
      options = {
        laststatus = 3,
        statuscolumn = "%s%=%{v:lnum} 🭰",
      },
    }
  end,
}
