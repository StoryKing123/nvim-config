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
    n_save = "<leader>w", -- :w
    n_force_quit = "<leader>q", -- :qa!
    -- quick move
    n_v_5j = "<C-j>",
    n_v_5k = "<C-k>",
    n_v_10k = "<C-u>",
    n_v_10j = "<C-d>",
    fold = { open = "zo", close = "zc" },
    terminal_to_normal = "<Esc>",
  },
  telescope = {
    enable = true,
    keys = {
      find_files = { "<C-p>", "ff" },
      live_grep = "<C-f>",
      -- super find  "xx" -tmd ---@see telescope-live-grep-args.nvim
      live_grep_args = "sf",
      -- up and down
      move_selection_next = "<C-j>",
      move_selection_previous = "<C-k>",
      -- history
      cycle_history_next = "<Down>",
      cycle_history_prev = "<Up>",
      -- close window
      close = "<esc>",
      -- scrolling in preview window
      preview_scrolling_up = "<C-u>",
      preview_scrolling_down = "<C-d>",
    },
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
      size_equal = "s=",
    },
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
  comment = {
    enable = true,
    -- normal mode
    toggler = {
      line = "gcc", -- line comment
      block = "gbc", -- block comment
    },
    -- visual mode
    opleader = {
      line = "gc",
      bock = "gb",
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
  cmp = {
    enable = true,
    keys = {
      confirm = "<CR>",
      select_next_item = "<C-j>",
      select_prev_item = "<C-k>",
      scroll_doc_up = "<C-u>",
      scroll_doc_down = "<C-d>",
      complete = "<A-.>",
      abort = "<A-,>",
      -- luasnip
      snip_jump_next = "<C-l>",
      snip_jump_prev = "<C-h>",
      snip_next_choice = "<C-j>",
      snip_prev_choice = "<C-k>",
    },
  },
  frontend = {
    enable = true,
    linter = "eslint_d",
    formatter = "prettier",
    format_on_save = false,
    cspell = false,
    -- extra lsp command provided by typescript.nvim
    typescript = {
      keys = {
        ts_organize = "gs",
        ts_rename_file = "gR",
        ts_add_missing_import = "ga",
        ts_remove_unused = "gu",
        ts_fix_all = "gf",
        ts_goto_source = "gD",
      },
    },
  },
  lua = {
    enable = true,
    lsp = "lua_ls",
    formatter = "stylua",
    format_on_save = true,
  },
  rust = {
    enable = true,
    lsp = "rust_analyzer",
    -- rustup component add rustfmt
    formatter = "rustfmt",
    format_on_save = false,
  },
  lsp = {
    -- jumps to the declaration
    definition = "gd",
    -- jumps to the declaration, many servers do not implement this method
    declaration = false,
    -- displays hover information
    hover = "gh",
    -- lists all the implementations
    implementation = "gi",
    -- lists all the references to the symbol
    references = "gr",
    rename = "<leader>rn",
    code_action = "<leader>ca",
    format = "<leader>f",
    -- diagnostic
    open_flow = "gp",
    goto_next = "gj",
    goto_prev = "gk",
    list = "gl",
  },
  nvimTree = {
    enable = true,
    keys = {
      toggle = { "<A-m>", "<leader>m" },
      refresh = "R",
      -- open / close --
      edit = { "o", "<2-LeftMouse>" },
      close = "<BS>", -- close parent folder
      system_open = "<CR>",
      vsplit = "sv",
      split = "sh",
      tabnew = "st",
      -- movement --
      parent_node = "P",
      first_sibling = "K",
      last_sibling = "J",
      cd = ">",
      dir_up = "<",
      -- file toggle --
      toggle_git_ignored = "i", --.gitignore (git enable)
      toggle_dotfiles = ".", -- Hide (dotfiles)
      toggle_custom = "u", -- togglle custom config
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
      toggle_file_info = "gh",
    },
  },
  outline = {
    enable = true,
    keys = {
      open = "ol",
    },
  },
}

return UserConfig
