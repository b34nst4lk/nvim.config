local function short_mode()
    return vim.api.nvim_get_mode()["mode"]:upper()
end

local options = {
    theme = "rose-pine",
    section_separators = "",
    components_separators = "",
    11
}

local sections = {
    lualine_a = {short_mode}
}

require("lualine").setup({
    options = options,
    sections = sections,
})
