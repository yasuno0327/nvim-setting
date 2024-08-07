return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        terraformls = {},
        lua_ls = {},
        nginx_language_server = {},
        dockerls = {},
        gopls = {},
        dotls = {},
        rls = {},
        pylsp = {},
        yamlls = {
          settings = {
            yaml = {
              schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml"
              },
            },
          },
        },
      },
    },
  },
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        elixir = { "mix" },
      },
      format_on_save = {
        timeout_ms = 10000,
        lsp_fallback = true,
      },
    }
  }
}
