local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

--local keymap = vim.keymap
local keymap = vim.api.nvim_set_keymap
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
vim.g.maplocalleader = " "

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

-- Tab --
-- New tab
keymap("n", "te", ":tabedit", opts)
-- 新しいタブを一番右に作る
keymap("n", "gn", ":tabnew<Return>", opts)

-- move tab
-- 右へ
keymap("n", "gh", "gT", opts)
-- 左へ
keymap("n", "gl", "gt", opts)

-- Split window
keymap("n", "ss", ":split<Return><C-w>w", opts)
keymap("n", "sv", ":vsplit<Return><C-w>w", opts)
-- Move window:
--   下Ctrl-w j
--   上Ctrl-w k
--   右Ctrl-w l
--   左Ctrl-w h
-- Close current window:
--   ctrl-w q

-- Select all
-- C -> Ctrl
-- S -> Shift
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- Do not yank with x
keymap("n", "x", '"_x', opts)

-- 行の端に行く
keymap("n", "<Space>h", "^", opts)
keymap("n", "<Space>l", "$", opts)

-- ;でコマンド入力( ;と:を入れ替)
keymap("n", ";", ":", opts)

-- 行末までのヤンクにする
keymap("n", "Y", "y$", opts)

-- <Space>q で強制終了
keymap("n", "<Space>q", ":<C-u>q!<Return>", opts)

-- ESC*2 でハイライトやめる
keymap("n", "<Esc><Esc>", ":<C-u>set nohlsearch<Return>", opts)

-- Visual --
-- Stay in indent mode (v押下でインデントモードのまま何回もインデント出来る)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- ビジュアルモード時vで行末まで選択
keymap("v", "v", "$h", opts)

-- 0番レジスタを使いやすくした
-- ヤンクした文字列は0番レジスタに入る (ヤンク後に誤ってxで削除した文字列をヤンクしてしまった場合に0番レジスタを参照して貼り付け出来る)
keymap("v", "<C-p>", '"0p', opts)

-- テキスト全てを削除する
keymap("n", "<Space>a", "gg<S-v>Gd", opts)


-- Terminal --
--  Escでノーマルモードに戻る
keymap("t", "<Esc>", "<C-\\><C-n>", term_opts)
-- 常にインサートモード
--keymap("n", "T", "T <cr>", { noremap = true })
--keymap("n", "TS", ":TS <cr>", { noremap = true })

-- Telescope --
keymap('n', '<leader>ff', ":Telescope find_files<CR>", { noremap = true })
keymap('n', '<leader>fg', ":Telescope live_grep<CR>", { noremap = true })
keymap('n', '<leader>fh', ":Telescope help_tags<CR>", { noremap = true })
keymap("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true })
--[[
keymap(
  "n",
  "<leader>fb",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)
--]]

-- CheatSheet --
keymap("n", "<leader>?", ":Cheatsheet<CR>", { noremap = true })

-- ChadTree --
keymap("n", "<leader>v", ":CHADopen<CR>", { noremap = true })

-- lsp --
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

-- copilot --
vim.g.copilot_no_tab_map = true
keymap("i", "<C-i>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- toggleterm --
keymap("n", "<C-t>", ":ToggleTerm dir=git_dir direction=horizontal <CR>", { noremap = true })
