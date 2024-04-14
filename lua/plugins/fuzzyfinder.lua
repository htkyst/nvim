return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
		-- {
		--     'prochri/telescope-all-recent.nvim',
		--     dependencies = {
		--         "nvim-telescope/telescope.nvim",
		--         "kkharji/sqlite.lua",
		--         -- optional, if using telescope for vim.ui.select
		--         "stevearc/dressing.nvim"
		--     },
		--     opts = {
		--         -- your config goes here
		--     },
		-- },
		"rcarriga/nvim-notify",
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-h>"] = "which_key",
						["<ESC>"] = require("telescope.actions").close,
					},
					n = {
						["<C-h>"] = "which_key",
					},
				},
				winblend = 20,
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})
		telescope.load_extension("fzf")
		telescope.load_extension("notify")

		local builtin = require("telescope.builtin")
		local themes = require("telescope.themes")

		vim.keymap.set("n", "<leader>ff", builtin.find_files)
		vim.keymap.set("n", "<leader>fg", builtin.live_grep)
		vim.keymap.set("n", "<leader>fb", builtin.buffers)
		vim.keymap.set("n", "<leader>fh", function()
			builtin.help_tags(themes.get_ivy())
		end)
		vim.keymap.set("n", "<leader>fn", function()
			telescope.extensions.notify.notify()
		end)
	end,
}
