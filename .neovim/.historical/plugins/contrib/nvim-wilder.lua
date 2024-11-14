return {
  'gelguy/wilder.nvim',
  config = function()
    -- config goes here
    local wilder = require 'wilder'
    wilder.setup { modes = { ':', '/', '?' } }
  end,
}
