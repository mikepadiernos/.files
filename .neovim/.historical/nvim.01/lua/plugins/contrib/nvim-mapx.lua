return {
    "b0o/mapx.nvim",
    config = function()
        mapx.group({ prefix = "<leader>t" }, "LSP", function()
            mapx.group({ prefix = "g" }, "Goto", function()
                nnoremap("d", "<cmd>lua vim.lsp.buf.definition()<Cr>",      "Definition")
                nnoremap("D", "<cmd>lua vim.lsp.buf.declaration()<Cr>",     "Declaration")
                nnoremap("i", "<cmd>lua vim.lsp.buf.implementation()<Cr>",  "Implementation")
                nnoremap("t", "<cmd>lua vim.lsp.buf.type_definition()<Cr>", "Type definition")
                nnoremap("r", "<cmd>lua vim.lsp.buf.references()<Cr>",      "References")
            end)
            mapx.group({ prefix = "w" }, "Workspace", function()
                nnoremap("a", "<cmd>lua vim.lsp.buf.add_workspace_folder()<Cr>",                       "Add folder")
                nnoremap("r", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<Cr>",                    "Rm folder")
                nnoremap("l", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<Cr>", "List folders")
            end)
        end)

        -- Would be equivalent to:
        mapx.nname("<leader>l", "LSP")
        mapx.nname("<leader>lg", "LSP-Goto")
        nnoremap ("<leader>lgd", "<cmd>lua vim.lsp.buf.definition()<Cr>",      "LSP-Goto: Definition")
        nnoremap ("<leader>lgD", "<cmd>lua vim.lsp.buf.declaration()<Cr>",     "LSP-Goto: Declaration")
        nnoremap ("<leader>lgi", "<cmd>lua vim.lsp.buf.implementation()<Cr>",  "LSP-Goto: Implementation")
        nnoremap ("<leader>lgt", "<cmd>lua vim.lsp.buf.type_definition()<Cr>", "LSP-Goto: Type definition")
        nnoremap ("<leader>lgr", "<cmd>lua vim.lsp.buf.references()<Cr>",      "LSP-Goto: References")
        mapx.nname("<leader>lw", "LSP-Workspace")
        nnoremap ("<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<Cr>",                       "LSP-Workspace: Add folder")
        nnoremap ("<leader>lwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<Cr>",                    "LSP-Workspace: Rm folder")
        nnoremap ("<leader>lwl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<Cr>", "LSP-Workspace: List folders")
    end
}
