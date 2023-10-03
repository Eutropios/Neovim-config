local M = {
	event = "BufReadPre",
	"mbbill/undotree",
	keys = {
		{
			"<leader>ut",
			"<cmd>UndotreeToggle<cr>",
			desc = "Toggle Undotree",
		},
		{
			"<leader>uf",
			"<cmd>UndotreeFocus<cr>",
			desc = "Focus on Undotree",
		},
	},
}

return M
