local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		opt = false,
	},
	lazy = false,
	opts = function()
		local function diff_source()
			local gitsigns = vim.b.gitsigns_status_dict
			if gitsigns then
				return {
					added = gitsigns.added,
					modified = gitsigns.changed,
					removed = gitsigns.removed,
				}
			end
		end

		local location = { "location", padding = 0 }
		return {
			options = {
				always_divide_middle = true,
				component_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "dashboard" },
				globalstatus = true,
				icons_enabled = true,
				section_separators = { left = "", right = "" },
				theme = "vscode",
			},
			sections = {
				lualine_a = { "branch" },
				lualine_b = {
					"normal",
					{ "diff", source = diff_source },
				},
				lualine_c = {
					"diagnostics",
					{
						require("lazy.status").updates,
						cond = require("lazy.status").has_updates,
					},
				},
				lualine_x = {
					"filesize",
					"encoding",
					{ "filetype", icons_enabled = true },
				},
				lualine_y = { "progress" },
				lualine_z = {
					{
						"location",
						component_separators = "",
						padding = { left = 0, right = 1 },
					},
					{
						"selectioncount",
						component_separators = "",
						padding = { left = 1, right = 1 },
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			winbar = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_winbar = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			extensions = { "lazy" },
		}
	end,
}

return M
