
return {
  "dsully/treesitter-jump.nvim",
  keys = {
        -- stylua: ignore
        { "%", function() require("treesitter-jump").jump() end },
  },
  opts = {},
  config = function()
    require("treesitter-jump").setup {
      language_pairs = {
        -- Customize language-specific pairs
        lua = {
          ["for"] = {
            ending = "end",
            middle = {},
          },
          -- Add more Lua configurations if needed
        },
        -- Add support for other languages
        javascript = {
          ["if"] = {
            ending = "}",
            middle = {
              ["else"] = true,
            },
          },
        },
      },
    }
  end,
}

