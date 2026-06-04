vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.inccommand = "split"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

vim.opt.completeopt = "menuone,noselect,fuzzy,nosort"
vim.opt.shortmess:append("c")
vim.opt.isfname:append("@-@")
vim.opt.scrolloff = 8

vim.opt.signcolumn = "yes"
vim.opt.foldcolumn = "0"

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.hl.on_yank()
	end,
})
vim.opt.termguicolors = true -- true color

vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.pumheight = 10 -- pop up menu height

vim.opt.sidescrolloff = 5 -- how many lines to scroll when using the scrollbar
vim.opt.autoindent = true
vim.opt.sessionoptions = "buffers,curdir,folds,help,tabpages,terminal,globals"
-- vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.opt.writebackup = false
vim.opt.jumpoptions = "view"
vim.opt.cmdheight = 0
vim.opt.list = true
vim.opt.splitkeep = "screen"
-- vim.opt.syntax = "on"
vim.opt.spelloptions = "camel,noplainbuffer"
vim.opt.foldlevel = 99
-- vim.o.foldlevelstart = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
vim.opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "/",
	eob = " ",
}
vim.opt.mousemoveevent = true
vim.opt.cursorline = true

-- command completion
vim.opt.wildmode = "longest:full:full"
vim.opt.wildignore =
	"*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*DS_STORE,*.db"

vim.opt.guicursor = "n-sm:block,i-ci-v-c-ve:ver25,r-cr-o:hor20"
