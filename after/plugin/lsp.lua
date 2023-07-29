require('mason').setup()
require('mason-lspconfig').setup()

local lsp = require('lsp-zero')
lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
})

lsp.extend_cmp()

require('lspconfig').tsserver.setup({
    on_attach = function(client, bufnr)
        lsp.default_keymaps({buffer = bufnr})
    end
})
