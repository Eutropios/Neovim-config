local M = {
    "ellisonleao/glow.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<leader>mp",
            "<cmd>Glow<cr>",
            desc = "Preview Markdown"
        }
    },
    config = function()
        local glow = require("glow").setup({
            style = "light",
            width_ratio = 0.95,
            height_ratio = 0.95,
            border = "shadow",
            width = 250,
        })
    end,
}

return M
