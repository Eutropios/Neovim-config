local M = {
	event = "VeryLazy",
	"ThePrimeagen/harpoon",
	keys = {
		name = "Harpoon",
		{
			"<leader>ha",
			"<cmd>lua require('harpoon.mark').add_file()<cr>",
			"add file",
		},
		{
			"<leader>hr",
			"<cmd>lua require('harpoon.mark').rm_file()<cr>",
			"remove file",
		},
		{
			"<leader>hm",
			"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
			"harpoon menu",
		},
		{
			"<leader>hn",
			"<cmd>lua require('harpoon.ui').nav_next()<cr>",
			"next file",
		},
		{
			"<leader>hp",
			"<cmd>lua require('harpoon.ui').nav_prev()<cr>",
			"previous file",
		},
		{
			"<leader>h1",
			"<cmd> lua require('harpoon.ui').nav_file(1)<cr>",
			"file 1",
		},
		{
			"<leader>h2",
			"<cmd> lua require('harpoon.ui').nav_file(2)<cr>",
			"file 2",
		},
		{
			"<leader>h3",
			"<cmd> lua require('harpoon.ui').nav_file(3)<cr>",
			"file 3",
		},
	},
}

return M
