return {
  'ccaglak/phptools.nvim',
  keys = {
	{ "<leader>lm", "<cmd>Php Method<cr>"},
	{ "<leader>lc", "<cmd>Php Class<cr>"},
	{ "<leader>ls", "<cmd>Php Scripts<cr>"},
	{ "<leader>ln", "<cmd>Php Namespace<cr>"},
	{ "<leader>lg", "<cmd>Php GetSet<cr>"},
	{ "<leader>lf", "<cmd>Php Create<cr>"},
  },
  dependencies = {
	"nvim-lua/plenary.nvim"
  },
  config = function()
	require('phptools').setup({
	  custom_toggles = {
	  -- { "foo", "bar", "baz" },
	  -- Add more custom toggle groups here
	  },
	  ui = false, -- Set to true if not using a UI enhancement plugin
	})
	vim.keymap.set('v', '<leader>lr', function()
		  require("phptools.refactor").refactor()
	  end, { desc = 'PhpRefactor' })
  end
}

