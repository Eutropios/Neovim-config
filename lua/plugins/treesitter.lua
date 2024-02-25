local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPost",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-refactor",
	},
	opts = {
		highlight = {
			enable = true,
			disable = function(lang, buf)
				local max_filesize = 200 * 1024 -- 100 KB
				local ok, stats =
					pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
			additional_vim_regex_highlighting = false,
		},
		autopairs = { enable = true },
		autotag = { enable = true },
		indent = { enable = true },
		ensure_installed = {
			"awk",
			"bash",
			"bibtex",
			"bitbake",
			"c",
			"capnp",
			"cmake",
			"comment",
			"cpp",
			"css",
			"csv",
			"diff",
			"doxygen",
			"fennel",
			"fish",
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
			"go",
			"html",
			"htmldjango",
			"http",
			"ini",
			"javascript",
			"jsdoc",
			"json",
			"json5",
			"jsonc",
			"latex",
			"llvm",
			"lua",
			"luadoc",
			"luap",
			"make",
			"markdown",
			"markdown_inline",
			"ninja",
			"pem",
			"perl",
			"php",
			"psv",
			"pymanifest",
			"python",
			"query",
			"regex",
			"requirements",
			"rst",
			"rust",
			"scss",
			"ssh_config",
			"svelte",
			"teal",
			"textproto",
			"todotxt",
			"toml",
			"tsv",
			"tsx",
			"typescript",
			"typst",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
			"zig",
		},
		sync_install = false,
		ignore_install = {}, -- List of parsers to ignore installation
		refactor = {
			highlight_definitions = {
				enable = true,
				-- Set to false if you have an `updatetime` of ~100.
				clear_on_cursor_move = true,
			},
			highlight_current_scope = { enable = false },
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}

return M
