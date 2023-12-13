vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd("colorscheme rose-pine")
    end
  })
  use { 'nvim-treesitter/nvim-treesitter', }
  use { "williamboman/mason.nvim" }
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'vimwiki/vimwiki' }
  use { "lervag/vimtex" }
  use { 'm4xshen/autoclose.nvim' }
  use { "tpope/vim-surround" }
  use { "jose-elias-alvarez/null-ls.nvim" }
  use { "jay-babu/mason-null-ls.nvim" }
  use { 'vim-airline/vim-airline' }
  use { 'vim-airline/vim-airline-themes' }
  use { 'tpope/vim-commentary' }
  use { "nvim-tree/nvim-tree.lua" }
  use { "nvim-tree/nvim-web-devicons" }
  use { "mattn/emmet-vim" }
end)
