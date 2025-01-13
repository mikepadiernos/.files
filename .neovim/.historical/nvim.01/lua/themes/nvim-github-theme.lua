return {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()

        vim.api.nvim_set_hl(0, 'NeominimapBorder',  { fg = '#000000' })

        require('github-theme').setup({
            options = {
                transparent = true,
                inverse = {
                    match_paren = true,
                    visual = true,
                    search = true,
                }
            },
            groups = {
                all = {
                    NeominimapBorder = { fg = '#000000' },
                    WinSeparator     = { fg = '#000000' },
                }
            }
        })

        vim.cmd('colorscheme github_dark_default')
    end,
}
