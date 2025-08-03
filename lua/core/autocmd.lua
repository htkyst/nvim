-- Highlight when yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("hightlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 1000 }) -- 1sec
	end,
})

-- Exit help window with 'q' key
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("close_help_q", { clear = true }),
	pattern = {
		"qf",
		"help",
		"man",
		"lspinfo",
		"checkhealth",
		"startuptime",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
	end,
})

-- Save cursor position when close file
vim.api.nvim_create_autocmd("BufWinLeave", {
	group = vim.api.nvim_create_augroup("save_cursor_position", { clear = true }),
	pattern = "*",
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		local pos = vim.api.nvim_win_get_cursor(0)
		vim.api.nvim_buf_set_var(buf, "last_cursor_pos", pos)
	end,
})

-- Restore cursor position when open file
vim.api.nvim_create_autocmd("BufReadPost", {
	group = vim.api.nvim_create_augroup("restore_cursor_position", { clear = true }),
	pattern = "*",
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		local has_pos, pos = pcall(vim.api.nvim_buf_get_var, buf, "last_cursor_pos")
		if has_pos and pos[1] <= vim.api.nvim_buf_line_count(buf) then
			vim.api.nvim_win_set_cursor(0, pos)
		end
	end,
})

-- Not create undo file if under the tmp folder
vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("do_not_create_undo", { clear = true }),
	pattern = { "/tmp/*" },
	command = "setlocal noundofile",
})

-- Auto create directory if not
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
	callback = function(event)
		if event.match:match("^%w%w+://") then
			return
		end
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

-- Disable comment out when new line
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	group = vim.api.nvim_create_augroup("disable_comment", { clear = true }),
	callback = function()
		vim.opt_local.formatoptions:remove({ "r", "o" })
		vim.opt_local.formatoptions:append({ "M", "j" })
	end,
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Lsp診断情報の表示
		vim.keymap.set("n", "ge", vim.diagnostic.open_float)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
		vim.keymap.set("n", "gq", vim.diagnostic.setloclist)

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gK", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "gwa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "gwr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "gwl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "grn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "gca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "gf", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

-- Only update context when cursorHold event
vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("nvim-navic", {}),
	callback = function()
		if vim.api.nvim_buf_line_count(0) > 10000 then
			vim.b.navic_lazy_update_context = true
		end
	end,
})

-- ターミナルモードの設定
vim.api.nvim_create_augroup("Terminal", {
	clear = true,
})
vim.api.nvim_create_autocmd("TermOpen", {
	group = "Terminal",
	command = "startinsert",
})
vim.api.nvim_create_autocmd("TermOpen", {
	group = "Terminal",
	command = "setlocal nonumber",
})
vim.api.nvim_create_autocmd("TermOpen", {
	group = "Terminal",
	command = "setlocal norelativenumber",
})
