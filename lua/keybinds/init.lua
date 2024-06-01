-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Floatterm
vim.keymap.set('n', '<F12>', ':FloatermToggle<CR>', {desc = 'Toggle Floaterm'})
vim.keymap.set('n', '<F11>', ':FloatermNew --disposable --autoclose=2 lazygit<CR>')
vim.keymap.set('n', '<F10>', ':FloatermKill<CR>')

-- Custom
vim.keymap.set('n', '<C-x><C-s>', ':w<CR>', {desc = 'Save buffer'})
vim.keymap.set('n', '<leader>llc', ':lua =require(\'lint\').linters<CR>', { desc = '[L]inter [C]onfig' })
vim.keymap.set('n', '<leader>wtt', ':tabnew<CR>', { desc = '[T]ab new'})
vim.keymap.set('n', '<leader>wtn', ':tabnext<CR>', { desc = '[T]ab [N]ext'})
vim.keymap.set('n', '<leader>wtp', ':tabprevious<CR>', { desc = '[T]ab [P]revious'})
