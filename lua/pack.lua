vim.pack.add({
	"https://github.com/bluz71/vim-moonfly-colors",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/saghen/blink.lib",
	"https://github.com/saghen/blink.cmp",
	"https://github.com/saghen/blink.pairs",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/stevearc/conform.nvim",
})

local cmp = require("blink.cmp")
cmp.build():pwait()
cmp.setup({
	sources = { default = { "lsp", "path", "snippets", "buffer" } },
	cmdline = {
		keymap = { preset = "inherit" },
		completion = { menu = { auto_show = true } },
	},
	completion = {
		menu = {
			draw = {
				components = {
					kind_icon = {
						text = function(ctx)
							local icon = ctx.kind_icon
							local dev_icon, _ =
								require("nvim-web-devicons").get_icon(ctx.label)
							if dev_icon then
								icon = dev_icon
							end
							return icon .. ctx.icon_gap
						end,
					},
				},
			},
		},
	},
})

require("blink.pairs").build():pwait(60000)
require("blink.pairs").setup()

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
	},
})
