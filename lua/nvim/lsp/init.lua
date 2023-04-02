local mason = require("mason")
local mason_config = require("mason-lspconfig")
local lspconfig = require("lspconfig")
-- local mason_tool = require("mason-tool-installer")

-- local servers = {
--     typescript = require('nvim.lsp.config.typescript')
-- }


-- for name, config in pairs(servers) do
--     if config ~= nil and type(config) == 'table' then
--         config.on_setup(lspconfig[name])
--     else
--         lspconfig[name].setup({})
--     end
-- end





-- :h mason-default-settings
-- ~/.local/share/nvim/mason
-- mason.setup({
--     ui = {
--         border = "rounded",
--         icons = {
--             package_installed = "✓",
--             package_pending = "➜",
--             package_uninstalled = "✗",
--         },
--     },
-- })

-- mason_config.setup({
--     ensure_installed = {
--         "sumneko_lua",
--         "tsserver",
--         "tailwindcss",
--         "bashls",
--         "cssls",
--         "emmet_ls",
--         "html",
--         "jsonls",
--         "rust_analyzer",
--         "yamlls",
--     }
--     -- ensure_installed = require("nvim.env").getLSPEnsureList(),
-- })

-- mason_tool.setup({
--     ensure_installed = require("nvim.env").getToolEnsureList(),
-- })
