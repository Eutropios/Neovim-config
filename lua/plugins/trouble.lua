local M = {

	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = {
		name = "Trouble",
		{
			"<leader>to",
			"<cmd>lua require('trouble').open()<cr>",
			"open",
		},
		{
			"<leader>tw",
			"<cmd>lua require('trouble').open('workspace_diagnostics')<cr>",
			"workspace diagnostics",
		},
		{
			"<leader>td",
			"<cmd>lua require('trouble').open('document_diagnostics')<cr>",
			"document diagnostics",
		},
		{
			"<leader>tq",
			"<cmd>lua require('trouble').open('quickfix')<cr>",
			"quickfix",
		},
		{
			"<leader>tl",
			"<cmd>lua require('trouble').open('loclist')<cr>",
			"loclist",
		},
		{
			"<leader>tr",
			"<cmd>lua require('trouble').open('lsp_references')<cr>",
			"lsp references",
		},
	},
}

return M
