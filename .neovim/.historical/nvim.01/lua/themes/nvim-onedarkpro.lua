return {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    -- somewhere in your config:
    config = function()
        vim.cmd("colorscheme onedark_dark")

        vim.api.nvim_set_hl(0, 'NeominimapBorder',  { fg = '#000000' })
        vim.api.nvim_set_hl(0, 'WinSeparator',      { fg = '#000000', bg = '#000000' })

        require("onedarkpro").setup({
            options = {
                transparency = true
            }
        })
    end
}

