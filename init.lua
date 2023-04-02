vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
-- bootstrap lazy.nvim, LazyVim and your plugins
require('nvim.global')

require("nvim.config.lazy")
require('nvim.config.keybindings')
require('nvim.lsp')
require('nvim.plugins.cmp')
-- require('nivm')



-- setup.update_to_buf_dir.enable = false
-- vim.cmd[[colorscheme tokyonight]]
-- disable netrw at the very start of your init.lua (strongly advised)

-- empty setup using defaults
