local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
local user_command = vim.api.nvim_create_user_command

-- Restore cursor location when file is opened
autocmd({ "BufReadPost" }, {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_exec2('silent! normal! g`"zv', { output = false })
	end,
})

autocmd({ "VimEnter" }, { command = "CHADopen" })

-- Session --
autocmd({ "BufWritePre" }, {
	callback = function()
		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			-- Don't save while there's any 'nofile' buffer open.
			if vim.api.nvim_get_option_value("buftype", { buf = buf }) == "nofile" then
				return
			end
		end
		session_manager.save_current_session()
	end,
})

-- linter
autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

-- Terminal --
-- Open with insert mode.
autocmd({ "TermOpen" }, {
	command = "startinsert",
})

-- Open Terminal on the bottom of the current window, like VSCode.
-- 	Horizontal split
user_command("T", "sp | wincmd j | resize 20 | terminal <args>", { nargs = "*" })
-- 	Vertical split
user_command("TS", "vs | wincmd j | resize 100 | terminal <args>", { nargs = "*" })

-- lsp --
autocmd({ "BufWritePre" }, {
	pattern = { "*.tf", "*.tfvars" },
	callback = function()
		vim.lsp.buf.format()
	end,
})

-- conform --
autocmd({ "BufWritePre" }, {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
