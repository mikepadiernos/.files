local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'ChiliConSql/neovim-stylus'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'rjyarwood/nvim_workspaces'
Plug 'nvim-lua/plenary.nvim'
Plug 'themercorp/themer.lua'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'folke/ts-comments.nvim'
--Plug 'romgrk/barbar.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'ahmedkhalf/project.nvim'
Plug 'nanozuki/tabby.nvim'
Plug 'echasnovski/mini.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
-- Plug 'Xuyuanp/yanil'
-- Plug 'tiagovla/scope.nvim'
-- Plug 'tpope/vim-fugitive'
-- Plug 'laytan/cloak.nvim'
-- Plug 'mbbill/undotree'
-- Plug 'folke/trouble.nvim'
-- Plug 'folke/neodev.nvim'
-- Plug 'folke/zen-mode.nvim'
-- Plug 'theprimeagen/vim-be-good'
-- Plug 'AckslD/nvim-neoclip.lua'
-- Plug 'preservim/vim-pencil'
-- Plug 'echasnovski/mini.icons'
-- Plug '3rd/image.nvim'
-- Plug 'NeogitOrg/neogit'
-- Plug 'chentoast/marks.nvim'
-- Plug 'sindrets/diffview.nvim'
-- Plug 'MunifTanjim/nui.nvim'
-- Plug 'iamcco/markdown-preview.nvim'
-- Plug 'mfussenegger/nvim-jdtls'
-- Plug 'MeanderingProgrammer/render-markdown.nvim'
-- Plug 'stevearc/oil.nvim'
-- Plug 'nvimdev/dashboard-nvim'
Plug('VonHeikemen/lsp-zero.nvim', { branch = 'v4.x' })
Plug('akinsho/bufferline.nvim', { tag = '*' })
-- Plug('nvim-telescope/telescope.nvim', { branch = '0.1.x' })
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = vim.fn[':TSUpdate'] })
Plug('https://git.drupalcode.org/project/vimrc.git', { branch = '8.x-1.x', rtp = 'bundle/vim-plugin-for-drupal' })

vim.call('plug#end')
