local lsp = require('lsp-zero')
lsp.ensure_installed({
    'gopls',
    'jdtls',
    'pyright',
    'rust_analyzer',
    'sumneko_lua',
    'tsserver',
})

-- lsp.preset('recommended')
-- lsp.preset('lsp-compe')
lsp.preset('lsp-only')

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

lsp.nvim_workspace({
    library = vim.api.nvim_get_runtime_file('', true)
})
lsp.setup()

local cmp = require('cmp')
local lspkind = require 'lspkind'
local config = lsp.defaults.cmp_mappings

local select_opts = {behavior = cmp.SelectBehavior.Select}
local cmp_config = lsp.defaults.cmp_config({
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            local kind = lspkind.cmp_format({ mode = "symbol_text", preset = "codicons", maxwidth = 50 })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. strings[1] .. " "
            kind.menu = "    (" .. strings[2] .. ")"

            return kind
        end
    },
    -- mapping = lsp.defaults.cmp_mappings(),
    mapping = {
        -- confirm selection
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        -- navigate items on the list
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),

        -- scroll up and down in the completion documentation
        ['<C-f>'] = cmp.mapping.scroll_docs(5),
        ['<C-u>'] = cmp.mapping.scroll_docs(-5),

        -- toggle completion
        ['<C-e>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.close()
            else
                cmp.complete()
            end
        end),

        -- go to next placeholder in the snippet
        ['<C-d>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { 'i', 's' }),

        -- go to previous placeholder in the snippet
        ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),

        -- when menu is visible, navigate to next item
        -- when line is empty, insert a tab character
        -- else, activate completion
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item(select_opts)
            elseif s.check_back_space() then
                fallback()
            else
                cmp.complete()
            end
        end, { 'i', 's' }),

        -- when menu is visible, navigate to previous item on list
        -- else, revert to default behavior
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item(select_opts)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    sorting = {
        comparators = {
            cmp.config.compare.locality,
            cmp.config.compare.recently_used,
            cmp.config.compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
            cmp.config.compare.offset,
            cmp.config.compare.order,
        }
    },
    sources = {
        { name = 'luasnip', options = { use_show_condition = false } },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'norg' },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
    },
    view = { entries = { name = "custom", selection_order = "near_cursor" } },
    window = {
        completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            -- col_offset = -3,
            -- side_padding = 0
        }
    },
    --[[ window = {
        completion = cmp.config.window.bordered()
    } ]]
})

cmp.setup(cmp_config)
