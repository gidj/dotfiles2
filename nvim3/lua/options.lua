vim.cmd("set completeopt=menuone,noselect")

vim.g.do_filetype_lua = 1
-- disable filetype.vim
vim.g.did_load_filetypes = 0

vim.cmd("runtime macros/sandwich/keymap/surround.vim")

vim.cmd("set clipboard=unnamed")

-- " Use the same symbols as TextMate for tabstops and EOLs
-- vim.cmd("set listchars=tab:▸\ ,eol:¬")
-- ""Invisible character colors
vim.cmd("highlight NonText guifg=#4a4a59")
vim.cmd("highlight SpecialKey guifg=#4a4a59")

vim.cmd("set modeline")
vim.cmd("set undofile")

--[[ if has("persistent_undo")
  set undodir=~/.local/tmp/undodir/
  set undofile
endif ]]

 -- " Vertical split to the right
vim.cmd("set splitright")
-- " Horizontal split below
vim.cmd("set splitbelow")

 -- " Hightlight search items
vim.cmd("set hlsearch")
vim.cmd("set showmatch")

-- " Activate line numbering on the left side of the screen
vim.cmd("set number")
vim.cmd("highlight LineNr ctermfg=DarkGrey")

-- " Turn on highlighting of active line:
vim.cmd("set cursorline ")

 -- " Turn on mouse mode, for terminals that can use it
vim.cmd("set mouse=a")

vim.cmd("set termguicolors")
vim.cmd("set background=dark") -- " Set the background

vim.cmd("colorscheme tokyonight-night")

vim.cmd("set ts=4 sts=4 sw=4 et")
