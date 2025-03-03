vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

Nerd_font = vim.g.have_nerd_font
Nerd_font = true

-- user
-- require "user.user-colors"
-- require "user.user-highlights"
require "user.user-options"
require "user.user-mappings"

-- core
require "core.core-options"
-- require "core.core-mappings"
require "core.core-bootstrap"
-- require "core.core-extend"

