return {
    -- Set `fg` to the color you want your window separators to have
    vim.api.nvim_set_hl(0, 'Normal', { bg = '#000000' }),
    vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#000000' }),
    vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#000000', bg = '#000000' })
}
