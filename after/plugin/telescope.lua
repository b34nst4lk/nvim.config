local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>p", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>F", function()
	builtin.grep_string({
		search = vim.fn.input("Grep > "),
	})
end)
vim.keymap.set("n", "<leader>f", builtin.grep_string, {})
vim.keymap.set("n", "<leader>t", function()
	vim.cmd.tabnew()
	builtin.find_files()
end, {})
