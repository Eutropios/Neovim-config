local M = {
	lazy = false,
	priority = 1000,
	"Mofiqul/vscode.nvim",
	name = "vscode",
	config = function()
		require("vscode").setup({})
		vim.cmd("colorscheme vscode")
		vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "white" })
	end,
}

return M
