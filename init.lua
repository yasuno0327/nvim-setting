require("config.lazy")
require("config.autocmds")
-- Can't load plugin api in lazy autoload
-- So... Reload keymaps here
require("config.keymaps")
-- config/keymaps and config/options are automatically loaded before lazy.nvim startup
