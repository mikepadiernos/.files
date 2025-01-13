return {
  "coffebar/transfer.nvim",
  lazy = true,
  cmd = { "TransferInit", "DiffRemote", "TransferUpload", "TransferDownload", "TransferDirDiff", "TransferRepeat" },
  opts = {},
  config = function()
	require('transfer').setup({
	  window = {
		mappings = {
		  -- upload (sync files)
		  uu = {
			function(state)
			  vim.cmd("TransferUpload " .. state.tree:get_node().path)
			end,
			desc = "upload file or directory",
			nowait = true,
		  },
		  -- download (sync files)
		  ud = {
			function(state)
			  vim.cmd("TransferDownload" .. state.tree:get_node().path)
			end,
			desc = "download file or directory",
			nowait = true,
		  },
		  -- diff directory with remote
		  uf = {
			function(state)
			  local node = state.tree:get_node()
			  local context_dir = node.path
			  if node.type ~= "directory" then
				-- if not a directory
				-- one level up
				context_dir = context_dir:gsub("/[^/]*$", "")
			  end
			  vim.cmd("TransferDirDiff " .. context_dir)
			  vim.cmd("Neotree close")
			end,
			desc = "diff with remote",
		  },
		},
	  },
	})
	require("which-key").add({
	  { "<leader>u", group = "Upload / Download", icon = "" },
	  {
		"<leader>ud",
		"<cmd>TransferDownload<cr>",
		desc = "Download from remote server (scp)",
		icon = { color = "green", icon = "󰇚" },
	  },
	  {
		"<leader>uf",
		"<cmd>DiffRemote<cr>",
		desc = "Diff file with remote server (scp)",
		icon = { color = "green", icon = "" },
	  },
	  {
		"<leader>ui",
		"<cmd>TransferInit<cr>",
		desc = "Init/Edit Deployment config",
		icon = { color = "green", icon = "" },
	  },
	  {
		"<leader>ur",
		"<cmd>TransferRepeat<cr>",
		desc = "Repeat transfer command",
		icon = { color = "green", icon = "󰑖" },
	  },
	  {
		"<leader>uu",
		"<cmd>TransferUpload<cr>",
		desc = "Upload to remote server (scp)",
		icon = { color = "green", icon = "󰕒" },
	  },
	})
  end,
}
