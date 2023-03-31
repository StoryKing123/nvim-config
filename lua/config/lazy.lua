local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    -- bootstrap lazy.nvim
    -- stylua: ignore
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
    })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "nvim-lua/plenary.nvim" }
    ,
    { "MunifTanjim/nui.nvim" },
    {
        'rcarriga/nvim-notify',
        config = function()
            require('plugins.nvim-notify')
        end
    },

    -- the colorscheme should be available when starting Neovim
    {
        'nvim-tree/nvim-tree.lua',
        config = function() require("plugins.nvim-tree") end
    },
    -- {
    --     "nvim-neo-tree/neo-tree.nvim",
    --     keys = {
    --         { "<A-m>", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    --     },
    --     config = function()
    --         -- require("neo-tree").setup()
    --     end,
    -- },

    {
        'akinsho/bufferline.nvim',
        config = function()
            require('plugins.bufferline')
        end,
        version = "v3.*",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("plugins.tokyonight").config()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
        end
    },

    -- I have a separate config.mappings file where I require which-key.
    -- With lazy the plugin will be automatically loaded when it is required somewhere
    { "folke/which-key.nvim",   lazy = true },
    {
        "nvim-neorg/neorg",
        -- lazy-load on filetype
        ft = "norg",
        -- options for neorg. This will automatically call `require("neorg").setup(opts)`
        opts = { load = { ["core.defaults"] = {} } }
    },

    --dashboard
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('plugins.dashboard-nvim')
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },

    -- nvim-treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            -- require('plugins.treesitter')
        end
    },

    {
        "dstein64/vim-startuptime",
        -- lazy-load on a command
        cmd = "StartupTime",
        -- init is called during startup. Configuration for vim plugins typically should be set in an init function
        init = function() vim.g.startuptime_tries = 10 end
    }, {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer" },
    config = function()
        -- ...
    end
},

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("plugins.nvim-surround")
        end
    },

    -- if some code requires a module from an unloaded plugin, it will be automatically loaded.
    -- So for api plugins like devicons, we can always set lazy=true

    -- you can use the VeryLazy event for things that can
    -- load later and are not important for the initial UI
    { "stevearc/dressing.nvim", event = "VeryLazy" }, {
    "Wansmer/treesj",
    keys = { { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" } },
    opts = { use_default_keymaps = false, max_join_length = 150 }
}, {
    "monaqa/dial.nvim",
    -- lazy-load on keys
    -- mode is `n` by default. For more advanced options, check the section on key mappings
    keys = { "<C-a>", { "<C-x>", mode = "n" } }
}, -- local plugins need to be explicitly configured with dir
    { dir = "~/projects/secret.nvim" },

    -- you can use a custom url to fetch a plugin
    -- { url = "git@github.com:folke/noice.nvim.git" },

    -- local plugins can also be configure with the dev option.
    -- This will use {config.dev.path}/noice.nvim/ instead of fetching it from Github
    -- With the dev option, you can easily switch between the local and installed version of a plugin
    -- { "folke/noice.nvim" }
})
