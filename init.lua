vim.loader.enable()

require("core.global")
require("core.option")
require("core.lazy")

if vim.g.vscode == nil then
	-- Color scheme
	vim.cmd("colorscheme tokyonight")
end

-- Load plugins
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("core.autocmd")
		require("core.keymap")
	end,
})
