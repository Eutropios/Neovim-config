return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"mfussenegger/nvim-lint", -- maps to "lint" in require
			"williamboman/mason-lspconfig.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function(_, _)
			local utils = require("utilities")
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")
			local lspconfig_utils = require("lspconfig/util")
			local lsp_utils = require("plugins.lsp.lsp-utils")
			require("lint").linters_by_ft = {
				awk = { "awk" },
				bash = { "shellcheck" },
				c = { "cppcheck", "cpplint" },
				cmake = { "cpplint" },
				cpp = { "cppcheck", "cpplint" },
				css = { "biomejs", "stylelint" },
				gitcommit = { "gitlint" },
				html = { "markuplint" },
				javascript = { "biomejs" },
				json = { "biomejs" },
				jsonc = { "biomejs" },
				jsx = { "biomejs" },
				lua = { "selene" },
				luadoc = { "stylua" },
				markdown = { "markdownlint" },
				python = { "mypy" },
				sass = { "stylelint" },
				scss = { "stylelint" },
				sql = { "sqlfluff" },
				tsx = { "biomejs" },
				typescript = { "biomejs" },
				yaml = { "yamllint" },
			}

			lsp_utils.setup()
			mason_lspconfig.setup({
				ensure_installed = utils.lsp_servers,
			})
			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						on_attach = lsp_utils.on_attach,
						capabilities = lsp_utils.capabilities,
					})
				end,
				["pyright"] = function()
					lspconfig.pyright.setup({
						on_attach = lsp_utils.on_attach,
						capabilities = lsp_utils.capabilities,
						settings = {
							python = {
								analysis = {
									typeCheckingMode = "strict",
								},
							},
						},
					})
				end,
				["ruff"] = function()
					lspconfig.ruff.setup({
						on_attach = lsp_utils.on_attach,
						capabilities = lsp_utils.capabilities,
					})
				end,
				["clangd"] = function()
					local capabilities_cpp = lsp_utils.capabilities
					capabilities_cpp.offsetEncoding = { "utf-16" }
					lspconfig.clangd.setup({
						on_attach = lsp_utils.on_attach,
						capabilities = capabilities_cpp,
					})
				end,
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						on_attach = lsp_utils.on_attach,
						capabilities = lsp_utils.capabilities,
						settings = {
							Lua = {
								runtime = {
									-- Tell the language server which version of Lua you're using
									-- (most likely LuaJIT in the case of Neovim)
									version = "LuaJIT",
								},
								-- Make the server aware of Neovim runtime files
								workspace = {
									checkThirdParty = false,
									library = {
										vim.env.VIMRUNTIME,
									},
								},
							},
						},
					})
				end,
				["teal_ls"] = function()
					lspconfig.teal_ls.setup({
						on_attach = lsp_utils.on_attach,
						capabilities = lsp_utils.capabilities,
					})
				end,
				["rust_analyzer"] = function()
					lspconfig.rust_analyzer.setup({
						on_attach = lsp_utils.on_attach,
						capabilities = lsp_utils.capabilities,
						root_dir = lspconfig_utils.root_pattern("Cargo.toml"),
						settings = {
							["rust-analyzer"] = {
								cargo = {
									allFeatures = true,
								},
								check = {
									command = "clippy",
								},
								diagnostics = {
									enable = true,
								},
							},
						},
					})
				end,
				["tinymist"] = function()
					lspconfig.tinymist.setup({
						on_attach = lsp_utils.on_attach,
						capabilities = lsp_utils.capabilities,
						filetypes = { "typst" },
					})
				end,
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		keys = {
			{
				"<leader>vm",
				"<cmd>Mason<cr>",
				desc = "Open Mason",
			},
		},
		opts = {
			pip = {
				upgrade_pip = true,
			},
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				width = 0.95,
				height = 0.86,
			},
			PATH = "append",
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local utils = require("utilities")
			local mr = require("mason-registry")
			local packages = utils.mason_packages
			local function ensure_installed()
				for _, package in ipairs(packages) do
					local p = mr.get_package(package)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},
	{
		event = "BufReadPre",
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					["*"] = { "trim_whitespace", "trim_newlines" },
					bash = { "shfmt" },
					cmake = { "cmake_format" },
					css = { "stylelint" },
					django = { "djlint" },
					go = { "gofmt" },
					html = { "prettier" },
					javascript = { "biome" },
					json = { "biome" },
					jsonc = { "biome" },
					jsx = { "biome" },
					lua = { "stylua" },
					luadoc = { "stylua" },
					markdown = { "markdownlint" },
					python = { "ruff_format", "docformatter" },
					rust = { "rustfmt" },
					sass = { "stylelint" },
					scss = { "stylelint" },
					sh = { "shfmt" },
					toml = { "taplo" },
					tsx = { "biome" },
					typescript = { "biome" },
					typst = { "typstyle" },
					yaml = { "yamlfmt" },
					zsh = { "shfmt" },
				},
				format_on_save = {
					lsp_fallback = true,
					timeout_ms = 500,
				},
			})
			require("conform").formatters.shfmt = {
				prepend_args = {
					"--simplify",
					"-i",
					"4",
					"-ci",
				},
			}
			require("conform").formatters.taplo = {
				inherit = false,
				command = "taplo",
				args = {
					"format",
					"--option",
					"align_comments=true",
					"--option",
					"align_entries=true",
					"--option",
					"allowed_blank_lines=2",
					"--option",
					"array_auto_collapse=true",
					"--option",
					"array_auto_expand=true",
					"--option",
					"array_trailing_comma=true",
					"--option",
					"column_width=99",
					"--option",
					"compact_arrays=true",
					"--option",
					"compact_inline_tables=true",
					"--option",
					"indent_entries=true",
					"--option",
					"indent_string=    ",
					"--option",
					"indent_tables=true",
					"--option",
					"inline_table_expand=true",
					"--option",
					"reorder_arrays=true",
					"--option",
					"reorder_keys=true",
					"--option",
					"trailing_newline=true",
					"-",
				},
			}
		end,
	},
}
