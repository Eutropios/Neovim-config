local M = {
	"luukvbaal/statuscol.nvim",
	event = "VeryLazy",
	opts = function()
		local builtin = require("statuscol.builtin")
		return {
			setopt = true,
			-- order = "NSFs",
			-- Number Sign Fold sep
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
						name = { "Diagnostic" },
					},
				},
				{
					click = "v:lua.ScFa",
					condition = { true, builtin.not_empty },
					text = { " ", builtin.foldfunc, " " },
				},
			},
		}
	end,
}
return M
