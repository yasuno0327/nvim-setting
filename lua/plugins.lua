local fn = vim.fn

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | TSUpdate
  augroup end
]])

-- Install your plugins here
return {
	"nvim-lua/plenary.nvim",  -- Common utilities

	-- Colorschemes
	"EdenEast/nightfox.nvim",  -- Color scheme
	"folke/tokyonight.nvim",
	"craftzdog/solarized-osaka.nvim",

	"nvim-lualine/lualine.nvim",  -- Statusline
	"windwp/nvim-autopairs",  -- Autopairs, integrates with both cmp and treesitter
	"nvim-tree/nvim-web-devicons", -- File icons
	"akinsho/bufferline.nvim",

	-- cmp plugins
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
  "hrsh7th/vim-vsnip",
  "hrsh7th/cmp-vsnip",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"onsails/lspkind-nvim",

	-- snippets
	"L3MON4D3/LuaSnip", --snippet engine

  "folke/tokyonight.nvim",

	-- LSP
	"neovim/nvim-lspconfig", -- enable LSP
	"williamboman/nvim-lsp-installer",  -- simple to use language server installer
	"jose-elias-alvarez/null-ls.nvim",  -- for formatters and linters
	"glepnir/lspsaga.nvim",  -- LSP UIs

	-- Formatter
	"MunifTanjim/prettier.nvim",

  -- Insert utility
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
  },

  {"phaazon/hop.nvim", branch = "v2"},

	-- Telescope
  {"nvim-telescope/telescope.nvim", tag = "0.1.5", dependencies = { "nvim-lua/plenary.nvim" }},
	"nvim-telescope/telescope-file-browser.nvim",

  -- Cheatsheet
  {
    "sudormrfbin/cheatsheet.nvim",
    dependencies = {
      {"nvim-telescope/telescope.nvim"},
      {"nvim-lua/popup.nvim"},
      {"nvim-lua/plenary.nvim"}
    },
  },

	-- Treesitter
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

	-- ChadTree
	{
		"ms-jpq/chadtree",
		branch = "chad",
		build = "pytjhon3 -m chadtree deps",
	},

  -- barbar
  {
    "romgrk/barbar.nvim",
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    version = "^1.0.0",
  },

  {"akinsho/bufferline.nvim", version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
  "Pocco81/auto-save.nvim",

	-- VSCode like にする
	"lukas-reineke/indent-blankline.nvim",

	"windwp/nvim-ts-autotag",

	"folke/zen-mode.nvim",

	"github/copilot.vim",

	"rcarriga/nvim-notify",
}
