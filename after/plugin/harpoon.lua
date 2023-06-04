require("harpoon").setup({ 
  tabline = true,
})

vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=white')

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- key maps to use harpoon
vim.keymap.set("n", "<leader>ah", mark.add_file, {desc="[A]dd to [H]arpoon"})
vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu, {desc="[H]arpoon [M]enu"})

-- key maps to navigate between files added to harpoon
vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
