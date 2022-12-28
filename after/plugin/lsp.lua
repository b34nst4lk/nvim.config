local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"pyright",
	"sumneko_lua",
	"rust_analyzer",
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.on_attach(function(client, bufnr)
	local opts = {
		buffer = bufnr,
		remap = false,
	}
	-- vim.keymap.set("n", "<C-o>", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lsp.setup()

vim.diagnostic.config({ virtual_text = false })
