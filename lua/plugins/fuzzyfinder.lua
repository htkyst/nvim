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
		"rcarriga/nvim-notify",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local themes = require("telescope.themes")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<ESC>"] = actions.close,
					},
					n = {},
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

		-- Keymap
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
