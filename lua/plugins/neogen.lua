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
}

return M
