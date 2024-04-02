return {
	"ThePrimeagen/harpoon",
	keys = {
		{
			"<leader>ha",
			"<cmd>lua require('harpoon.mark').add_file()<cr>",
			desc = "add file",
		},
		{
			"<leader>hr",
			"<cmd>lua require('harpoon.mark').rm_file()<cr>",
			desc = "remove file",
		},
		{
			"<leader>hm",
			"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
			desc = "harpoon menu",
		},
		{
			"<leader>hn",
			"<cmd>lua require('harpoon.ui').nav_next()<cr>",
			desc = "next file",
		},
		{
			"<leader>hp",
			"<cmd>lua require('harpoon.ui').nav_prev()<cr>",
			desc = "previous file",
		},
		{
			"<leader>h1",
			"<cmd> lua require('harpoon.ui').nav_file(1)<cr>",
			desc = "file 1",
		},
		{
			"<leader>h2",
			"<cmd> lua require('harpoon.ui').nav_file(2)<cr>",
			desc = "file 2",
		},
		{
			"<leader>h3",
			"<cmd> lua require('harpoon.ui').nav_file(3)<cr>",
			desc = "file 3",
		},
	},
}
