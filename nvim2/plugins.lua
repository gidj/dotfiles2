vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use 'tami5/lspsaga.nvim'
  use 'windwp/nvim-autopairs'
  use 'b3nj5m1n/kommentary'

	-- Completion
	use 'hrsh7th/cmp-cmdline'
	use 'ray-x/lsp_signature.nvim'
  use { -- Autocompletion plugin
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
	    'saadparwaiz1/cmp_luasnip',
      --'hrsh7th/cmp-vsnip',
      'onsails/lspkind-nvim', -- Enables icons on completions
      { 'L3MON4D3/LuaSnip', requires = { 'rafamadriz/friendly-snippets' } },
    },
  }

	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'

	use 'justinmk/vim-dirvish'
  use { 'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function ()
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
