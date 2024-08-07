vim.cmd("autocmd!")

vim.scriptencoding = "utf-8"

vim.wo.number = true

-- remove return
vim.api.nvim_create_user_command("M", function(opts)
  vim.cmd(":%s/\\%(.\\)\\@<!\\n//ig")
end, {})
