local M = {
    event = "VeryLazy",
    "nvim-tree/nvim-tree.lua",
    keys = {
        { "<C-n>",     "<cmd>NvimTreeToggle<cr>",  desc = "Toggle nvimtree" },
        { "<leader>e", "<cmd>NvimTreeFocus<cr>", desc = "Focus nvimtree" },
    },
    config = function()
        local nt = require("nvim-tree")
        nt.setup({
            sort_by = "case_sensitive",
            view = {
                width = 30,
            },
            renderer = {
                group_empty = true,
            },
        })
    end
}

return M
