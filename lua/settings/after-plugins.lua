-- Set colorscheme
vim.o.background = "dark"
local colorscheme_fallback = "habamax"
local colorscheme = "nightfly"



local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if status_ok then
   if colorscheme == "cyberdream" then
      local command = 'kitty @ set-background-image ' .. vim.fn.expand('/home/daniel/Dropbox/Wallpaper/Terminal/cyberdream_replica.png')
      vim.fn.jobstart(command, {
         on_stderr = function(_, d, _)
            if #d > 1 then
               vim.api.nvim_err_writeln("Could not change kitty background with command " .. command)
            end
         end
      })
   end
end
if not status_ok then
   vim.notify("colorscheme " .. colorscheme .. " not found, using fallback " .. colorscheme_fallback)
   vim.cmd 'colorscheme habamax'
end
