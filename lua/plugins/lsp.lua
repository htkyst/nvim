
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "SmiteshP/nvim-navbuddy",
        },
    },

    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    },
                    check_outdated_packages_on_open = false,
                    border = 'single'
                }
            })
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "simrat39/rust-tools.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local mason_lspconfig = require("mason-lspconfig")

            mason_lspconfig.setup({
                ensure_installed = { "lua_ls", "rust_analyzer", "clangd" }
            })

            mason_lspconfig.setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["rust_analyzer"] = function ()
                    require("rust-tools").setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function ()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        },
                        capabilities = capabilities
                    }
                end,

                ["clangd"] = function ()
                    local lspconfig = require("lspconfig")
                    lspconfig.clangd.setup({
                        capabilities = capabilities
                    })
                end,
            })
        end,
    },

    {
        "SmiteshP/nvim-navic",
        dependencies = "neovim/nvim-lspconfig",
        config = function()
            require('nvim-navic').setup({
                icons = {
                    File          = "󰈙 ",
                    Module        = " ",
                    Namespace     = "󰌗 ",
                    Package       = " ",
                    Class         = "󰌗 ",
                    Method        = "󰆧 ",
                    Property      = " ",
                    Field         = " ",
                    Constructor   = " ",
                    Enum          = "󰕘",
                    Interface     = "󰕘",
                    Function      = "󰊕 ",
                    Variable      = "󰆧 ",
                    Constant      = "󰏿 ",
                    String        = "󰀬 ",
                    Number        = "󰎠 ",
                    Boolean       = "◩ ",
                    Array         = "󰅪 ",
                    Object        = "󰅩 ",
                    Key           = "󰌋 ",
                    Null          = "󰟢 ",
                    EnumMember    = " ",
                    Struct        = "󰌗 ",
                    Event         = " ",
                    Operator      = "󰆕 ",
                    TypeParameter = "󰊄 ",
                },
                lsp = {
                    auto_attach = true,
                },
                highlight = true,
            })
        end,
    },

    {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim",
            'numToStr/Comment.nvim',
        },
        config = function()
            require('nvim-navbuddy').setup({
                window = {
                    size = { height = '40%', width = '100%' },
                    position = { row = '96%', col = '50%' },
                },
                icons = {
                    File = ' ',
                    Module = ' ',
                    Namespace = ' ',
                    Package = ' ',
                    Class = ' ',
                    Method = ' ',
                    Property = ' ',
                    Field = ' ',
                    Constructor = ' ',
                    Enum = ' ',
                    Interface = ' ',
                    Function = ' ',
                    Variable = ' ',
                    Constant = ' ',
                    String = ' ',
                    Number = ' ',
                    Boolean = ' ',
                    Array = ' ',
                    Object = ' ',
                    Key = ' ',
                    Null = ' ',
                    EnumMember = ' ',
                    Struct = ' ',
                    Event = ' ',
                    Operator = ' ',
                    TypeParameter = ' ',
                },
                lsp = {
                    auto_attach = true,
                },
            })
        end,
    }
}

