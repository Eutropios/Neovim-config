local M = {
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	keys = {
		{
			"<leader>pl",
			"<cmd>BufferLineTogglePin<cr>",
			desc = "Pin Buffer",
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
			separator_style = "slant",
		},
		highlights = {
			buffer_visible = {
				fg = "#d4d4d4",
			},
		},
	},
}

return M
