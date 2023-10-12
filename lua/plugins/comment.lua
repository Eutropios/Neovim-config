local M = {
	"numToStr/Comment.nvim",
	keys = {
		{
			"<C-_>",
			mode = "n",
			"<Plug>(comment_toggle_blockwise_current)",
			desc = "Comment out current line",
		},
		{
			"<C-_>",
			mode = "x",
			"<Plug>(comment_toggle_blockwise_visual)",
			desc = "Comment out selected lines",
		},
		{
			"<C-/>",
			mode = "n",
			"<Plug>(comment_toggle_blockwise_current)",
			desc = "Comment out current line",
		},
		{
			"<C-/>",
			mode = "x",
			"<Plug>(comment_toggle_blockwise_visual)",
			desc = "Comment out selected block",
		},
	},
	opts = {
		mappings = {
			basic = false,
			extra = false,
		},
	},
}

return M
