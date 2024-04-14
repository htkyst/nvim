return {

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
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
		-- 日本語入力のままInsert modeに移行する
		"pepo-le/win-ime-con.nvim",
		event = "VeryLazy",
	},

	{
		-- UI component Library for Neovim
		"MunifTanjim/nui.nvim",
	},

	{
		-- For doxygen
		"danymat/neogen",
		event = "VeryLazy",
		version = "*",
		config = function()
			require("neogen").setup({
				enabled = true,
			})
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
