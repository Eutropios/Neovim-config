local M = {}

M.git_colors = {
	GitAdd = "#A1C281",
	GitChange = "#74ADEA",
	GitDelete = "#FE747A",
}
M.lsp_signs = {
	Error = "󰅚 ",
	Hint = "󰌶 ",
	Info = " ",
	Warn = "! ",
}

M.lsp_kinds = {
	Array = " ",
	Boolean = " ",
	Class = " ",
	Color = " ",
	Constant = " ",
	Constructor = " ",
	Copilot = " ",
	Enum = " ",
	EnumMember = " ",
	Event = " ",
	Field = " ",
	File = " ",
	Folder = " ",
	Function = " ",
	Interface = " ",
	Key = " ",
	Keyword = " ",
	Method = " ",
	Module = " ",
	Namespace = " ",
	Null = " ",
	Number = " ",
	Object = " ",
	Operator = " ",
	Package = " ",
	Property = " ",
	Reference = " ",
	Snippet = " ",
	String = " ",
	Struct = " ",
	Text = " ",
	TypeParameter = " ",
	Unit = " ",
	Value = " ",
	Variable = " ",
}

M.mason_packages = {
	"asmfmt",
	"awk-language-server",
	"bash-language-server",
	"biome",
	"clangd",
	"cmakelang",
	"cpplint",
	"css-lsp",
	"djlint",
	"docformatter",
	"esbonio",
	"fourmolu",
	"gitlint",
	"gopls",
	"haskell-language-server",
	"hlint",
	"html-lsp",
	"lua-language-server",
	"markdownlint",
	"marksman",
	"markuplint",
	"prettier",
	"pyright",
	"rstcheck",
	"ruff",
	"selene",
	"shellcheck",
	"shfmt",
	"sqlfluff",
	"stylelint",
	"stylua",
	"taplo",
	"teal-language-server",
	"typescript-language-server",
	"typst-lsp",
	"vim-language-server",
	"yaml-language-server",
	"yamlfmt",
	"yamllint",
}

M.lsp_servers = {
	"asm_lsp",
	"awk_ls",
	"bashls",
	"biome",
	"clangd",
	"cssls",
	"esbonio",
	"gopls",
	"hls",
	"html",
	"htmx",
	"jinja_lsp",
	"jqls",
	"julials",
	"lua_ls",
	"marksman",
	"perlnavigator",
	"pyright",
	"ruff",
	"rust_analyzer",
	"taplo",
	"teal_ls",
	"tsserver",
	"typst_lsp",
	"vimls",
	"yamlls",
}

function M.on_attach(on_attach)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local buffer = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			on_attach(client, buffer)
		end,
	})
end

function M.warn(msg, notify_opts)
	vim.notify(msg, vim.log.levels.WARN, notify_opts)
end

function M.error(msg, notify_opts)
	vim.notify(msg, vim.log.levels.ERROR, notify_opts)
end

function M.info(msg, notify_opts)
	vim.notify(msg, vim.log.levels.INFO, notify_opts)
end

---@param silent boolean?
---@param values? {[1]:any, [2]:any}
function M.toggle(option, silent, values)
	if values then
		if vim.opt_local[option]:get() == values[1] then
			vim.opt_local[option] = values[2]
		else
			vim.opt_local[option] = values[1]
		end
		return require("utils").info(
			"Set " .. option .. " to " .. vim.opt_local[option]:get(),
			{ title = "Option" }
		)
	end
	vim.opt_local[option] = not vim.opt_local[option]:get()
	if not silent then
		if vim.opt_local[option]:get() then
			require("utils").info("Enabled " .. option, { title = "Option" })
		else
			require("utils").warn("Disabled " .. option, { title = "Option" })
		end
	end
end

M.diagnostics_active = true
function M.toggle_diagnostics()
	M.diagnostics_active = not M.diagnostics_active
	if M.diagnostics_active then
		vim.diagnostic.show()
		require("utils").info("Enabled Diagnostics", { title = "Lsp" })
	else
		vim.diagnostic.hide()
		require("utils").warn("Disabled Diagnostics", { title = "Lsp" })
	end
end

M.quickfix_active = false
function M.toggle_quickfix()
	M.quickfix_active = not M.quickfix_active
	if M.quickfix_active then
		vim.diagnostic.setloclist()
	else
		vim.cmd([[ lclose ]])
	end
end

return M
