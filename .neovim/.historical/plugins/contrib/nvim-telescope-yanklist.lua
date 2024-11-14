return {
  "hasansujon786/telescope-yanklist.nvim",
  event = { "CursorHold" },
  config = function()
    -- Put mappings
    Keymap("n", "p", "<Plug>(yanklist-auto-put)", { desc = "Put the text" })
    Keymap("n", "P", "<Plug>(yanklist-auto-Put)", { desc = "Put the text" })
    Keymap("x", "p", "<Plug>(yanklist-auto-put)gvy", { desc = "Put the text" })
    Keymap("x", "P", "<Plug>(yanklist-auto-Put)gvy", { desc = "Put the text" })
    -- Put last item from Yanklist
    Keymap("n", "<leader>ii", "<Plug>(yanklist-last-item-put)", { desc = "Paste from Yanklist" })
    Keymap("n", "<leader>iI", "<Plug>(yanklist-last-item-Put)", { desc = "Paste from Yanklist" })
    Keymap("x", "<leader>ii", "<Plug>(yanklist-last-item-put)gvy", { desc = "Paste from Yanklist" })
    Keymap("x", "<leader>iI", "<Plug>(yanklist-last-item-Put)gvy", { desc = "Paste from Yanklist" })
    -- Cycle through Yanklist items
    Keymap("n", "[r", "<Plug>(yanklist-cycle-forward)", { desc = "Yanklist forward" })
    Keymap("n", "]r", "<Plug>(yanklist-cycle-backward)", { desc = "Yanklist backward" })
    -- Show Yanklist
    Keymap("n", "<leader>oy", '<cmd>lua require("yanklist").yanklist()<CR>', { desc = "Show Yanklist" })
    Keymap("x", "<leader>oy", '<Esc><cmd>lua require("yanklist").yanklist_visual()<CR>', { desc = "Show Yanklist" })
  end,
}
