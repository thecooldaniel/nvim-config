return {
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  -- align text
  { 'echasnovski/mini.align',
    version = '*',
    config = function()
      require('mini.align').setup()
    end
  },
  -- Detect tabstop/shiftwidth automatically
  'tpope/vim-sleuth',
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  -- { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  { 'mg979/vim-visual-multi', branch = 'master'},
  { 'tpope/vim-surround' },
  -- {
  --   'Bekaboo/dropbar.nvim',
  --   -- optional, but required for fuzzy finder support
  --   dependencies = {
  --     'nvim-telescope/telescope-fzf-native.nvim'
  --   }
  -- },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
  -- {
  --   'kevinhwang91/nvim-ufo', 
  --   dependencies = 'kevinhwang91/promise-async',
  --   init = function()
  --       vim.o.foldcolumn = '0' -- '0' is not bad
  --       vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
  --       vim.o.foldlevelstart = 99
  --       vim.o.foldenable = true
  --   end,
  --   config = function()
  --     require'ufo'.setup{
  --       provider_selector = function(bufnr, filetype, buftype)
  --         return {'treesitter', 'indent'}
  --       end
  --     }
  --   end
  -- }
}
