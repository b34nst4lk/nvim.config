vim.opt.guicursor = ""

vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.foldlevel = 9

-- clean trailing spaces
function RemoveTrailingSpaces()
	local view = vim.fn.winsaveview()
	vim.api.nvim_exec([[:%s/\s\+$//e]], false)
	vim.fn.winrestview(view)
end
local on_buf_write_post = vim.api.nvim_create_augroup("RemoveTrailingSpace", { clear = true })
vim.api.nvim_create_autocmd(
	"BufWritePost",
	{ pattern = "*", command = "silent lua RemoveTrailingSpaces()", group = on_buf_write_post }
)
