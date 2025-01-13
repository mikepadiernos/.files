return {
  'Rizwanelansyah/simplyfile.nvim',
  tag = 'v0.8',
  config = function()
	require("simplyfile").setup {
	  border = {
		  left = "solid",
		  main = "solid",
		  right = "solid",
	  },
	  derfault_keymaps = true,
	  keymaps = {
		  --- your custom keymaps
		  --- {dir} have following field
		  --- name: name of file/folder
		  --- absolute: absolute path of file/folder
		  --- icon: the nerd fonts icon
		  --- hl: highlight group name for icon
		  --- filetype: type of file
		  --- is_folder: folder or not
		  -- ["lhs"] = function(dir) --[[ some code ]] end
	  },
	  preview = {
		  image = true, -- for previewing image (for v0.7+ only)
	  },
	}
  end,
}
