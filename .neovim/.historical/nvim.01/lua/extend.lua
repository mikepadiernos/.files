require('lazy').setup({

    -- Plugins
    require 'plugins',

    -- Plugins: configs
    { import = 'plugins.mini' },
    { import = 'plugins.contrib' },
    { import = 'plugins.vim' },
    { import = 'plugins.drupal' },

    -- Themes
    { enabled = true,  'projekt0n/github-nvim-theme' },
    { enabled = false, 'olimorris/onedarkpro.nvim' },

    -- Themes: configs
    { import = 'themes' },

    -- LSP
    { enabled = true,   'williamboman/mason.nvim' },
    { enabled = true,   'williamboman/mason-lspconfig.nvim' },

    -- LSP: extensions
    { import = 'lsp' },

    -- Completions
    { enabled = true,	'hrsh7th/nvim-cmp'},
    { enabled = true,  'petertriho/cmp-git' },
    { enabled = true,  'fbuchlak/cmp-symfony-router'},

    -- Completions: configs
    { import = 'completions' },
})
