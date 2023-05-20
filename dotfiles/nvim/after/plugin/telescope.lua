local builtin = require('telescope.builtin')

-- Default Mappings
-- <C-n>/<Down>	Next item
-- <C-p>/<Up>	Previous item
-- j/k	Next/previous (in normal mode)
-- H/M/L	Select High/Middle/Low (in normal mode)
-- gg/G	Select the first/last item (in normal mode)
-- <CR>	Confirm selection
-- <C-x>	Go to file selection as a split
-- <C-v>	Go to file selection as a vsplit
-- <C-t>	Go to a file in a new tab
-- <C-u>	Scroll up in preview window
-- <C-d>	Scroll down in preview window
-- <C-/>	Show mappings for picker actions (insert mode)
-- ?	Show mappings for picker actions (normal mode)
-- <C-c>	Close telescope
-- <Esc>	Close telescope (in normal mode)
-- <Tab>	Toggle selection and move to next selection
-- <S-Tab>	Toggle selection and move to prev selection
-- <C-q>	Send all items not filtered to quickfixlist (qflist)
-- <M-q>	Send all selected items to qflist

vim.keymap.set('n', '<leader>t', builtin.find_files, {})
vim.keymap.set('n', '<leader>T', builtin.git_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<C-a>', function()
	builtin.grep_string({ search = vim.call('expand','<cword>') }) 
end)

vim.keymap.set('n', '<leader>S', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- Use :Ag for greping project
require('telescope').load_extension("ag")

