local nvimTree = require("nvim-tree")
local config   = require("config").nvimTree


keymap("n", config.keys.toggle, "<CMD>NvimTreeToggle<CR>")

local list_keys = {

    { key = config.keys.refresh,            action = "refresh" },

    -- open / close --
    { key = config.keys.edit,               action = "edit" },
    { key = config.keys.close,              action = "close_node" },
    { key = config.keys.system_open,        action = "system_open" },
    { key = config.keys.vsplit,             action = "vsplit" },
    { key = config.keys.split,              action = "split" },
    { key = config.keys.tabnew,             action = "tabnew" },

    -- movement ---------------
    { key = config.keys.parent_node,        action = "parent_node" },
    { key = config.keys.cd,                 action = "cd" },
    { key = config.keys.dir_up,             action = "dir_up" },
    { key = config.keys.prev_sibling,       action = "prev_sibling" },
    { key = config.keys.next_sibling,       action = "next_sibling" },
    { key = config.keys.first_sibling,      action = "first_sibling" },
    { key = config.keys.last_sibling,       action = "last_sibling" },

    -- file toggle --
    { key = config.keys.toggle_git_ignored, action = "toggle_git_ignored" },
    { key = config.keys.toggle_dotfiles,    action = "toggle_dotfiles" },
    { key = config.keys.toggle_custom,      action = "toggle_custom" },
    { key = config.keys.toggle_file_info,   action = "toggle_file_info" },

    ------ file operation ----------
    { key = config.keys.create,             action = "create" },
    { key = config.keys.remove,             action = "remove" },
    { key = config.keys.rename,             action = "rename" },
    { key = config.keys.copy,               action = "copy" },
    { key = config.keys.cut,                action = "cut" },
    { key = config.keys.paste,              action = "paste" },
    { key = config.keys.copy_name,          action = "copy_name" },
    { key = config.keys.copy_path,          action = "copy_path" },
    { key = config.keys.copy_absolute_path, action = "copy_absolute_path" },
    { key = config.keys.toggle_file_info,   action = "toggle_file_info" },

}
nvimTree.setup({
    update_focused_file = {
        enable = true,
        update_root = true,
    },
    git = {
        enable = true,
        ignore = true,
    },
    filters = {
        -- hide dot files
        dotfiles = true,
        -- hide node_modules folder
        -- custom = { "node_modules" },
    },
    view = {
        width = 34,
        -- or 'right'
        side = "left",
        hide_root_folder = false,
        mappings = {
            custom_only = true,
            list = list_keys,
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes",
    },
    actions = {
        open_file = {
            resize_window = true,
            quit_on_open = false,
        },
    },
    renderer = {
        indent_markers = {
            enable = false,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "after",
        },
    },
})


-- open_on_setup
-- automatically open the tree when running setup if startup buffer is a directory
-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
vim.notify('hello')


local function open_nvim_tree(data)
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
    local directory = vim.fn.isdirectory(data.file) == 1
    if not no_name and not directory then
        return
    end
    if directory then
        vim.cmd.cd(data.file)
    end
    require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })  

-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
-- require("nvim-tree.api").tree.open()

-- local function open_nvim_tree()
--     -- open the tree
--     require("nvim-tree.api").tree.open()
-- end
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
