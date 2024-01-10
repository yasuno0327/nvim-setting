local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
local user_command = vim.api.nvim_create_user_command

-- Remove whitespace on save
autocmd("BufWritePre", {
	pattern = "*",
	command = ":%s/\\s\\+$//e",
})

-- Don't auto commenting new lines
autocmd("BufEnter", {
	pattern = "*",
	command = "set fo-=c fo-=r fo-=o",
})

-- Restore cursor location when file is opened
autocmd({ "BufReadPost" }, {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_exec('silent! normal! g`"zv', false)
	end,
})

-- Terminal --
-- Open with insert mode.
autocmd({"TermOpen"}, {
	command = "startinsert",
})

-- Open Terminal on the bottom of the current window, like VSCode.
-- 	Horizontal split
user_command("T", "sp | wincmd j | resize 20 | terminal <args>", { nargs = "*" })
-- 	Vertical split
user_command('TS', 'vs | wincmd j | resize 100 | terminal <args>', { nargs = '*' })
