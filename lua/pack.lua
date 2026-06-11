vim.pack.add({
	"https://github.com/bluz71/vim-moonfly-colors",
	"https://github.com/mofiqul/vscode.nvim",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/saghen/blink.cmp",
	"https://github.com/saghen/blink.indent",
	"https://github.com/saghen/blink.lib",
	"https://github.com/saghen/blink.pairs",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
	},
})

--[[
To do:
* install mason-lspconfig to set up the ensured install
* install nvim lint for built in linters
* fix nvim-web-devicons in completions
* possibly move blink stuff to its own file?
* see the rest of old config
]]
--

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

require("gitsigns").setup({
	attach_to_untracked = true,
	current_line_blame = true,
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
	current_line_blame_opts = {
		delay = 1000,
		ignore_whitespace = false,
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
	},
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	max_file_length = 40000,
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	preview_config = {
		-- Options passed to nvim_open_win
		border = "rounded",
		col = 1,
		relative = "cursor",
		row = 0,
		style = "minimal",
	},
	sign_priority = 6,
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	status_formatter = nil, -- Use default
	update_debounce = 100,
	watch_gitdir = { interval = 1000, follow_files = true },
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
})

require("blink.pairs").build():pwait(60000)
require("blink.pairs").setup({
	highlights = {
		enabled = true,
		groups = { "BlinkPairsOrange", "BlinkPairsPurple", "BlinkPairsBlue" },
	},
})
require("blink.indent").setup({
	static = {
		char = "▏",
	},
	scope = {
		char = "▏",
	},
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
	},
})
