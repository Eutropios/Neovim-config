local M = {
	"danymat/neogen",
	keys = {
		{
			"<leader>ga",
			function()
				require("neogen").generate({})
			end,
			desc = "Generate Annotations",
		},
	},
	opts = {
		snippet_engine = "luasnip",
	},
	config = function()
		require("neogen").setup({
			enabled = true,
			languages = {
				lua = {
					template = {
						annotation_convention = "emmylua",
					},
				},
				python = {
					template = {
						annotation_convention = "reST",
					},
				},
			},
		})
	end,
}

return M
