return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"mfussenegger/nvim-lint", -- maps to "lint" in require
			"williamboman/mason-lspconfig.nvim",
		},
		config = function(_, _)
			local utils = require("utils")
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")
			local lsp_utils = require("plugins.lsp.lsp-utils")
			require("lint").linters_by_ft = {
				css = { "stylelint" },
				javascript = { "biome" },
				json = { "biome" },
				less = { "stylelint" },
				lua = { "selene" },
				markdown = { "markdownlint" },
				sass = { "stylelint" },
				scss = { "stylelint" },
				typescript = { "biome" },
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
									typeCheckingMode = "on",
								},
							},
						},
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
				height = 0.90,
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local utils = require("utils")
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
					c = { "clang_format" },
					cmake = { "cmake_format" },
					cpp = { "clang_format" },
					css = { "stylelint" },
					go = { "gofmt" },
					html = { "prettier" },
					javascript = { { "biome", "prettier" } },
					lua = { "stylua" },
					luadoc = { "stylua" },
					markdown = { "markdownlint" },
					python = { "ruff_fix", "black" },
					sass = { "stylelint" },
					scss = { "stylelint" },
					sh = { "shfmt" },
					toml = { "taplo" },
					typescript = { { "biome", "prettier" } },
					yaml = { "yamlfmt" },
					zsh = { "shfmt" },
				},
				format_on_save = {
					lsp_fallback = true,
					timeout_ms = 500,
				},
			})
		end,
	},
}
