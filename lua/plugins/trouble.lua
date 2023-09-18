local M = {

	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = {
		{
			"<leader>to",
			"<cmd>lua require('trouble').open()<cr>",
			desc = "open",
		},
		{
			"<leader>tw",
			"<cmd>lua require('trouble').open('workspace_diagnostics')<cr>",
			desc = "workspace diagnostics",
		},
		{
			"<leader>td",
			"<cmd>lua require('trouble').open('document_diagnostics')<cr>",
			desc = "document diagnostics",
		},
		{
			"<leader>tq",
			"<cmd>lua require('trouble').open('quickfix')<cr>",
			desc = "quickfix",
		},
		{
			"<leader>tl",
			"<cmd>lua require('trouble').open('loclist')<cr>",
			desc = "loclist",
		},
		{
			"<leader>tr",
			"<cmd>lua require('trouble').open('lsp_references')<cr>",
			desc = "lsp references",
		},
	},
}

return M
