vim.g.mapleader = " "

-- netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore)

-- remap macro recording
vim.keymap.set("n", "<C-q>", "q")
vim.keymap.set("n", "q", "<NOP>")

-- code folding
local function set_fold_level(fold)
	return function()
		vim.opt.foldlevel = fold
	end
end
vim.keymap.set("n", "<leader>a", vim.cmd.foldopen)
vim.keymap.set("n", "<leader>A", set_fold_level(9))
vim.keymap.set("n", "<leader>q", vim.cmd.foldclose)
vim.keymap.set("n", "<leader>Q", set_fold_level(0))

-- new tab
vim.keymap.set("n", "<leader>t", vim.cmd.tabnew)

-- fast tab switch
local function jump_to_tab(tab)
	return function()
		vim.cmd.tabnext(tab)
	end
end
vim.keymap.set("n", "<leader>1", jump_to_tab(1))
vim.keymap.set("n", "<leader>2", jump_to_tab(2))
vim.keymap.set("n", "<leader>3", jump_to_tab(3))
vim.keymap.set("n", "<leader>4", jump_to_tab(4))
vim.keymap.set("n", "<leader>5", jump_to_tab(5))
vim.keymap.set("n", "<leader>6", jump_to_tab(6))
vim.keymap.set("n", "<leader>7", jump_to_tab(7))
vim.keymap.set("n", "<leader>8", jump_to_tab(8))
vim.keymap.set("n", "<leader>9", jump_to_tab(9))

-- set undo points
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ":", ":<c-g>u")
vim.keymap.set("i", "[", "[<c-g>u")
vim.keymap.set("i", "]", "]<c-g>u")
vim.keymap.set("i", "{", "{<c-g>u")
vim.keymap.set("i", "}", "}<c-g>u")
vim.keymap.set("i", "'", "'<c-g>u")
vim.keymap.set("i", '"', '"<c-g>u')
