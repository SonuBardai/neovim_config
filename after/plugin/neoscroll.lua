require('neoscroll').setup({
	mappings = { '<C-u>', '<C-d>' }
})

local t = {}

t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '110', [['sine']] } }
t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '110', [['sine']] } }

require('neoscroll.config').set_mappings(t)
