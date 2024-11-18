-- https://github.com/mboyov/pane-resizer.nvim
--
return {
    "mboyov/pane-resizer.nvim",
    config = function()
        require('pane_resizer').setup({
            NVIMTREE_WIDTH = 40,              -- Set NvimTree width (default is 30)
            FOCUSED_WIDTH_PERCENTAGE = 0.5,   -- Resize focused window to 50% (default is 60%)
        })
    end
}
