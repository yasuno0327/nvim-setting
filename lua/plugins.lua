local fn = vim.fn

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
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
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"onsails/lspkind-nvim",

	-- snippets
	"L3MON4D3/LuaSnip", --snippet engine

	-- LSP
	"neovim/nvim-lspconfig", -- enable LSP
	"williamboman/nvim-lsp-installer",  -- simple to use language server installer
	"jose-elias-alvarez/null-ls.nvim",  -- for formatters and linters
	"glepnir/lspsaga.nvim",  -- LSP UIs

	-- Formatter
	"MunifTanjim/prettier.nvim",

	-- Telescope
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-file-browser.nvim",

	-- Treesitter
  {"nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"markdown",
					"tsx",
					"json",
					"yaml",
					"css",
					"sql",
					"elixir",
					"heex",
					"javascript",
					"html",
					"go",
					"gomod"
				},
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
				autotag = { enable = true },
				rainbow = {
					enable = true,
					extended_mode = true,
					max_file_lines = nil,
				}
      })
    end
  },

	-- ChadTree
	{
		"ms-jpq/chadtree",
		branch = "chad",
		build = "python3 -m chadtree deps",
	},

	-- VSCode like にする
	"lukas-reineke/indent-blankline.nvim",

	"windwp/nvim-ts-autotag",

	"folke/zen-mode.nvim",

	"github/copilot.vim",

	"rcarriga/nvim-notify",
}
