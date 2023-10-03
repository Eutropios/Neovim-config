local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	keys = {
		name = "Telescope",
		{
			"<leader>pf",
			"<cmd>lua require('telescope.builtin').find_files()<cr>",
			desc = "Open fuzzy finder",
		},
		{
			"<leader>ps",
			"<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep > ')})<cr>",
			desc = "Grep in buffer",
		},
		{
			"<leader>pp",
			"<cmd>lua require('telescope.builtin').git_files()<cr>",
			desc = "Git files",
		},
		{
			"<leader>pg",
			"<cmd>lua require('telescope.builtin').live_grep()<cr>",
			desc = "Live grep",
		},
	},
	config = function()
		local ts = require("telescope")
		ts.setup({
			defaults = {
				file_ignore_patterns = {
					".git",
				},
				layout_config = {
					horizontal = {
						width = 0.95,
						preview_width = 0.6,
					},
				},
			},
			pickers = {
				find_files = { hidden = true },
				live_grep = {
					additional_args = function(opts)
						return { "--hidden" }
					end,
				},
			},
		})
		ts.load_extension("fzf")
	end,
}

return M
