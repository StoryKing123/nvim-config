local telescope = require("telescope")
local config = require("nvim.config").telescope
local lga_actions = require("telescope-live-grep-args.actions")


telescope.setup({
    defaults = {
        initial_mode = "insert",
        -- vertical , center , cursor
        layout_strategy = "horizontal",
        mappings = {
            i = {
                -- move up and down
                [config.keys.move_selection_next] = "move_selection_next",
                [config.keys.move_selection_previous] = "move_selection_previous",
                -- history
                [config.keys.cycle_history_next] = "cycle_history_next",
                [config.keys.cycle_history_prev] = "cycle_history_prev",
                -- close window
                -- ["<esc>"] = actions.close,
                [config.keys.close] = "close",
                [config.keys.preview_scrolling_up] = "preview_scrolling_up",
                [config.keys.preview_scrolling_down] = "preview_scrolling_down",
            },
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden"
        },
        file_ignore_patterns = {
            "node_modules",
            ".work/.*",
            ".cache/.*",
            ".idea/.*",
            "dist/.*",
            ".git/.*"
        }
    },
    pickers = {
        find_files = {
            -- theme = "dropdown", -- can be : dropdown, cursor, ivy
        },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown({
                -- even more opts
                initial_mode = "normal",
            }),
        },
        live_grep_args = {
            auto_quoting = false, -- enable/disable auto-quoting
            -- mappings = { -- extend mappings
            --   i = {
            --     ["<C-k>"] = lga_actions.quote_prompt(),
            --   },
            -- },
        },
    },
})

keymap("n", config.keys.find_files, "<CMD>Telescope find_files<CR>")
keymap("n", config.keys.live_grep, ":<CMD>Telescope live_grep<CR>")
keymap("n", config.keys.live_grep_args, ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

pcall(telescope.load_extension, "env")
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
pcall(telescope.load_extension, "ui-select")
pcall(telescope.load_extension, "live_grep_args")
