local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPost",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/nvim-treesitter-refactor",
		{
			"windwp/nvim-ts-autotag",
			ft = {
				"astro",
				"glimmer",
				"handlebars",
				"html",
				"javascript",
				"jinja2",
				"jsx",
				"markdown",
				"php",
				"rescript",
				"restructuredtext",
				"sql",
				"svelte",
				"tsx",
				"twig",
				"typescript",
				"vue",
				"xml",
			},
		},
	},
	opts = {
		highlight = {
			enable = true,
			disable = function(_, buf)
				local max_filesize = 200 * 1024 -- 100 KB
				local ok, stats =
					pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
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
			"asm",
			"awk",
			"bash",
			"bibtex",
			"bitbake",
			"c",
			"capnp",
			"clojure",
			"cmake",
			"comment",
			"cpp",
			"css",
			"csv",
			"cue",
			"dhall",
			"diff",
			"disassembly",
			"djot",
			"dockerfile",
			"dot",
			"doxygen",
			"dtd",
			"editorconfig",
			"elvish",
			"fennel",
			"fish",
			"fortran",
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
			"gn",
			"gnuplot",
			"go",
			"gomod",
			"gpg",
			"haskell",
			"html",
			"htmldjango",
			"http",
			"ini",
			"javascript",
			"jsdoc",
			"json",
			"json5",
			"jsonc",
			"jq",
			"just",
			"kdl",
			"latex",
			"linkerscript",
			"llvm",
			"lua",
			"luadoc",
			"luap",
			"make",
			"markdown",
			"markdown_inline",
			"mermaid",
			"meson",
			"ninja",
			"pem",
			"perl",
			"php",
			"phpdoc",
			"printf",
			"psv",
			"pymanifest",
			"python",
			"query",
			"readline",
			"regex",
			"requirements",
			"rst",
			"ruby",
			"rust",
			"scss",
			"ssh_config",
			"svelte",
			"teal",
			"textproto",
			"tmux",
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
			"zathurarc",
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
