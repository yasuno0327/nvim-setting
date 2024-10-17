return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		version = "^1.0.0",
	},
	-- Do not write config/keymaps.lua.
	-- If write there, there were overridden by lazy default keymaps.
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "search by file name" },
		{
			"<leader>fg",
			"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
			desc = "grep files",
		},
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "help tags" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "search in buffers" },
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("live_grep_args")
	end,
}
