local config = require("config")
local keys = config.keys

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 复用 opt 参数
local opt = {noremap = true, silent = true }

local map = vim.api.nvim_set_keymap


local M = {}
local mode_adapters = {
    insert_mode = "i",
    normal_mode = "n",
    term_mode = "t",
    visual_mode = "v",
    visual_block_mode = "x",
    command_mode = "c",
    operator_pending_mode = "o"
}

keymap("n", keys.n_save, "<CMD>w<CR>")
keymap({ mode_adapters.normal_mode, mode_adapters.visual_mode }, keys.n_v_5j, "5j")
keymap({
    mode_adapters.normal_mode, mode_adapters.visual_mode,
    mode_adapters.visual_mode
}, keys.n_v_5k, "5k")


-- windows
local skey = config.s_windows.keys
keymap("n", skey.split_vertically, ":vsp<CR>")
keymap("n", skey.split_horizontally, ":sp<CR>")
keymap("n", skey.close, "<C-w>c")
keymap("n", skey.close_others, "<C-w>o") -- close others

keymap("n", skey.jump_left, "<C-w>h")
keymap("n", skey.jump_down, "<C-w>j")
keymap("n", skey.jump_up, "<C-w>k")
keymap("n", skey.jump_right, "<C-w>l")

keymap("n", skey.width_decrease, ":vertical resize -10<CR>")
keymap("n", skey.width_increase, ":vertical resize +10<CR>")
keymap("n", skey.height_decrease, ":horizontal resize -10<CR>")
keymap("n", skey.height_increase, ":horizontal resize +10<CR>")
keymap("n", skey.size_equal, "<C-w>=")



-- local tkey = config.cmp.keys
-- keymap("n", tkey.split, "<CMD>tab split<CR>")
-- keymap("n", tkey.close, "<CMD>tabclose<CR>")
-- keymap("n", tkey.next, "<CMD>tabnext<CR>")
-- keymap("n", tkey.prev, "<CMD>tabprev<CR>")
-- keymap("n", tkey.first, "<CMD>tabfirst<CR>")
-- keymap("n", tkey.last, "<CMD>tablast<CR>")