local nvimTree = require("nvim-tree")
local config = require("nvim.config").nvimTree

local function on_attach(bufnr)
  local api = require("nvim-tree.api")
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  keymap("n", config.keys.toggle, "<CMD>NvimTreeToggle<CR>")
  keymap("n", config.keys.refresh, api.tree.reload, opts("Refresh"))

  -- open / close --
  keymap("n", config.keys.edit, api.node.open.edit, opts("Open"))
  keymap("n", config.keys.close, api.node.navigate.parent_close, opts("Close Directory"))
  keymap("n", config.keys.system_open, api.node.run.system, opts("Run System"))
  keymap("n", config.keys.vsplit, api.node.open.vertical, opts("Open: Vertical Split"))
  keymap("n", config.keys.split, api.node.open.horizontal, opts("Open: Horizontal Split"))
  keymap("n", config.keys.tabnew, api.node.open.tab, opts("Open: New Tab"))

  -- movement --
  keymap("n", config.keys.parent_node, api.node.navigate.parent, opts("Parent Directory"))
  keymap("n", config.keys.last_sibling, api.node.navigate.sibling.last, opts("Last Sibling"))
  keymap("n", config.keys.first_sibling, api.node.navigate.sibling.first, opts("First Sibling"))
  keymap("n", config.keys.cd, api.tree.change_root_to_node, opts("CD"))
  keymap("n", config.keys.dir_up, api.tree.change_root_to_parent, opts("Up"))

  -- file toggle --
  keymap("n", config.keys.toggle_git_ignored, api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
  keymap("n", config.keys.toggle_dotfiles, api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
  keymap("n", config.keys.toggle_custom, api.tree.toggle_custom_filter, opts("Toggle Hidden"))

  -- file operate --
  keymap("n", config.keys.create, api.fs.create, opts("Create"))
  keymap("n", config.keys.remove, api.fs.remove, opts("Delete"))
  keymap("n", config.keys.rename, api.fs.rename, opts("Rename"))
  keymap("n", config.keys.copy, api.fs.copy.node, opts("Copy"))
  keymap("n", config.keys.cut, api.fs.cut, opts("Cut"))
  keymap("n", config.keys.paste, api.fs.paste, opts("Paste"))
  keymap("n", config.keys.copy_name, api.fs.copy.filename, opts("Copy Name"))
  keymap("n", config.keys.copy_path, api.fs.copy.relative_path, opts("Copy Relative Path"))
  keymap("n", config.copy_absolute_path, api.fs.copy.absolute_path, opts("Copy Absolute Path"))
  keymap("n", config.toggle_file_info, api.node.show_info_popup, opts("Info"))
end
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimTree.setup({
  on_attach = on_attach,
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
  system_open = {
    -- NOTE: WSL need wsl-open
    -- npm install -g wsl-open
    -- https://github.com/4U6U57/wsl-open/
    -- cmd = isWSL() and "wsl-open" or "open",
    cmd = "open",
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

--[[
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
--]]
