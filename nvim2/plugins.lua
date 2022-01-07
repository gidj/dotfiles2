vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'tami5/lspsaga.nvim'
  use 'windwp/nvim-autopairs'
  use 'b3nj5m1n/kommentary'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('gitsigns').setup()
    end
  }

  use 'simrat39/symbols-outline.nvim'
  -- Completion
  use 'hrsh7th/cmp-cmdline'
  use 'ray-x/lsp_signature.nvim'
  use { -- Autocompletion plugin
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer', 'hrsh7th/cmp-emoji', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path', 'saadparwaiz1/cmp_luasnip', -- 'hrsh7th/cmp-vsnip',
      'onsails/lspkind-nvim', -- Enables icons on completions
      {'L3MON4D3/LuaSnip', requires = {'rafamadriz/friendly-snippets'}}
    }
  }

  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  use 'justinmk/vim-dirvish'
  use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}

  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      local null_ls = require("null-ls")
      local sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.prettier.with({filtetypes = {"json"}}),
        null_ls.builtins.diagnostics.pylint, null_ls.builtins.formatting.lua_format.with({
          args = {
            "-i", "--indent-width", "2", "--tab-width", "2", "--no-use-tab", "--column-limit",
            "120", "--column-table-limit", "100", "--no-keep-simple-function-one-line",
            "--no-chop-down-table", "--chop-down-kv-table",
            "--no-keep-simple-control-block-one-line", "--no-keep-simple-function-one-line",
            "--no-break-after-functioncall-lp", "--no-break-after-operator"
          }
        })
      }
      require"null-ls".setup({sources = sources, debug = true})
    end
  }

  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim', 'kyazdani42/nvim-web-devicons'
    },
    config = function()
      require"octo".setup()
    end
  }

  use 'machakann/vim-sandwich'

  -- Themes
  use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
  use 'folke/tokyonight.nvim'
  use 'Mangeshrex/uwu.vim'
  use 'marko-cerovac/material.nvim'
  use 'shaunsingh/moonlight.nvim'
end)