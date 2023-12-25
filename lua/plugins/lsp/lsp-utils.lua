local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

M.setup = function()
	vim.diagnostic.config({
		virtual_text = false,
		float = {
			border = "rounded",
			focusable = false,
			header = "",
			prefix = "",
			source = "always",
			style = "minimal",
		},
		signs = true,
		underline = true,
		update_in_insert = true,
		severity_sort = false,
	})

	-- sign column
	local signs = require("utils").lsp_signs

	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true }

	vim.keymap.set(
		"n",
		"<leader>vd",
		vim.lsp.buf.declaration,
		vim.tbl_extend("error", bufopts, { desc = "View Declaration" })
	)
	vim.keymap.set(
		"n",
		"<leader>vf",
		vim.lsp.buf.hover,
		vim.tbl_extend("error", bufopts, { desc = "View Definition" })
	)
	vim.keymap.set(
		"n",
		"<leader>vr",
		vim.lsp.buf.references,
		vim.tbl_extend("error", bufopts, { desc = "View References" })
	)
	vim.keymap.set(
		"n",
		"<leader>vi",
		vim.lsp.buf.implementation,
		vim.tbl_extend("error", bufopts, { desc = "View Implementation" })
	)
	vim.keymap.set(
		"n",
		"<leader>vt",
		vim.lsp.buf.type_definition,
		vim.tbl_extend("error", bufopts, { desc = "View Type Defs" })
	)
	vim.keymap.set(
		"n",
		"<leader>vh",
		vim.lsp.buf.hover,
		vim.tbl_extend("error", bufopts, { desc = "LSP Hover" })
	)
	vim.keymap.set(
		"n",
		"<leader>vs",
		vim.lsp.buf.signature_help,
		vim.tbl_extend("error", bufopts, { desc = "Signature Help" })
	)
	vim.keymap.set(
		"n",
		"<leader>wa",
		vim.lsp.buf.add_workspace_folder,
		vim.tbl_extend("error", bufopts, { desc = "Add Workspace Folder" })
	)
	vim.keymap.set(
		"n",
		"<leader>wr",
		vim.lsp.buf.remove_workspace_folder,
		vim.tbl_extend("error", bufopts, { desc = "rm Workspace Folder" })
	)
	vim.keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, vim.tbl_extend("error", bufopts, { desc = "ls Workspace Folders" }))
	vim.keymap.set(
		"n",
		"<leader>wn",
		vim.lsp.buf.rename,
		vim.tbl_extend("error", bufopts, { desc = "Rename" })
	)
	vim.keymap.set(
		"n",
		"<leader>va",
		vim.lsp.buf.code_action,
		vim.tbl_extend("error", bufopts, { desc = "Code Action" })
	)

	-- show diagnostics in hover window
	vim.api.nvim_create_autocmd("CursorHold", {
		callback = function()
			local opts = {
				border = "rounded",
				close_events = { "BufLeave", "CursorMoved", "InsertEnter" },
				focusable = false,
				prefix = " ",
				scope = "cursor",
				source = "always",
			}
			vim.diagnostic.open_float(nil, opts)
		end,
	})
end

-- pulled from NavePnow dotfiles
M.on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

return M
