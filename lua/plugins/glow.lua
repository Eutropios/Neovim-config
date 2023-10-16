local M = {
	"ellisonleao/glow.nvim",
	keys = {
		{
			"<leader>mp",
			"<cmd>Glow<cr>",
			desc = "Preview Markdown",
		},
	},
	config = function()
		require("glow").setup({
			border = "shadow", -- floating window border config
			height_ratio = 0.95,
			style = "dark",
			width_ratio = 0.95,
		})
	end,
}

return M
