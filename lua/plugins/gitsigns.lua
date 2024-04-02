local M = {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	opts = {
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
	},
}

return M
