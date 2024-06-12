local M = {
	"luukvbaal/statuscol.nvim",
	event = "VeryLazy",
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			segments = {
				{
					click = "v:lua.ScLa",
					text = { builtin.lnumfunc },
				},
				{
					click = "v:lua.ScSa",
					sign = {
						colwidth = 1,
						namespace = { "gitsigns" },
						wrap = true,
					},
				},
				{
					click = "v:lua.ScSa",
					sign = {
						maxwidth = 1,
						namespace = { "diagnostic/signs" },
					},
				},
				{
					click = "v:lua.ScFa",
					condition = { true, builtin.not_empty },
					text = { " ", builtin.foldfunc, " " },
				},
			},
		})
	end,
}

return M
