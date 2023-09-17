local M = {
	lazy = false,
	priority = 1000,
	"Mofiqul/vscode.nvim",
	name = "vscode",
	config = function()
		vim.cmd("colorscheme vscode")
	end,
}

return M
