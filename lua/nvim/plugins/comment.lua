local config = require("nvim.config").comment
local comment = pRequire("Comment")

local preHook = pRequire("ts_context_commentstring.integrations.comment_nvim")
if preHook ~= nil then
    preHook = preHook.create_pre_hook()
end

if comment and config and config.enable then
    comment.setup({
        mappings = {
            -- disable extra keys
            extra = false,
        },
        -- Normal Mode
        toggler = {
            line = config.toggler.line, -- line comment
            block = config.toggler.block, -- block comment
        },
        -- Visual Mode
        opleader = {
            line = config.opleader.line,
            bock = config.opleader.block,
        },
        -- context_commentstring for JSX
        -- also see treesitter.lua
        pre_hook = preHook,
    })
end
