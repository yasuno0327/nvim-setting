local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

--local keymap = vim.keymap
local keymap = vim.api.nvim_set_keymap
local bufkeymap = vim.api.nvim_buf_set_keymap
--[[
  lhs: left-hand-side - キー入力lhs
  rhs: right-hand-side - 割当先rhs
  に割り当てる

  -- mode
    normal_mode = 'n',
    insert_mode = 'i',
    visual_mode = 'v',
    visual_block_mode = 'x',
    term_mode = 't',
    command_mode = 'c',

  nvim_set_keymap(mode, lhs, rhs, opts)
--]]

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Better paste with Newline
keymap("n", "p", ":pu<CR>", opts)

-- Close Buffer Tab --
keymap("n", "<C-w>", ":BufferClose<CR>", opts)

-- Tab --
-- New tab
keymap("n", "te", ":tabedit", opts)
-- 新しいタブを一番右に作る
keymap("n", "gn", ":tabnew<Return>", opts)

-- move buffer
-- to left
keymap("n", "gh", ":BufferPrevious<CR>", opts)
-- to right
keymap("n", "gl", ":BufferNext<CR>", opts)

-- Split window
keymap("n", "ss", ":split<Return><C-w>w", opts)
keymap("n", "sv", ":vsplit<Return><C-w>w", opts)

-- Select all
-- C -> Ctrl
-- S -> Shift
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- Do not yank with x
keymap("n", "x", '"_x', opts)

-- Go to end of line.
keymap("n", "<Space>h", "^", opts)
keymap("n", "<Space>l", "$", opts)

-- If press Y, Yank end of line
keymap("n", "Y", "y$", opts)

-- Force exit nvim.
keymap("n", "<Space>q", ":<C-u>qa!<Return>", opts)

-- Stop highlighting.
keymap("n", "<Esc><Esc>", ":<C-u>set nohlsearch<Return>", opts)

local function insertFullPath()
	local filepath = vim.fn.expand("%")
	vim.fn.setreg("+", filepath)
end

vim.keymap.set("n", "<leader>pc", insertFullPath, { noremap = true, silent = true })

-- Visual --
-- Stay in indent mode (Allow multiple indentation in Visual mode.)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- select end of line in visual mode
keymap("v", "v", "$h", opts)

-- 0番レジスタを使いやすくした
-- ヤンクした文字列は0番レジスタに入る (ヤンク後に誤ってxで削除した文字列をヤンクしてしまった場合に0番レジスタを参照して貼り付け出来る)
keymap("v", "<C-p>", '"0p', opts)

-- Delete all text.
keymap("n", "<Space>a", "gg<S-v>Gd", opts)

-- Terminal --
--  Escでノーマルモードに戻る
keymap("t", "<Esc>", "<C-\\><C-n>", term_opts)
-- 常にインサートモード
keymap("n", "T", "T <cr>", { noremap = true })
--keymap("n", "TS", ":TS <cr>", { noremap = true })

-- ChadTree --
keymap("n", "<leader>v", ":CHADopen<CR>", opts)

-- lsp --
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

-- copilot --
vim.g.copilot_no_tab_map = true
keymap("i", "<C-i>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- toggleterm --
keymap("n", "<C-t>", ":ToggleTerm dir=git_dir direction=horizontal <CR>", opts)

keymap("n", "<leader>l", ":call MixRunCurrentTest()<CR>", opts)
