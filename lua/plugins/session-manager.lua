return {
  { 
    'Shatur/neovim-session-manager',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = function(_, opts)
      config = require('session_manager.config')
      opts.autoload_mode = config.AutoloadMode.CurrentDir
    end
  },
}
