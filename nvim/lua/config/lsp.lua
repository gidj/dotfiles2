local on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end
--
-- nvim-cmp supports additional completion capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" }
}

local lspconfig = require("lspconfig")
local servers = {
    "golangci_lint_ls",
    "gopls",
    "pyright",
    "rust_analyzer",
    "sumneko_lua",
    "terraformls",
    "tsserver",
    "vimls",
}

for _, lsp in pairs(servers) do
    local opts = {
        settings = {},
        on_attach = on_attach,
        flags = { debounce_text_changes = 150 },
        capabilities = capabilities
    }
    if lsp == "sumneko_lua" then
        local runtime_path = vim.split(package.path, ';')
        table.insert(runtime_path, "lua/?.lua")
        table.insert(runtime_path, "lua/?/init.lua")
        local Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim', 'use' }
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true)
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false }
        }
        opts.settings.Lua = Lua
    end
    lspconfig[lsp].setup(opts)
end
