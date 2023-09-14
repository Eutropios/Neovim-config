local M = {
    event = "BufReadPost",
    "mbbill/undotree",
    config = function()
        vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = "Undotree" })
    end
}

return M
