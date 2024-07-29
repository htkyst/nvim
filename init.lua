vim.loader.enable()

-- Common settings
require("core.global")
require("core.option")

if vim.g.vscode == nil then
	require("core.lazy")
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
