local bufferline = require("bufferline")
local config = require('config').bufferLine

bufferline.setup({
    options = {
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left",
            },
        },
        ---@diagnostic disable-next-line: assign-type-mismatch
        diagnostics = "nvim_lsp",
        ---@diagnostic disable-next-line: unused-local
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " " or (e == "warning" and " " or "")
                s = s .. n .. sym
            end
            return s
        end,
    },
})

keymap("n", config.keys.prev, ":BufferLineCyclePrev<CR>")
keymap("n", config.keys.next, ":BufferLineCycleNext<CR>")
-- "moll/vim-bbye"
keymap("n", config.keys.close, ":bdelete!<CR>")
keymap("n", config.keys.close_left, ":BufferLineCloseLeft<CR>")
keymap("n", config.keys.close_right, ":BufferLineCloseRight<CR>")
keymap("n", config.keys.close_others, ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>")
keymap("n", config.keys.close_pick, ":BufferLinePickClose<CR>")
