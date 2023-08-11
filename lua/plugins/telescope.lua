vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ "<leader>pf", "<cmd>lua require('telescope.builtin').find_files()<cr>" },
		{ "<C-p>", "<cmd>lua require('telescope.builtin').git_files()<cr>" },
		{ "<C-g>", "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
        { "<leader>ps", "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep > ')})<cr>" }
	}
}

return M
