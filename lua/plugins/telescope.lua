local M = {
	"nvim-telescope/telescope.nvim",
	event = "BufReadPre",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
        "nvim-lua/plenary.nvim",
        "debugloop/telescope-undo.nvim"
	},
    keys = {
        {
            "<leader>pf",
            "<cmd>lua require('telescope.builtin').find_files()<cr>",
            desc = "Open fuzzy finder."
        },
        {
            "<C-p>",
            "<cmd>lua require('telescope.builtin').git_files()<cr>"
        },
        {
            "<C-g>",
            "<cmd>lua require('telescope.builtin').live_grep()<cr>"
        },
        {
            "<leader>ps",
            "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep > ')})<cr>",
            desc = "Grep in buffer"
        },
        {
            "<leader>u",
            "<cmd>Telescope undo<cr>",
            desc = "Undo history",
        },
		{
			"<C-M-p>",
			"<cmd>lua require('telescope.builtin').builtin(require('telescope.themes').get_dropdown({}))<cr>",
		},
		{
            "<C-f>",
            "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>"
        },
	},
	opts = function()
		local actions = require("telescope.actions")
		local theme = require("telescope.themes")
        local tsu = require("telescope-undo.actions")
		return {
			pickers = {
				find_files = { hidden = true },
				live_grep = {
					additional_args = function(opts)
						return { "--hidden" }
					end,
				},
			},
			defaults = {
				mappings = {
                    i = { ["<esc>"] = actions.close },
                    ["<C-a>"] = tsu.yank_additions,
                    ["<C-d>"] = tsu.yank_deletions,
                    ["<C-r>"] = tsu.restore
                },
			},

			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                },
                ["ui-select"] = {
                    theme.get_dropdown({
                        -- even more opts
                    }),
                },
                undo = {
                    use_delta = true,
                    side_by_side = true,
                    layout_strategy = "horizontal",
                    layout_config = {
                        preview_height = 0.8,
                    }, 
                },
            },
        }
    end,
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
        telescope.load_extension("fzf")
        telescope.load_extension("ui-select")
        telescope.load_extension("undo")
    end,
}

return M
