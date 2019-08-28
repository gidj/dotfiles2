" Keymapping: {{{
" }}}
let mapleader=',' " Change the leader to the comma character

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" ESC with jj
inoremap jj <ESC>

" Center search matches
nnoremap n nzz

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Let space bar toggle folding on and off.
noremap <Space> za
" Allow repeat in visual mode
vnoremap . :norm.<CR>

" Tab goes switches between matched surrounding tokens
nnoremap <tab> %
vnoremap <tab> %

" Clear search
nnoremap <leader>, :noh<cr>

" inoremap (; (<CR>);<C-c>O
" inoremap (, (<CR>),<C-c>O
" inoremap {; {<CR>};<C-c>O
" inoremap {, {<CR>},<C-c>O
" inoremap [; [<CR>];<C-c>O
" inoremap [, [<CR>],<C-c>O
