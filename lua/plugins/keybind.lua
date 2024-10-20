return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		notify = false,
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer local keymaps (which-key)",
		},
	},
}