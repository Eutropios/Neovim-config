local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

-- load lazy
require("lazy").setup("plugins", {
	install = { colorscheme = { "vscode" } },
	defaults = { lazy = true },
	ui = {
		border = "rounded",
		size = { width = 0.9 },
	},
	checker = { enabled = true },
	change_detection = { enabled = true, notify = false },
	debug = false,
})
