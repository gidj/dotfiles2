local lsp = require('lsp-zero')
lsp.ensure_installed({
    'gopls',
    'jdtls',
    'pyright',
    'rust_analyzer',
    'sumneko_lua',
})
lsp.preset('lsp-only')
-- lsp.preset('recommended')
lsp.nvim_workspace({
    library = vim.api.nvim_get_runtime_file('', true)
})
require('config/cmp')
lsp.setup()
