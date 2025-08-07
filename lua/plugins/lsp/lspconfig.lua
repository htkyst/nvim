return {
	{
		"williamboman/mason-lspconfig.nvim",
		version = "^1.0.0",
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "simrat39/rust-tools.nvim", ft = "rs" },
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")

			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"clangd",
					"csharp_ls",
					"html", -- html-lsp
					"cssls", -- css-lsp
					"ts_ls", -- typescript-language-server
					"pyright",
				},
			})

			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,

				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						settings = {
							Lua = {
								runtime = {
									version = "LuaJIT",
								},
								workspace = {
									checkThirdParty = false,
									library = {
										vim.env.VIMRUNTIME,
									},
								},
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
						capabilities = capabilities,
					})
				end,

				["rust_analyzer"] = function()
					lspconfig.rust_analyzer.setup({
						capabilities = capabilities,
					})
					require("rust-tools").setup({})
				end,

				["clangd"] = function()
					lspconfig.clangd.setup({
						capabilities = capabilities,
					})
				end,

				["csharp_ls"] = function()
					lspconfig.csharp_ls.setup({
						capabilities = capabilities,
					})
				end,

				["html"] = function()
					lspconfig.html.setup({
						capabilities = capabilities,
					})
				end,

				["cssls"] = function()
					lspconfig.cssls.setup({
						capabilities = capabilities,
					})
				end,

				["ts_ls"] = function()
					lspconfig.ts_ls.setup({
						capabilities = capabilities,
					})
				end,

				["pyright"] = function()
					lspconfig.pyright.setup({
						capabilities = capabilities,
					})
				end,
			})
		end,
	},
}
