-- ターミナルモードの設定
vim.api.nvim_create_augroup('Terminal', { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
    group = 'Terminal',
    command = "startinsert",
})
vim.api.nvim_create_autocmd("TermOpen", {
    group = 'Terminal',
    command = "setlocal nonumber",
})
vim.api.nvim_create_autocmd("TermOpen", {
    group = 'Terminal',
    command = "setlocal norelativenumber",
})

