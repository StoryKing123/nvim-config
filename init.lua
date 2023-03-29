-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require('global')
require('config.keybindings')

-- vim.cmd[[colorscheme tokyonight]]
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()
