vim.loader.enable()

require("core.option")
require("core.global")
require("core.lazy")

-- Color scheme
vim.cmd("colorscheme onenord")

-- Load plugins
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("core.autocmd")
		require("core.keymap")
		require("core.terminal")
	end,
})
