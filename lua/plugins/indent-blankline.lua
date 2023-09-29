local M = {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = "BufReadPre",
	opts = {
		indent = {
			char = "▎",
			tab_char = "▎",
			highlight = { "CursorColumn", "Whitespace" },
		},
		whitespace = {
			highlight = { "CursorColumn", "Whitespace" },
			remove_blankline_trail = false,
		},
		scope = {
			char = "▍",
			highlight = { "Function" },
		},
		exclude = {
			filetypes = {
				"coc-explorer",
				"dashboard",
				"floaterm",
				"alpha",
				"help",
				"packer",
				"NvimTree",
			},
		},
	},
	config = function(_, opts)
		require("ibl").setup(opts)
	end,
}

return M
