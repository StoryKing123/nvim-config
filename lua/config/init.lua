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
    s_windows = {
        keys = {
            split_vertically = "sv",
            split_horizontally = "sh",
            -- close current
            close = "sc",
            -- close others
            close_others = "so",
            -- jump between windows
            jump_left = { "<A-h>", "<leader>h" },
            jump_right = { "<A-l>", "<leader>l" },
            jump_up = { "<A-k>", "<leader>k" },
            jump_down = { "<A-j>", "<leader>j" },
            -- control windows size
            width_decrease = "s,",
            width_increase = "s.",
            height_decrease = "sj",
            height_increase = "sk",
            size_equal = "s="
        }
    },
    bufferLine = {
        enable = true,
        keys = {
            -- left / right cycle
            prev = "<C-h>",
            next = "<C-l>",
            -- close current buffer
            close = "<C-w>", -- close = "<leader>bc",
            -- close all left / right tabs
            close_left = "<leader>bh",
            close_right = "<leader>bl",
            -- close all other tabs
            close_others = "<leader>bo",
            close_pick = "<leader>bp",
        },
    },
    notify = {
        enable = true,
        ---@type number in millionsecond
        timeout = 3000,
        ---@type 'fade' | 'static' | 'slide'
        stages = "fade",
        ---@type  'defalut' | 'minimal' | 'simple'
        render = "minimal",
    },
    nvimTree = {
        enable = true,
        keys = {
            toggle = { "<A-m>", "<leader>m" },
            refresh = "R",
            -- open / close --
            edit = { "o", "<2-LeftMouse>" },
            close = "<BS>",
            system_open = "<CR>",
            vsplit = "sv",
            split = "sh",
            tabnew = "gh",
            -- movement --
            parent_node = "P",
            cd = "]",
            dir_up = "[",
            prev_sibling = "<",
            next_sibling = ">",
            first_sibling = "K",
            last_sibling = "J",
            -- file toggle --
            toggle_git_ignored = "i", --.gitignore (git enable)
            toggle_dotfiles = ".",    -- Hide (dotfiles)
            toggle_custom = "u",      -- togglle custom config
            toggle_file_info = "gh",
            -- file operate --
            create = "a",
            remove = "d",
            rename = "r",
            cut = "x",
            copy = "c",
            paste = "p",
            copy_name = "y",
            copy_path = "Y",
            copy_absolute_path = "gy",
        }
    }
}

return UserConfig
