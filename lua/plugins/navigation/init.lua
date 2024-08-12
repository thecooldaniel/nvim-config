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
      require('which-key').add {
        { "<leader>c", group = "[C]ode" },
        { "<leader>c_", hidden = true },
        { "<leader>d", group = "[D]ocument" },
        { "<leader>d_", hidden = true },
        { "<leader>h", group = "Git [H]unk" },
        { "<leader>h_", hidden = true },
        { "<leader>l", group = "[L]anguage" },
        { "<leader>l_", hidden = true },
        { "<leader>r", group = "[R]ename" },
        { "<leader>r_", hidden = true },
        { "<leader>s", group = "[S]earch" },
        { "<leader>s_", hidden = true },
        { "<leader>t", group = "[T]abs" },
        { "<leader>t_", hidden = true },
        { "<leader>w", group = "[W]orkspace" },
        { "<leader>w_", hidden = true },
      }

      -- visual mode
      require('which-key').add({
        { "<leader>h", desc = "Git [H]unk", mode = "v" },
      })

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
      local fills = {
        fill = { fg='#ffffff', bg='#000000'},
        fill_bg = {bg='#000000', fg='#3f3f3f'},
        fill_fg = {bg='#000000', fg='#ffffff'}
      }
      local theme = {
        fill = fills.fill,
        -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
        head = fills.fill_fg,
        current_tab = fills.fill_fg,
        tab = fills.fill_bg,
        win = fills.fill_fg,
        tail = fills.fill_fg,
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
                tab.is_current() and '' or ' ',
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
                win.is_current() and '' or ' ',
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

