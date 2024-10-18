local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'ChiliConSql/neovim-stylus'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'rjyarwood/nvim_workspaces'
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { branch = '0.1.x' })
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = vim.fn[':TSUpdate'] })
Plug('https://git.drupalcode.org/project/vimrc.git', { branch = '8.x-1.x', rtp = 'bundle/vim-plugin-for-drupal' })

vim.call('plug#end')
