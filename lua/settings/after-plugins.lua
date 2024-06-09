-- Set colorscheme
vim.o.background = "dark"
local colorscheme_fallback = "habamax"
local colorscheme = "rose-pine-main"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
   vim.notify("colorscheme " .. colorscheme .. " not found, using fallback " .. colorscheme_fallback)
   vim.cmd 'colorscheme habamax'
end
