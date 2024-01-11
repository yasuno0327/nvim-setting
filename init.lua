require("base")
require("plugins")
require("autocmds")
require("options")
require("keymaps")

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

require("lazy").setup("plugins")
require("colorscheme")

require("cheatsheet").setup({
  bundled_cheatsheets = true,
  bundled_plugin_cheatsheets = true,
  include_only_installed_plugins = true,
  telescope_mappings = {
    ['<CR>'] = require('cheatsheet.telescope.actions').select_or_fill_commandline,
    ['<A-CR>'] = require('cheatsheet.telescope.actions').select_or_execute,
    ['<C-Y>'] = require('cheatsheet.telescope.actions').copy_cheat_value,
    ['<C-E>'] = require('cheatsheet.telescope.actions').edit_user_cheatsheet,
  },
})

require("hop").setup()
require("nvim-surround").setup()

-- initialize lsp --
local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true }

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cd', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
end

require'lspconfig'.elixirls.setup{
  cmd = { "/Users/yoshitomo.yasuno/elixir-ls/release/language_server.sh" },
  on_attach = on_attach,
}

-- Setup autocompletion --
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<c-p>"] = cmp.mapping.select_prev_item(),
    ["<c-n>"] = cmp.mapping.select_next_item(),
    ["<cr>"] = cmp.mapping.confirm(),
    ["<tab>"] = cmp.mapping(
      function(fallback)
        if cmp.visible() then
          local entry = cmp.get_selected_entry()
          if not entry then
                  cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
              end
              cmp.confirm()
          else
              fallback()
          end
      end,
      {"i", "s", "c"}
    )

  },
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
  },
  formatting = {
    format = require("lspkind").cmp_format({
      with_text = true,
      menu = {
        nvim_lsp = "[LSP]",
      },
    }),
  },
})

-- Treesitter --
require'nvim-treesitter.configs'.setup {
  ensure_installed = all,
  sync_install = false,
  ignore_install = {},
  highlight = { enable = true, disable = {} },
  indent = { enable = true },
  autotag = { enable = true },
  rainbow = {
  	enable = true,
  	extended_mode = true,
  	max_file_lines = nil,
  }
}

require"bufferline".setup{}

require('nvim-treesitter.configs').setup {
  endwise = {
      enable = true,
  },
}

require("conform").setup{
  formatters_by_ft = {
    elixir = {"mix"},
  },
  format_on_save = {
    timeout_ms = 5000,
    lsp_fallback = true,
  },
}

vim.notify = require("notify")
require("ibl").setup()
