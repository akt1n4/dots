local fn = vim.fn

-- auto install packer.nvim
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Plugins listed here
return require('packer').startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim' -- Plugin manager itself
  use 'gruvbox-community/gruvbox' -- gruvbox-material !!!
  use 'kyazdani42/nvim-web-devicons' --nerdfont icons
  use 'kyazdani42/nvim-tree.lua' --nvim-tree
  use 'nvim-lualine/lualine.nvim' --status line
  -- use 'akinsho/bufferline.nvim' --buffer line
  -- use 'moll/vim-bbye'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'} -- tree sitter, this kinda organises stuff

  -- basic plugins
  use 'nvim-lua/plenary.nvim' -- idk what it does, but requiered for telescope

  -- cmp-plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  -- use "hrsh7th/cmp-nvim-lsp"
  -- use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- markdown preview
  use "ellisonleao/glow.nvim" -- markdown preview in nvim itself

  -- telescope
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'

  -- firenvim
  -- use {
  --  'glacambre/firenvim',
  --  run = function() vim.fn['firenvim#install'](0) end 
  -- }

  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
