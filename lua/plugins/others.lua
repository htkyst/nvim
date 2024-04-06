return {

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	{
		"karb94/neoscroll.nvim",
		config = true,
	},

	{
		"petertriho/nvim-scrollbar",
		config = true,
	},

	{
		-- TODO: setting
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("hlslens").setup()

			-- local kopts = { noremap = true, silent = true }
			-- vim.api.nvim_set_keymap('n', 'n',
			--     [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
			--     kopts)
			-- vim.api.nvim_set_keymap('n', 'N',
			--     [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
			--     kopts)
			-- vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
			-- vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
			-- vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
			-- vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
			--
			-- vim.api.nvim_set_keymap('n', '<C-h>', '<Cmd>noh<CR>', kopts)
		end,
	},

	{
		-- Rust tools
		"simrat39/rust-tools.nvim",
		ft = "rs",
	},

	{
		-- 日本語入力のままInsert modeに移行する
		"pepo-le/win-ime-con.nvim",
		event = "VeryLazy",
	},

	{
		-- UI component Library for Neovim
		"MunifTanjim/nui.nvim",
	},
}
