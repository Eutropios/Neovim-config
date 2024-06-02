return {
	{ "nvim-lua/plenary.nvim" },
	{
		"nvim-tree/nvim-web-devicons",
		priority = 500,
		opts = {
			default = true,
			strict = true,
		},
	},
	{
		"NStefan002/2048.nvim",
		cmd = "Play2048",
		config = true,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
	},
}
