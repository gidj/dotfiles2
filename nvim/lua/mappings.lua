-- Functional wrapper for mapping custom keybindings
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ","
-- let mapleader=',' -- " Change the leader to the comma character

-- " ESC with jj
map("i", "jj", "<ESC>")

-- " Center search matches
map("n", "n", "nzz")

-- " Quickly edit/reload the vimrc file
map("n", "<leader>ev", ":e $MYVIMRC<CR>", { silent = true })
map("n", "<leader>sv", ":so $MYVIMRC<CR>", { silent = true })

-- " Let space bar toggle folding on and off.
--
map("n", "<Space>", "za")
-- " Allow repeat in visual mode
map("v", ".", ":norm.<CR>")

-- " Preserve indentation while pasting text from the OS X clipboard
map("n", "<leader>p", ":set paste<CR>:put  *<CR>:set nopaste<CR>")

map('n', '<leader>f', '<cmd>lua vim.lsp.buf.format {async = true}<CR>')
-- " Tab goes switches between matched surrounding tokens
map("n", "<tab>", "%")
map("v", "<tab>", "%")

-- " Clear search
map("n", "<leader>,", ":noh<cr>")

map("n", ";f", "<cmd>Telescope find_files<cr>", { silent = true })
map("n", "//", "<cmd>Telescope git_files<cr>", { silent = true })
map("n", ",gr", "<cmd>Telescope lsp_references<cr>", { silent = true })
map("n", ";r", "<cmd>Telescope live_grep<cr>", { silent = true })
map("n", "\\\\", "<cmd>Telescope buffers<cr>", { silent = true })
map("n", ";;", "<cmd>Telescope help_tags<cr>", { silent = true })
--
-- Show diagnostics in a floating window
map('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

-- Move to the previous diagnostic
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

-- Move to the next diagnostic
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
