return {
    "hrsh7th/nvim-cmp",
    event = { "BufEnter" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind.nvim",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            window = {
                completion = cmp.config.window.bordered({
                    completeopt = "menu,menuone,preview",
                    border = "rounded",
                    winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
                }),
                documentation = cmp.config.window.bordered({
                    border = "rounded",
                }),
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            formatting = {
                format = require("lspkind").cmp_format({
                    mode = 'symbol',
                    maxwidth = 50,
                    ellipsis_char = "...",
                }),
            },
            mapping = {
                ["<S-TAB>"] = cmp.mapping.select_prev_item(),
                ["<TAB>"] = cmp.mapping.select_next_item(),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                }),
            },
            sources = cmp.config.sources {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "nvim_lua" },
                { name = "path" },
                { name = "dictionary", keyword_length = 2 },
            },
        })

        -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })
        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
        })

        cmp.event:on("confirm_done", function()
            require("nvim-autopairs.completion.cmp").on_confirm_done()
        end)
    end,
}
