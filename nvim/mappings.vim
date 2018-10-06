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

" Map some macros to leaders for housecleaning
" nnoremap <leader>ui :Commentary<CR>A ---UNUSEDIMPORT
" vnoremap <leader>ui :Commentary<CR>gv:normal A ---UNUSEDIMPORT
" nnoremap <leader>uv :Commentary<CR>A ---UNUSEDVALUE
" nnoremap <leader>r yy:Commentary<CR>A ---REVISIONp
" vnoremap <leader>r ygv:Commentary<CR>gv:normal A ---REVISIONgv`>vvp
" nnoremap <leader>cc A ---COMMENTEDCODE
" vnoremap <leader>cc :normal A ---COMMENTEDCODE
" nnoremap <leader>i A # ---IMPORTANTIMPORT
" vnoremap <leader>i :normal A # ---IMPORTANTIMPORT
" nnoremap <leader>w A # ---WILDCARDIMPORT
" vnoremap <leader>w :normal A # ---WILDCARDIMPORT
" nnoremap <leader>dm ggO# ---DEADMODULE
" nnoremap <leader>dc A # ---DEADCLASS
" nnoremap <leader>df A # ---DEADFUNCTION
