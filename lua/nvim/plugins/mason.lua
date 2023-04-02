require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- print('load mason')
-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
require("mason-lspconfig").setup({
    -- 确保安装，根据需要填写
    ensure_installed = {
        "sumneko_lua",
        "tsserver",
        "tailwindcss",
        "bashls",
        "cssls",
        "emmet_ls",
        "html",
        "jsonls",
        "rust_analyzer",
    },
})


local lspconfig = require('lspconfig')
local common = require('nvim.lsp.common-config')

require("mason-lspconfig").setup_handlers({
    function(server_name)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide targeted overrides for specific servers.
    ["lua_ls"] = function()
        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        }
    end,
    ["typescript"] = function()
        lspconfig.typescript.setup {
            server = {
                on_attach = function(client, bufnr)
                    common.disableFormat(client)
                    common.keyAttach(bufnr)
                    --[[
                      :TypescriptOrganizeImports
                      :TypescriptRenameFile
                      :TypescriptAddMissingImports
                      :TypescriptRemoveUnused
                      :TypescriptFixAll
                      :TypescriptGoToSourceDefinition
                  ]]
                end
            }
        }
    end
})


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
