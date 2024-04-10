-- Key mappings
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', { silent = true })                           -- ESCキーでターミナルモードからノーマルモードに移行
vim.keymap.set('n', 'tt', '<cmd>belowright new<CR><cmd>terminal<CR>', { silent = true }) -- ttで下分割でターミナルを起動
vim.keymap.set('n', 'bn', ':bn<CR>', { silent = true })                                  -- bnで次のバッファへ移動
vim.keymap.set('n', 'bp', ':bp<CR>', { silent = true })                                  -- bpで前のバッファへ移動

-- Leader + h/j/k/l でペイン移動
vim.keymap.set('n', '<leader>h', '<C-w>h', { silent = true })
vim.keymap.set('n', '<leader>j', '<C-w>j', { silent = true })
vim.keymap.set('n', '<leader>k', '<C-w>k', { silent = true })
vim.keymap.set('n', '<leader>l', '<C-w>l', { silent = true })

-- Lsp診断情報の表示
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
