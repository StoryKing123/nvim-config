local luasnip = require("luasnip")
local types = require("luasnip.util.types")
local config = require("nvim.config").cmp

local pathUtils = require("nvim.utils.path")

-- if not luasnip or not types then
--     return
-- end

-- custom snippets
require("luasnip.loaders.from_lua").load({
    paths = pathUtils.join(pathUtils.getConfig(), "lua", "nvim","plugins", "cmp", "snippets", "lua"),
})
require("luasnip.loaders.from_vscode").lazy_load({
    paths = pathUtils.join(pathUtils.getConfig(), "lua", "nvim", "plugins","cmp", "snippets", "vscode"),
})
-- https://github.com/rafamadriz/friendly-snippets/
require("luasnip.loaders.from_vscode").lazy_load()

luasnip.config.set_config({
    history = true,
    update_events = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    ext_opts = {
        [types.choiceNode] = {
            active = {
                -- virt_text = { { "choiceNode", "Comment" } },
                virt_text = { { "<--", "Error" } },
            },
        },
    },
})

keymap({ "i", "s" }, config.keys.snip_jump_next, function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    end
end)

keymap({ "i", "s" }, config.keys.snip_jump_prev, function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end)

keymap({ "i", "s" }, config.keys.snip_next_choice, function()
    if luasnip.choice_active() then
        luasnip.change_choice(1)
    end
end)

keymap({ "i", "s" }, config.keys.snip_prev_choice, function()
    if luasnip.choice_active() then
        luasnip.change_choice(-1)
    end
end)
