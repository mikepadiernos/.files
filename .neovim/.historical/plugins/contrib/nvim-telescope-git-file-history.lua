return {
  'isak102/telescope-git-file-history.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
    'tpope/vim-fugitive',
  },
  config = function()
    require('telescope').load_extension('git_file_history')
  end,
}
