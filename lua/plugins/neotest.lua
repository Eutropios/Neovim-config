local M = {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python",
	},
	keys = {
		name = "Neotest",
		{
			"<leader>rn",
			"<cmd>lua require('neotest').run.run()<cr>",
			desc = "Run nearest test",
		},
		{
			"<leader>rf",
			"<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
			desc = "Run current file",
		},
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python"),
			},
		})
	end,
}

return M
