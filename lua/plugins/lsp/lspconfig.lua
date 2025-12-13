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
			local mason_lspconfig = require("mason-lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"clangd",
				-- "csharp_ls",
				-- "html", -- html-lsp
				-- "cssls", -- css-lsp
				-- "ts_ls", -- typescript-language-server
				-- "pyright",
			}

			mason_lspconfig.setup({
				automatic_installation = true,
				ensure_installed = ensure_installed,
			})

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			-- lua_ls
			vim.lsp.config("lua_ls", {
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
			})

			-- rust_analyzer
			vim.lsp.config("rust_analyzer", {
				require("rust-tools").setup({}),
			})

			vim.lsp.enable(ensure_installed)
		end,
	},
}
