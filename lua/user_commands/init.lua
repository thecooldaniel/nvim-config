vim.api.nvim_create_user_command('MoveFile', function(opts)
    local oldpath = vim.fn.expand('%:p')
    vim.cmd('saveas ' .. opts.args)
    vim.fn.delete(oldpath)
    print("File moved from " .. oldpath .. " to " .. opts.args)
end, {nargs = 1, complete = 'file'})
