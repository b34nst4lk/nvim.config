-- keymaps
vim.keymap.set("n", "<leader>s", 'o__import__("pdb").set_trace()<ESC>')
vim.keymap.set("n", "<leader>d", 'o__import__("devtools").debug()<ESC>i')

-- UI
vim.opt.colorcolumn = { 80, 120 }

-- On save
local function DarkerFormat()
	vim.cmd("!darker %")
end

function PythonOnWrite()
	print("hello")
	DarkerFormat()
end

local pytask_group = vim.api.nvim_create_augroup("Python", { clear = true })
vim.api.nvim_create_autocmd(
	"BufWritePost",
	{ pattern = "*.py", command = "silent lua PythonOnWrite()", group = pytask_group }
)
