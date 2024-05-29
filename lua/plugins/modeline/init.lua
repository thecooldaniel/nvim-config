return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			-- require'lualine'.setup()
			require'plugins.modeline.eval_lualine'	
		end
	}
}
