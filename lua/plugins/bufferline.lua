local M = {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<leader>pl",
            "<cmd>BufferLineTogglePin<cr>",
        },
    },
    opts = {
        options = {
            diagnostics = "nvim_lsp",
            hover = {
                enabled = true,
                delay = 0,
                reveal = { "close" },
            },
        },
        highlights = {
            buffer_visible = {
                fg = "#d4d4d4",
            },
        },
    },
}

return M
