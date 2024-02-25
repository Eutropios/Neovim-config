-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

local lang_settings = {
	gitcommit = { ruler_column = 72 },
	html = { ruler_column = 100 },
	javascript = { ruler_column = 100 },
	lua = { ruler_column = 80 },
	markdown = { shift_tab = 2, ruler_column = 80 },
	python = { ruler_column = 88 },
	rst = { shift_tab = 3, ruler_column = 80 },
	toml = { ruler_column = 99 },
	typescript = { ruler_column = 100 },
	typst = { shift_tab = 2, ruler_column = 80 },
	yaml = { shift_tab = 2, ruler_column = 80 },
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*" },
	callback = function(args)
		local ft_settings = lang_settings[vim.bo[args.buf].filetype] or {}

		-- set the shiftwidth and tabstop to 4 unless stated otherwise
		vim.opt.shiftwidth = ft_settings.shift_tab or 4
		vim.opt.tabstop = ft_settings.shift_tab or 4
		-- set a ruler column if specificed in lang_settings
		vim.opt.colorcolumn = { ft_settings.ruler_column or 0 }
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
