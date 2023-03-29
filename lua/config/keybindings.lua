local cfg = require("config")
local keys = cfg.keys

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

vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", keys.n_save, "<CMD>w<CR>")
keymap({mode_adapters.normal_mode, mode_adapters.visual_mode}, keys.n_v_5j, "5j")
keymap({
    mode_adapters.normal_mode, mode_adapters.visual_mode,
    mode_adapters.visual_mode
}, keys.n_v_5k, "5k")
