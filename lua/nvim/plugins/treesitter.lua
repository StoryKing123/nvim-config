local treesitter = require("nvim-treesitter.configs")
treesitter.setup({
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = { "json", "html", "css", "vim", "lua", "javascript", "typescript", "tsx" },
  -- 启用代码高亮模块
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- 增量选择 （CR BS TAB）
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
      scope_incremental = "<TAB>",
    },
  },
  -- 启用代码缩进模块 (=)
  indent = {
    enable = true,
  },
  rainbow = {
    -- enable = true,
    enable =  false,
    -- list of languages you want to disable the plugin for
    -- disable = { 'jsx', 'cpp' },
    -- Which query to use for finding delimiters
    query = "rainbow-parens",
    -- Highlight the entire buffer all at once
    strategy = require("ts-rainbow").strategy.global,
  },
})

-- 开启 Folding 模块 zc折叠 zo开大折叠
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99
