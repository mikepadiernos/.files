return {
    'jlesquembre/nterm.nvim',
    dependencies = {
        'Olical/aniseed'
    },
    config = function()
        -- config
        require'nterm.main'.init({
            maps = true,  -- load defaut mappings
            shell = "zsh",
            size = 30,
            direction = "horizontal", -- horizontal or vertical
            popup = 2000,     -- Number of miliseconds to show the info about the commmand. 0 to dissable
            popup_pos = "SW", --  one of "NE" "SE" "SW" "NW"
            autoclose = 2000, -- If command is succesful, close the terminal after that number of miliseconds. 0 to disable
        })

        -- Optional, if you want to use the telescope extension
        require('telescope').load_extension('nterm')
    end,
}
