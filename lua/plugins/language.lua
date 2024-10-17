return {
	{
		-- Need: TSInstall html
		"windwp/nvim-ts-autotag",
		ft = { "html" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	{
		-- Color highlighter
		-- Need: TSInstall css, html, etc
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
		config = function()
			require("colorizer").setup()
		end,
	},
}
