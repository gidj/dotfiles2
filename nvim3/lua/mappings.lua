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
map("n", "<leader>ev", ":e $MYVIMRC<CR>", {silent=true})
map("n", "<leader>sv", ":so $MYVIMRC<CR>", {silent=true})

-- " Let space bar toggle folding on and off.
--
map("n", "<Space>", "za")
-- " Allow repeat in visual mode
map("n", ".", ":norm.<CR>")

-- " Preserve indentation while pasting text from the OS X clipboard
map("n", "<leader>p", ":set paste<CR>:put  *<CR>:set nopaste<CR>")

-- " Tab goes switches between matched surrounding tokens
map("n", "<tab>", "%")
map("v", "<tab>", "%")

-- " Clear search
map("n", "<leader>,", ":noh<cr>")

