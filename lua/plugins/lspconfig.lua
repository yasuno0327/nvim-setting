return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		config = function()
			-- nvim-javaはlspconfigの前にセットアップする必要があるらしい？
			-- ref: https://github.com/nvim-java/nvim-java?tab=readme-ov-file#hammer-how-to-install
			require("java").setup()
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
