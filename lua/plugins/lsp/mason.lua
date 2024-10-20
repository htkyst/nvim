return {
	{
		"williamboman/mason.nvim",
		event = "UIEnter",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
					check_outdated_packages_on_open = false,
				},
			})
		end,
	},
}
