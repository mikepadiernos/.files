return {
  'rcarriga/nvim-notify',
  opts = {},
  config = function()
    require('notify').setup {
      -- config
      background_colour = '#000000',
      timeout = 3000,
      render = 'wrapped-compact',
      stages = 'fade',
      top_down = false,
    }
  end,
}
