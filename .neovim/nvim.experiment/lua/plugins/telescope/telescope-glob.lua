
return {
  "thenbe/telescope-glob.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("telescope").load_extension "glob"
  end,
  keys = {
    { "<leader>fg", "<cmd> Telescope glob <CR>", desc = "Pick a glob" },
    { "<leader>mgg", "<cmd>GlobUpdate<cr>", desc = "Enter a glob" },
    { "<leader>mgd", "<cmd>GlobDir<cr>", desc = "Enter a directory glob" },
    {
      "<leader>mgc",
      function()
        require("telescope-glob").set_glob { value = "" }
      end,
      desc = "Clear the glob",
    },
    {
      "<leader>mgl",
      function()
        require("telescope-glob").set_glob { value = "**/*.lua" }
      end,
      desc = "Set the glob (lua)",
    },
  },
}

