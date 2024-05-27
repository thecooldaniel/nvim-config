return {
	{
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup({
				terminal_background = true,
				filter = "octagon"
			})

			-- vim.cmd 'colorscheme monokai-pro'
		end
	},
	{
		"craftzdog/solarized-osaka.nvim",
		-- lazy = false,
		-- priority = 1000,
		opts = {},
		config = function()
			require('solarized-osaka').setup({
				terminal_colors = true,
			})
			-- vim.cmd 'colorscheme solarized-osaka'
		end
	}, 
	{
		"oxfist/night-owl.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			require("night-owl").setup()
			vim.cmd.colorscheme("night-owl")
		end,
	},
}
