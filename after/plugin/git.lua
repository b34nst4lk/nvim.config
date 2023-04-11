-- Fugitive set up
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- Git Blame virtual text toggle
vim.keymap.set("n", "<leader>gh", ":GitBlameOpenCommitURL<CR>", {})


-- git signs set up
require('gitsigns').setup({
  current_line_blame = false,
  current_line_blame_opts = {
    delay = 10,
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Git blame
    map("n", "<C-g>", gs.toggle_current_line_blame)

    -- Toggle deleted chunks
    map("n", "[]", gs.toggle_deleted)
  end
})
