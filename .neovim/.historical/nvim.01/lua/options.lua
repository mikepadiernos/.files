vim.g.mapleader				    = ' '

vim.opt.number 				    = true
vim.opt.relativenumber 			= true

vim.o.backup       			    = false          -- Don't store backup
vim.o.mouse        			    = 'a'            -- Enable mouse
vim.o.mousescroll  			    = 'ver:25,hor:6' -- Customize mouse scroll
vim.o.switchbuf    			    = 'usetab'       -- Use already opened buffers when switching
vim.o.writebackup  			    = false          -- Don't store backup
vim.o.undofile     			    = true           -- Enable persistent undo

vim.cmd('filetype plugin indent on') -- Enable all filetype plugins

vim.o.breakindent   			= true      -- Indent wrapped lines to match line start
vim.o.colorcolumn   			= '+1'      -- Draw colored column one step to the right of desired maximum width
vim.o.cursorline    			= true      -- Enable highlighting of the current line
vim.o.laststatus    			= 2         -- Always show statusline
vim.o.linebreak     			= true      -- Wrap long lines at 'breakat' (if 'wrap' is set)
vim.o.list          			= true      -- Show helpful character indicators
vim.o.number        			= true      -- Show line numbers
vim.o.pumblend      			= 10        -- Make builtin completion menus slightly transparent
vim.o.pumheight     			= 10        -- Make popup menu smaller
vim.o.ruler         			= false     -- Don't show cursor position
vim.o.shortmess     			= 'aoOWFcS' -- Disable certain messages from |ins-completion-menu|
vim.o.showmode      			= false     -- Don't show mode in command line
vim.o.showtabline   			= 2         -- Always show tabline
vim.o.signcolumn    			= 'yes'     -- Always show signcolumn or it would frequently shift
vim.o.splitbelow    			= true      -- Horizontal splits will be below
vim.o.splitright    			= true      -- Vertical splits will be to the right
vim.o.termguicolors 			= true      -- Enable gui colors
vim.o.winblend      			= 10        -- Make floating windows slightly transparent
vim.o.wrap          			= false     -- Display long lines as just one line

if vim.fn.has('nvim-0.9') == 1 then
  vim.opt.shortmess:append('C') -- Don't show "Scanning..." messages
  vim.o.splitkeep               = 'screen'    -- Reduce scroll during window split
end

vim.o.autoindent    			= true     -- Use auto indent
vim.o.expandtab     			= false    -- Convert tabs to spaces
vim.o.formatoptions 			= 'rqnl1j' -- Improve comment editing
vim.o.ignorecase    			= true     -- Ignore case when searching (use `\C` to force not doing that)
vim.o.incsearch     			= true     -- Show search results while typing
vim.o.infercase     			= true     -- Infer letter cases for a richer built-in keyword completion
vim.o.shiftwidth    			= 2        -- Use this number of spaces for indentation
vim.o.smartcase     			= true     -- Don't ignore case when searching if pattern has upper case
vim.o.smartindent   			= true     -- Make indenting smart
vim.o.tabstop       			= 4        -- Insert 2 spaces for a tab
vim.o.virtualedit   			= 'block'  -- Allow going past the end of line in visual block mode

vim.opt.iskeyword:append('-')  -- Treat dash separated words as a word text object

vim.o.formatlistpat 			= [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]

-- vim.o.foldmethod                = 'expr'   -- Set 'indent' folding methodi
-- vim.o.foldlevel                 = 1        -- Display all folds except top ones
-- vim.o.foldnestmax               = 10       -- Create folds only for some number of nested levels
-- vim.g.markdown_folding          = 1        -- Use folding by heading in markdown files

-- if vim.fn.has('nvim-0.10') == 1 then
--   vim.o.foldtext                = ''       -- Use underlying text with its highlighting
-- end

if vim.fn.has('nvim-0.11') == 1 then
  vim.opt.completeopt:append('fuzzy') -- Use fuzzy matching for built-in completion
end
