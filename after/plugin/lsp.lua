local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"python",
	"sumneko_lua",
	"rust_analyzer",
})

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings


