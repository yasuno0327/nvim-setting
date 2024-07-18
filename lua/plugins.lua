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
  "nvim-lua/plenary.nvim", -- Common utilities

  -- Colorschemes
  "folke/tokyonight.nvim",

  "nvim-lualine/lualine.nvim",   -- Statusline
  "windwp/nvim-autopairs",       -- Autopairs, integrates with both cmp and treesitter
  "nvim-tree/nvim-web-devicons", -- File icons
  "akinsho/bufferline.nvim",

  -- cmp plugins
  "hrsh7th/nvim-cmp",    -- The completion plugin
  "hrsh7th/cmp-buffer",  -- buffer completions
  "hrsh7th/cmp-path",    -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions
  "hrsh7th/vim-vsnip",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "onsails/lspkind-nvim",

  -- LSP
  "neovim/nvim-lspconfig", -- enable LSP
  "stevearc/conform.nvim", -- autoformatter

  -- Insert utility
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
  },

  { "phaazon/hop.nvim",                branch = "v2" },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      version = "^1.0.0",
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  },
  "nvim-telescope/telescope-file-browser.nvim",

  -- Cheatsheet
  {
    "sudormrfbin/cheatsheet.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" }
    },
  },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

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
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      animation = true,
    },
  },

  -- url-open
  {
    "sontungexpt/url-open",
    branch = "mini",
    event = "VeryLazy",
    cmd = "URLOpenUnderCursor",
    config = function()
      local status_ok, url_open = pcall(require, "url-open")
      if not status_ok then
        return
      end
      url_open.setup({})
    end,
  },

  -- VSCode like にする
  { "lukas-reineke/indent-blankline.nvim", main = "ibl",  opts = {} },

  "rcarriga/nvim-notify",

  { "github/copilot.vim",                  lazy = false },

  { "akinsho/toggleterm.nvim",             version = "*", config = true },

  { "Shatur/neovim-session-manager" },

  { "c-brenn/mix-test.vim" },
  { "jghauser/follow-md-links.nvim" },

}
