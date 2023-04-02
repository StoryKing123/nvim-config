local cmp        = require("cmp")
local luasnip = require("luasnip")
local formatting = require('nvim.plugins.cmp.format').formatting
local config     = require('nvim.config').cmp
local mapping    = {
    [config.keys.complete] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    [config.keys.abort] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
    }),
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    [config.keys.confirm] = cmp.mapping.confirm({
        select = true,
        behavior = cmp.ConfirmBehavior.Replace,
    }),
    -- ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    -- -- 取消
    -- ["<A-,>"] = cmp.mapping({
    --     i = cmp.mapping.abort(),
    --     c = cmp.mapping.close()
    -- }),
    [config.keys.scroll_doc_up] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    [config.keys.scroll_doc_down] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    [config.keys.select_prev_item] = cmp.mapping.select_prev_item(),
    [config.keys.select_next_item] = cmp.mapping.select_next_item(),
}

-- select next/prev in command mode
keymap("c", config.keys.select_next_item, "<C-n>", {
    remap = true,
    silent = true,
})
keymap("c", config.keys.select_prev_item, "<C-p>", {
    remap = true,
    silent = true,
})

cmp.setup({
    -- we use luasnip
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = mapping,
    formatting = formatting,
    sources = cmp.config.sources({
        {
            name = "nvim_lsp",
            group_index = 1,
        },
        {
            name = "nvim_lsp_signature_help",
            group_index = 1,
        },
        {
            name = "luasnip",
            group_index = 2,
        },
        {
            name = "buffer",
            group_index = 3,
        },
        {
            name = "path",
            group_index = 3,
        },
    }),
})



-- Use buffer source for `/`.
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { {
        name = "buffer",
    } },
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ {
        name = "path",
    } }, { {
        name = "cmdline",
    } }),
})

cmp.setup.filetype({ "markdown", "help" }, {
    window = {
        documentation = cmp.config.disable,
    },
    sources = { {
        name = "luasnip",
    }, {
        name = "buffer",
    }, {
        name = "path",
    } },
})

vim.notify('hello')

require("nvim.plugins.cmp.snip")