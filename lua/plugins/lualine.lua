local M = {
	"nvim-lualine/lualine.nvim",
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
				icons_enabled = true,
				theme = "vscode",
				section_separators = "",
				component_separators = "",
				disabled_filetypes = { "alpha", "dashboard" },
				always_divide_middle = true,
				globalstatus = true,
			},
			sections = {
				lualine_a = { "branch" },
				lualine_b = {
					{ "diff", source = diff_source },
					"diagnostics",
				},
				lualine_c = {
					{
						require("lazy.status").updates,
						cond = require("lazy.status").has_updates,
					},
				},
				lualine_x = { "encoding", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { location, "selectioncount" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { location },
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
			extensions = { "lazy", "nvim-tree" },
		}
	end,
}

return M
