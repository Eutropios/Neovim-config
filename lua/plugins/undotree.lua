local M = {
	event = "BufReadPre",
	"mbbill/undotree",
	keys = {
		{
			"<leader>u",
			"<cmd>UndotreeToggle<cr>",
			desc = "UndotreeToggle",
		},
	},
}

return M
