return {
  {
    -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter',
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup(
        {
          icons = {separator = ":"}
        })

      -- Document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
        ['<leader>t'] = { name = '[T]abs', _ = 'which_key_ignore' },
        ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
        ['<leader>l'] = { name = '[L]anguage', _ = 'which_key_ignore'},
      }
      -- visual mode
      require('which-key').register({
        ['<leader>h'] = { 'Git [H]unk' },
      }, { mode = 'v' })

    end,
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
       "nvim-telescope/telescope-file-browser.nvim",
      "debugloop/telescope-undo.nvim",
    },
    config = function()

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>fd', function() require("telescope").extensions.file_browser.file_browser() end, {})
      vim.keymap.set('n', '<leader>fu', "<cmd>Telescope undo<cr>")
      vim.keymap.set('n', '<leader>wc', function() builtin.colorscheme({enable_preview = true}) end, {})
      vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
      vim.keymap.set('n', '<leader>bf', builtin.current_buffer_fuzzy_find, {})

      require'telescope'.setup({
        defaults = require'telescope.themes'.get_ivy {
          mappings = {
            n = {['<C-d>'] = require('telescope.actions').delete_buffer},
            i = {['<C-d>'] = require('telescope.actions').delete_buffer}
          },
          -- pickers = {
          --   buffers = {
          --     mappings = {
          --       i = { ["<C-d>"] = "delete_buffer" }
          --     }
          --   },
          -- },

          extensions = {
            ["ui-select"] = { require'telescope.themes'.get_dropdown() },
            fzf = {
              fuzzy = true,                    -- false will only do exact matching
              override_generic_sorter = true,  -- override the generic sorter
              override_file_sorter = true,     -- override the file sorter
              case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
              -- the default case_mode is "smart_case"
            },
            undo = {
              side_by_side = true,
              layout_strategy = "vertical",
              layout_config = {
                preview_height = 0.8,
              },
            },
            file_browser = {
              hijack_netrw = true,
              theme = "ivy"
            },
          }
        }
      })

      require'telescope'.load_extension'ui-select'
      require'telescope'.load_extension'undo'
    end
  },
  {
    'Shatur/neovim-session-manager',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
      -- local Path = require('plenary.path')
      -- local config = require('session_manager.config')
      -- require('session_manager').setup()
    end
  },
  -- {
  --   'akinsho/bufferline.nvim',
  --   version = "*",
  --   dependencies = 'nvim-tree/nvim-web-devicons',
  --   config = function()
  --     require("bufferline").setup{
  --       options = {
  --         -- separator_style = 'slant',
  --         mode = 'tabs',
  --       }
  --     }
  --   end,
  -- },
  {
    'nanozuki/tabby.nvim',
    -- event = 'VimEnter', -- if you want lazy load, see below
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      local theme = {
        fill = 'TabLineFill',
        -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
        head = 'TabLine',
        current_tab = 'TabLineSel',
        tab = 'TabLine',
        win = 'TabLine',
        tail = 'TabLine',
      }
      require('tabby').setup({
        line = function(line)
          return {
            {
              { '  ', hl = theme.head },
              line.sep(' ', theme.head, theme.fill),
            },
            line.tabs().foreach(function(tab)
              local hl = tab.is_current() and theme.current_tab or theme.tab
              return {
                line.sep(' ', hl, theme.fill),
                tab.is_current() and '' or ' ',
                tab.number(),
                tab.name(),
                tab.close_btn(''),
                line.sep(' ', hl, theme.fill),
                hl = hl,
                margin = ' ',
              }
            end),
            line.spacer(),
            line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
              return {
                line.sep(' ', theme.win, theme.fill),
                win.is_current() and '' or ' ',
                win.buf_name(),
                line.sep(' ', theme.win, theme.fill),
                hl = theme.win,
                margin = ' ',
              }
            end),
            {
              line.sep(' ', theme.tail, theme.fill),
              { '  ', hl = theme.tail },
            },
            hl = theme.fill,
          }
        end,
        -- option = {}, -- setup modules' option,
      })
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  }
}

