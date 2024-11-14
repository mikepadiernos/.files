return {
  'JoseConseco/telescope_sessions_picker.nvim',
  config = function()
    require('telescope').load_extension('sessions_picker')
  end,
}
