vim.opt.relativenumber = true
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.number = true
vim.opt.showcmd = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wildmenu = true
vim.opt.smartindent = true
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.hidden = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.wrap = false
vim.opt.undofile = false
vim.opt.swapfile = false
vim.opt.pumblend = 10
vim.opt.termguicolors = true
vim.opt.modifiable = true
vim.opt.showmode = false

vim.opt.shell = 'pwsh.exe'

vim.api.nvim_set_option('scrolloff', 4)
vim.api.nvim_set_option('inccommand', 'split')
vim.api.nvim_set_option('clipboard', 'unnamedplus')

vim.api.nvim_win_set_option(0, 'winblend', 20)

vim.api.nvim_set_var('sqlite_clib_path', 'sqlite/sqlite3.dll')
