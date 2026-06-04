local treesitter = require("nvim-treesitter")

local ensure_installed = {
	"asm",
	"awk",
	"bash",
	"c",
	"cmake",
	"cpp",
	"css",
	"csv",
	"diff",
	"disassembly",
	"dockerfile",
	"doxygen",
	"editorconfig",
	"git_config",
	"git_rebase",
	"gitattributes",
	"gitcommit",
	"gitignore",
	"go",
	"gomod",
	"gpg",
	"html",
	"ini",
	"javascript",
	"jinja",
	"jinja_inline",
	"json",
	"lua",
	"luadoc",
	"make",
	"markdown",
	"markdown_inline",
	"mermaid",
	"ninja",
	"powershell",
	"pymanifest",
	"python",
	"readline",
	"regex",
	"requirements",
	"rst",
	"rust",
	"scss",
	"tmux",
	"todotxt",
	"toml",
	"tsv",
	"typescript",
	"typst",
	"vim",
	"vimdoc",
	"xml",
	"yaml",
	"zig",
}

treesitter.install(ensure_installed)

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function(args)
		local buf = args.buf
		local ft = vim.bo[buf].filetype

		local lang = vim.treesitter.language.get_lang(ft)
		if not lang then
			return
		end

		local ok_add = pcall(vim.treesitter.language.add, lang)
		if not ok_add then
			return
		end

		pcall(vim.treesitter.start, buf, lang)
	end,
})
