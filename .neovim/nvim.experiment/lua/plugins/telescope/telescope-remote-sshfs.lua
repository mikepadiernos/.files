
-- Using lazy.nvim
return {
  "nosduco/remote-sshfs.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {
    -- Refer to the configuration section below
    -- or leave empty for defaults
  },
  config = function()
    require("telescope").load_extension "remote-sshfs"
    local api = require "remote-sshfs.api"
    vim.keymap.set("n", "<leader>rc", api.connect, {})
    vim.keymap.set("n", "<leader>rd", api.disconnect, {})
    vim.keymap.set("n", "<leader>re", api.edit, {})

    -- (optional) Override telescope find_files and live_grep to make dynamic based on if connected to host
    local builtin = require "telescope.builtin"
    local connections = require "remote-sshfs.connections"
    vim.keymap.set("n", "<leader>ff", function()
      if connections.is_connected then
        api.find_files()
      else
        builtin.find_files()
      end
    end, {})
    vim.keymap.set("n", "<leader>fg", function()
      if connections.is_connected then
        api.live_grep()
      else
        builtin.live_grep()
      end
    end, {})
  end,
}

