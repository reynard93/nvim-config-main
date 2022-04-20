if vim.g.vscode then
	return
end

pcall(require, "impatient")

-- installs packer if needed
if require("first_load")() then
	return
end

vim.g.mapleader = " "

require("plugins")
require("keymaps")
require("settings")
require("autocmds")
