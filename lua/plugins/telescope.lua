return {
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
}
