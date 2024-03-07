local M = {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	dependencies = {
		{
			"hrsh7th/nvim-cmp",
			event = {
				"InsertEnter",
				"CmdlineEnter",
			},
		},
	},
	opts = {
		check_ts = true,
	},
	config = function(_, opts)
		local npairs = require("nvim-autopairs")
		local Rule = require("nvim-autopairs.rule")
		npairs.setup(opts)

		--- setup for cmp
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		npairs.add_rules({
			Rule("<", ">", { "markdown", "rst" }):with_move(),
			Rule('"""', '"""', "python"):with_move(),
			Rule(":", ":", "rst"):with_move(),
		})
	end,
}

return M
