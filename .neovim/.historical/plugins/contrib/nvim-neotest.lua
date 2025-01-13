return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-neotest/nvim-nio",
    "nvim-neotest/neotest-jest",
    "nvim-neotest/neotest-plenary",
    -- "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-vim-test",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "olimorris/neotest-phpunit",
  },
  config = function()
	require("neotest").setup({
	  adapters = {
		require('neotest-phpunit'),
		require('neotest-jest')({
		  jestCommand = require('neotest-jest.jest-util').getJestCommand(vim.fn.expand '%:p:h') .. ' --watch',
        }),
        -- require("neotest-python")({
        --   dap = { justMyCode = false },
        -- }),
		require("neotest-plenary"),
		require("neotest-vim-test")({
		  ignore_file_types = { "python", "vim", "lua" },
		}),
	  },
	})
  end,
}
