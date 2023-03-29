local UserConfig = {
    colorscheme = "tokyonight",
    lock_plugin_commit = true,
    max_highlight_line_count = 10000,
    enable_imselect = false,
    enable_very_magic_search = false,
    fix_windows_clipboard = false,
    keys = {
        leader_key = " ",
        -- quick save / quite
        n_save = "<leader>w",       -- :w
        n_force_quit = "<leader>q", -- :qa!
        -- quick move
        n_v_5j = "<C-j>",
        n_v_5k = "<C-k>",
        n_v_10k = "<C-u>",
        n_v_10j = "<C-d>",
        fold = { open = "zo", close = "zc" },
        terminal_to_normal = "<Esc>"
    },
    nvimTree = {
        enable = true,
        keys = {
            toggle = { "<A-m>", "<leader>m" },
        }
    }
}

return UserConfig
