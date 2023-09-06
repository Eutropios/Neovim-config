local M = {
    event = "VeryLazy",
    "mbbill/undotree",
    config = function()
        vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    end
}

return M
