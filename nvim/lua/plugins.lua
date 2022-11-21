vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-cmdline' },
            { 'hrsh7th/cmp-emoji' },
            { 'onsails/lspkind-nvim' }, -- Enables icons on completions

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        },
        config = function()
            require('config/zero')
        end,
    }
    use 'b3nj5m1n/kommentary'
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('gitsigns').setup()
        end
    }
    use 'ruanyl/vim-gh-line'
    use 'simrat39/symbols-outline.nvim'
    use {
        "danymat/neogen",
        config = function()
            require('neogen').setup { enabled = true }
        end,
        requires = "nvim-treesitter/nvim-treesitter"
    }
    use 'nvim-lua/popup.nvim'
    use 'justinmk/vim-dirvish'
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            local null_ls = require("null-ls")
            local sources = {
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.prettier.with({ filtetypes = { "json" } }),
            }
            require "null-ls".setup({
                sources = sources,
                debug = true,
                on_attach = function(_, bufnr)
                    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
                end
            })
        end
    }
    use 'machakann/vim-sandwich'
    -- Themes
    use 'folke/tokyonight.nvim'
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
end)
