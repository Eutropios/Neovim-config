local M = {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = "BufReadPre",
	opts = {
		indent = {
			char = "▏",
			tab_char = "▏",
		},
		whitespace = {
			remove_blankline_trail = false,
		},
		exclude = {
			filetypes = {
				"alpha",
				"coc-explorer",
				"dashboard",
				"floaterm",
				"help",
				"lazy",
				"lazyterm",
				"mason",
				"neo-tree",
				"notify",
				"NvimTree",
				"packer",
				"toggleterm",
				"Trouble",
			},
		},
	},
	config = function(_, opts)
		require("ibl").setup(opts)
	end,
}

return M
