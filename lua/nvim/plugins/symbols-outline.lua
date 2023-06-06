local outline = require("symbols-outline")
local config = require("nvim.config").outline
-- print("outline setup")
-- outline.setup()
keymap("n", config.keys.open, ":SymbolsOutline<cr>")
-- keymap("n",'ol',":SymbolsOutline<cr>")
outline.setup()

-- print("outline setup end")
--[[
--Escape	Close outline
Enter	Go to symbol location in code
o	Go to symbol location in code without losing focus
Ctrl+Space	Hover current symbol
K	Toggles the current symbol preview
r	Rename symbol
a	Code actions
h	fold symbol
l	Unfold symbol
W	Fold all symbols
E	Unfold all symbols
R	Reset all folding
?	Show help messages
]]
--
