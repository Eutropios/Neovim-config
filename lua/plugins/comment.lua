local M = {
	"numToStr/Comment.nvim",
	keys = {
		{
			"<C-_>",
			mode = "n",
			"<Plug>(comment_toggle_blockwise_current)",
		},
		{
			"<C-_>",
			mode = "x",
			"<Plug>(comment_toggle_blockwise_visual)",
		},
		{
			"<C-/>",
			mode = "n",
			"<Plug>(comment_toggle_blockwise_current)",
		},
		{
			"<C-/>",
			mode = "x",
			"<Plug>(comment_toggle_blockwise_visual)",
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
