return function(config)
    return {
        getFormatOnSavePattern = function()
            if config.format_on_save then
                return { "*.ts", "*.tsx", "*.js", "*.jsx" }
            end
            return {}
        end,
        getTSEnsureList = function()
            return { "html", "css", "javascript", "typescript", "tsx", "vue" }
        end,
        getLSPEnsureList = function()
            return { "tsserver", "tailwindcss", "cssls", "emmet_ls", "html" }
        end,
        getLSPConfigMap = function()
            return {
                tsserver = require("nvim.lsp.config.typescript"),
                tailwindcss = require("nvim.lsp.config.tailwindcss"),
                cssls = require("nvim.lsp.config.css"),
                emmet_ls = require("nvim.lsp.config.emmet"),
                html = require("nvim.lsp.config.html"),
            }
        end,
        getToolEnsureList = function()
            local list = {}
            -- if config.formatter == "eslint_d" or config.linter == "eslint_d" then
            --     table.insert(list, "eslint_d")
            -- end
            if config.formatter == "prettier" then
                table.insert(list, "prettier")
            end
            if config.cspell then
                table.insert(list, "cspell")
            end
            return list
        end,
        getNulllsSources = function()
            local null_ls = pRequire("null-ls")
            if not null_ls then
                return {}
            end
            local list = {}
            if config.formatter == "eslint_d" then
                table.insert(list, null_ls.builtins.formatting.eslint_d)
            elseif config.formatter == "prettier" then
                table.insert(
                    list,
                    null_ls.builtins.formatting.prettier.with({
                        filetypes = {
                            "javascript",
                            "javascriptreact",
                            "typescript",
                            "typescriptreact",
                            "vue",
                            "css",
                            "scss",
                            "less",
                            "html",
                            "graphql",
                            -- "json",
                            -- "yaml",
                            -- "markdown",
                        },
                        timeout = 10000,
                        prefer_local = "node_modules/.bin",
                    })
                )
            end
            table.insert(list, null_ls.builtins.diagnostics.eslint_d)
            table.insert(list, null_ls.builtins.code_actions.eslint_d)
            table.insert(list, require("typescript.extensions.null-ls.code-actions"))
            if config.cspell then
                table.insert(
                    list,
                    null_ls.builtins.diagnostics.cspell.with({
                        filetypes = {
                            "javascript",
                            "javascriptreact",
                            "typescript",
                            "typescriptreact",
                        },
                    })
                )
                table.insert(
                    list,
                    null_ls.builtins.code_actions.cspell.with({

                        "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact",
                    })
                )
            end
            return list
        end,
        getNeotestAdapters = function()
            return {}
        end,
    }
end
