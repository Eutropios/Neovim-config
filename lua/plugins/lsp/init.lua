return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function(_, _)
			local utils = require("utils")
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")
			local lsp_utils = require("plugins.lsp.lsp-utils")
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
		"ray-x/lsp_signature.nvim",
		event = "BufReadPre",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
	{
		event = "BufReadPre",
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					luadoc = { "stylua" },
					toml = { "taplo" },
					cmake = { "cmake_format" },
					c = { "clang_format" },
					cpp = { "clang_format" },
					go = { "gofmt" },
					markdown = { "markdownlint" },
					rust = { "rustfmt" },
					sh = { "shfmt" },
					html = { "prettier" },
					css = { "stylelint" },
					scss = { "stylelint" },
					sass = { "stylelint" },
					python = { "ruff_fix", "black" },
					yaml = { "yamlfmt" },
					javascript = { { "biome", "prettier" } },
					typescript = { { "biome", "prettier" } },
					["*"] = { "trim_whitespace", "trim_newlines" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	},
}
