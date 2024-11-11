return {
  '2kabhishek/octohub.nvim',
  cmd = {
    'OctoRepos',
    'OctoRepo',
    'OctoStats',
    'OctoActivityStats',
    'OctoContributionStats',
    'OctoRepoStats',
    'OctoProfile',
    'OctoRepoWeb',
  },
  -- Change these if you do not want to use default keybindings
  keys = {
    '<leader>goa',
    '<leader>goc',
    '<leader>gof',
    '<leader>gog',
    '<leader>goh',
    '<leader>goi',
    '<leader>goo',
    '<leader>gop',
    '<leader>gor',
    '<leader>gos',
    '<leader>got',
    '<leader>gou',
    '<leader>gow',
  },
  dependencies = {
    '2kabhishek/utils.nvim',
    'nvim-telescope/telescope.nvim'
  },
  -- Add your custom configs here, keep it blank for default configs (required)
  opts = {},
},
