return {
  { 
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = all,
      auto_install = true,
      highlight = {
        enable = true,
        disable = {},
      },
      indent = { enable = true },
      autotag = { enable = true },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 2000,
      },
      endwise = { enable = true },
    },
  },
}
