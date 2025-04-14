return {
	"ruifm/gitlinker.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function(_, _)
		require("gitlinker").setup({
			callbacks = {
				["github.com"] = require("gitlinker.hosts").get_github_type_url,
			},
		})
	end,
}
