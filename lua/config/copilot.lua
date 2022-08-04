local M = {}

M.setup = function()
	-- vim.api.nvim_set_keymap("n", "<C-=>", [[copilot#Accept("\<CR>")]], { silent = true, script = true, expr = true })
	-- vim.api.nvim_set_keymap("i", "<C-=>", [[copilot#Accept("\<CR>")]], { silent = true, script = true, expr = true })

	vim.g.copilot_filetypes = {
		["*"] = false,
		-- ["markdown"] = true,
		bash = true,
		c = true,
		cpp = true,
		go = true,
		html = true,
		javascript = true,
		javascriptreact = true,
		lua = true,
		python = true,
		rust = true,
		sh = true,
		terraform = true,
		typescript = true,
		typescriptreact = true,
	}

	vim.cmd([[
      imap <silent><script><expr> <C-j> copilot#Accept("\<CR>")
      let g:copilot_no_tab_map = v:true
    ]])
end

return M
