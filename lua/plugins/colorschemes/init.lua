return {
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      local setup = {
        terminal_background = true,
        filter = "spectrum"
      }
      -- require("monokai-pro").setup(setup)
      -- vim.cmd 'colorscheme monokai-pro'
    end
  },
  {
    "craftzdog/solarized-osaka.nvim",
    -- lazy = false,
    -- priority = 1000,
    opts = {},
    config = function()
      local setup = {
        terminal_colors = true,
      }
      -- require('solarized-osaka').setup(setup)
      -- vim.cmd 'colorscheme solarized-osaka'
    end
  },
  {
    "oxfist/night-owl.nvim",
    -- lazy = false, -- make sure we load this during startup if it is your main colorscheme
    -- priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      -- require("night-owl").setup()
      -- vim.cmd.colorscheme("night-owl")
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    config = function()
      -- require('kanagawa').setup()
      -- vim.cmd.colorscheme('kanagawa-wave')
    end,
  },
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    -- lazy = false,
    -- priority = 1000,
    config = function()
      vim.g.nightflyCursorColor = true
      vim.g.nightflyNormalFloat = true
      vim.g.nightflyTerminalColors = true
      vim.g.nightflyUnderlineMatchParen = true
      vim.g.nightflyWinSeparator = 2
      vim.opt.fillchars = { horiz = '━', horizup = '┻', horizdown = '┳', vert = '┃', vertleft = '┫', vertright = '┣', verthoriz = '╋', }
    end
  },
  {
    "folke/tokyonight.nvim",
    -- lazy = false,
    -- priority = 1000,
    opts = {
      style = 'night'
    },
  },
  {
    'Mofiqul/vscode.nvim'
  }
}
