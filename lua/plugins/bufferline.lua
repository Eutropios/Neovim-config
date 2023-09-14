local M = {
    "akinsho/bufferline.nvim",
    lazy = false,
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
            separator_style = "slant"
        },
        highlights = {
            buffer_visible = {
                fg = "#d4d4d4",
            },
        },
    },
}

return M
