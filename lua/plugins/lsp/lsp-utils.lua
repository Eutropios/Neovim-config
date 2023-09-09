local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

M.setup = function()
    vim.diagnostic.config({
        virtual_text = false,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
        signs = true,
        underline = true,
        update_in_insert = true,
        severity_sort = false,
    })

    ---- sign column
    local signs = require("utils").lsp_signs

    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true }

    vim.keymap.set("n", "<leader>vd", vim.lsp.buf.declaration, bufopts, { desc = "View Declaration" })
    vim.keymap.set("n", "<leader>vf", "<cmd>Telescope lsp_definitions<cr>", bufopts, { desc = "View Def" })
    vim.keymap.set("n", "<leader>vr", "<cmd>Telescope lsp_references<cr>", bufopts, { desc = "View References" })
    vim.keymap.set("n", "<leader>vi", "<cmd>Telescope lsp_implementations<cr>", bufopts,
        { desc = "View Implementations" })
    vim.keymap.set("n", "<leader>vt", "<cmd>Telescope lsp_type_definitions<cr>", bufopts, { desc = "View Type Defs" })
    vim.keymap.set("n", "<leader>vh", vim.lsp.buf.hover, bufopts, { desc = "LSP Hover" })
    vim.keymap.set("n", "<leader>vs", vim.lsp.buf.signature_help, bufopts, { desc = "Signature Help" })
    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts, { desc = "Add Workspace Folder" })
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts, { desc = "rm Workspace Folder" })
    vim.keymap.set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts, { desc = "ls Workspace Folders" })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts, { desc = "Rename" })
    vim.keymap.set("n", "<leader>va", vim.lsp.buf.code_action, bufopts, { desc = "Code Action" })

    -- show diagnostics in hover window
    vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
            local opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter" },
                border = "rounded",
                source = "always",
                prefix = " ",
                scope = "cursor",
            }
            vim.diagnostic.open_float(nil, opts)
        end,
    })
end

M.on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

return M
