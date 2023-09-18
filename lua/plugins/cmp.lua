local M = {
	"hrsh7th/nvim-cmp",
	version = false, -- last release is way too old
	event = "BufReadPre",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
	},
	opts = function()
		vim.api.nvim_set_hl(
			0,
			"CmpGhostText",
			{ link = "Comment", default = true }
		)
		local cmp = require("cmp")
		local lsp_kinds = require("utils").lsp_kinds
		local defaults = require("cmp.config.default")()
		return {
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item({
					behavior = cmp.SelectBehavior.Insert,
				}),
				["<C-p>"] = cmp.mapping.select_prev_item({
					behavior = cmp.SelectBehavior.Insert,
				}),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<S-CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
			}),
			formatting = {
				format = function(entry, vim_item)
					if vim.tbl_contains({ "path" }, entry.source.name) then
						local icon, hl_group =
							require("nvim-web-devicons").get_icon(
								entry:get_completion_item().label
							)
						if icon then
							vim_item.kind = icon
							vim_item.kind_hl_group = hl_group
							return vim_item
						end
					end
					vim_item.kind = (lsp_kinds[vim_item.kind] or "")
						.. " "
						.. vim_item.kind

					return vim_item
				end,
			},
			experimental = {
				ghost_text = {
					hl_group = "CmpGhostText",
				},
			},
			sorting = defaults.sorting,
		}
	end,
}

return M
