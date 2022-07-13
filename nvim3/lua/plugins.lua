vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  -- Completion
  use 'hrsh7th/cmp-cmdline'
  use { -- Autocompletion plugin
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer', 'hrsh7th/cmp-emoji', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path', 'hrsh7th/cmp-nvim-lsp-signature-help', 'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind-nvim', -- Enables icons on completions
      {'L3MON4D3/LuaSnip', requires = {'rafamadriz/friendly-snippets'}}
    }
  }
  use {
    "williamboman/nvim-lsp-installer", {
      "neovim/nvim-lspconfig",
      config = function()
        local servers = {
          "gopls", "pyright", "rust_analyzer", "sumneko_lua", "vimls", "tsserver", "terraformls"
        }
        require("nvim-lsp-installer").setup({
          ensure_installed = servers -- ensure these servers are always installed
        })
        require("config/lsp")
      end
    }
  }
  use 'b3nj5m1n/kommentary'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('gitsigns').setup()
    end
  }
  use 'ruanyl/vim-gh-line'
  use 'simrat39/symbols-outline.nvim'
  use {
    "danymat/neogen",
    config = function()
      require('neogen').setup {enabled = true}
    end,
    requires = "nvim-treesitter/nvim-treesitter"
  }
  use 'nvim-lua/popup.nvim'
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
      require"null-ls".setup({
        sources = sources,
        debug = true,
        on_attach = function(_, bufnr)
          vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
        end
      })
    end
  }
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim', 'kyazdani42/nvim-web-devicons'
    },
    config = function()
      require("octo").setup()
    end
  }
  use {
    "nvim-neorg/neorg",
    config = function()
      require('neorg').setup {
        load = {
          ["core.defaults"] = {},
          ["core.norg.completion"] = {config = {engine = "nvim-cmp"}},
          ["core.norg.dirman"] = {
            config = {workspaces = {work = "~/notes/work", home = "~/notes/home"}}
          }
        }
      }
    end,
    requires = "nvim-lua/plenary.nvim"
  }
  use 'machakann/vim-sandwich'
  -- Themes
  use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
  use 'folke/tokyonight.nvim'
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }

  -- use 'ray-x/lsp_signature.nvim'

  --[[ use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
 ]]

  -- use 'tami5/lspsaga.nvim'
  -- use 'RRethy/vim-illuminate'
  -- use 'chrisbra/csv.vim'
  -- use 'projekt0n/github-nvim-theme'
  -- use 'Mangeshrex/uwu.vim'
  -- use 'marko-cerovac/material.nvim'
  -- use 'shaunsingh/moonlight.nvim'
  -- use 'rebelot/kanagawa.nvim'
  -- use 'EdenEast/nightfox.nvim'
end)
