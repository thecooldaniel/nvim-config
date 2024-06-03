-- Set colorscheme
local colorscheme_fallback = "habamax"
local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
   vim.notify("colorscheme " .. colorscheme .. " not found, using fallback " .. colorscheme_fallback)
   vim.cmd 'colorscheme habamax'
end
