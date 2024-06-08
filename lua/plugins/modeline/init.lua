return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
          -- require'plugins.modeline.eval_lualine'
      local lualine_config = require('lualine').get_config()
      lualine_config.options.theme = require'lualine.themes.nightfly'
      lualine_config.options.theme.inactive = lualine_config.options.theme.normal

      lualine_config.sections.lualine_c = {
        {
          '%-01.4n', -- 0: remove leading 0s, 1: minwidth, 4: maxwidth, n: buffer number
        },
        {'filename', path = 4,},
        {-- Lsp server name .
          function()
            local msg = 'No Active Lsp'
            local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
            local clients = vim.lsp.get_active_clients()
            if next(clients) == nil then
              return msg
            end
            for _, client in ipairs(clients) do
              local filetypes = client.config.filetypes
              if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
              end
            end
            return msg
          end,
          icon = 'LSP:',
          -- color = { fg = '#ffffff', gui = 'bold' },
        },
      }
      table.insert(lualine_config.options, "component_separators")
      table.insert(lualine_config.options, "section_separators")
      table.insert(lualine_config, "inactive_sections" )
      local component_separators = ''
      local section_separators = ''
      local inactive_sections = lualine_config.sections
      lualine_config.options.component_separators = component_separators
      lualine_config.options.section_separators = section_separators
      lualine_config.inactive_sections = inactive_sections


      require'lualine'.setup(lualine_config)
    end
  }
}
