local nvimTree = require("nvim-tree")
local config   = require("config").nvimTree


keymap("n", config.keys.toggle, "<CMD>NvimTreeToggle<CR>")
local list_keys = {

}
nvimTree.setup({})

local api = require("nvim-tree.api")
