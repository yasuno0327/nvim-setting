return {
	{
		"javiorfo/nvim-soil",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"javiorfo/nvim-nyctophilia",
		},
		lazy = true,
		ft = "plantuml",
		actions = { redraw = true },
		image = {
			darkmode = true,
			format = "png",
			execute_to_open = function(img)
				return "nsxiv -b " .. img
			end,
		},
	},
	{
		"stevearc/conform.nvim",
	},
}
