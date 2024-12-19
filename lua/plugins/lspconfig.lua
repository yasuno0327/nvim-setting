return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.dockerls.setup({})
			lspconfig.dotls.setup({})
			lspconfig.gopls.setup({})
			lspconfig.lua_ls.setup({})
			lspconfig.terraformls.setup({})
			lspconfig.jdtls.setup({})
			lspconfig.pyright.setup({})
		end,
	},
	{
		"stevearc/conform.nvim",
	},
}
