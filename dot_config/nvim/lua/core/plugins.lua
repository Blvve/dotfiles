local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {

   'lervag/vimtex',                    -- latex
   'm4xshen/hardtime.nvim',


  -- LINTING ----------------------------
  -- 'jose-elias-alvarez/null-ls.nvim',


  -- LSP --------------------------------
  'neovim/nvim-lspconfig',


  -- COMPLETION -------------------------
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'saadparwaiz1/cmp_luasnip',
  'hrsh7th/cmp-omni',


  -- SYNTAX -----------------------------
  'kovetskiy/sxhkd-vim',              -- recognise sxhkd config files
  'nvim-treesitter/nvim-treesitter',  -- syntax highlight


  -- SNIPPETS ---------------------------
  'L3MON4D3/LuaSnip',                 -- snippets


  -- UTILITIES --------------------------
  'tpope/vim-commentary',             -- easily toggle comments
  {                                   -- fuzzy search of files
    'nvim-telescope/telescope.nvim',
    version = '0.1.0',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  'nvim-tree/nvim-tree.lua',          -- file tree
  'Pocco81/auto-save.nvim',           -- autosave
  -- 'folke/which-key.nvim',


  -- VISUAL -----------------------------
  'nvim-tree/nvim-web-devicons',      -- icons for the file tree
  'nvim-lualine/lualine.nvim',        -- line at the bottom
  'ap/vim-css-color',                 -- preview colours in source code
  'yorik1984/newpaper.nvim',          -- colorscheme
  'yorik1984/lualine-theme.nvim',     -- Should be included with newpaper, but it does not work
}

local opts = {}

require("lazy").setup(plugins, opt)
