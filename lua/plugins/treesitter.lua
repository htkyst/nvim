return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "UIEnter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "lua", "vim", "vimdoc" },
				sync_install = false,
				auto_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				autotag = {
					enable = true,
				},
			})
		end,
	},
}
