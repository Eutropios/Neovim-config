local M = {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		-- python
		"nvim-neotest/neotest-python",
		-- gtest
		"alfaix/neotest-gtest",
		-- zig
		"lawrence-laz/neotest-zig",
	},
	keys = {
		name = "neotest",
		{
			"<leader>rt",
			"<cmd>lua require('neotest').run.run()<cr>",
			desc = "Run tests",
		},
		{
			"<leader>rf",
			"<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
			desc = "Run tests on file",
		},
		{
			"<leader>rs",
			"<cmd>lua require('neotest').run.stop()<cr>",
			desc = "Stop tests",
		},
		{
			"<leader>ra",
			"<cmd>lua require('neotest').run.attach()<cr>",
			desc = "Attach to the nearest test",
		},
	},
	config = function()
		local neotest = require("neotest")
		neotest.setup({
			adapters = {
				require("neotest-python")({
					-- Extra arguments for nvim-dap configuration
					-- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
					dap = { justMyCode = false },
					-- Command line arguments for runner
					-- Can also be a function to return dynamic values
					args = { "--log-level", "DEBUG" },
					-- Runner to use. Will use pytest if available by default.
					-- Can be a function to return dynamic value.
					runner = "pytest",
				}),
				require("neotest-gtest").setup({}),
				require("neotest-zig")({
					dap = {
						adapter = "lldb",
					},
				}),
			},
		})
	end,
}

return M
