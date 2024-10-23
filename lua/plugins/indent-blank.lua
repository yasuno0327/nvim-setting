return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		dependencies = "TheGLander/indent-rainbowline.nvim",
		opts = function(_, opts)
			return require("indent-rainbowline").make_opts(opts)
		end,
	},
}
