"------------------ Vundle -------------------
set nocompatible
filetype off  " Required for Vundle to operate correctly

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"let Vundle manage Vundle
"required! 
Bundle 'gmarik/vundle'

"My Bundles here:
"original repos on github

Bundle 'tomasr/molokai'
Bundle 'SirVer/ultisnips'
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'scrooloose/syntastic'
"Bundle 'derekwyatt/vim-scala'
Bundle 'jpalardy/vim-slime'

"---------------- End Vundle ----------------

syntax on
filetype plugin indent on

set backspace=indent,eol,start
set modeline
set tabstop=4 expandtab shiftwidth=4 softtabstop=4

" Activate line numbering on the left side of the screen
set number
highlight LineNr ctermfg=DarkGrey

" Activate persistent status line:
set laststatus=2
"set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

"Set the theme, and background. 
set background=dark
colorscheme molokai

"Turn on highlighting of active line:
set cursorline

" Turn on mouse mode, for terminals that can use it:
set mouse=a

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

"--------------- Syntastic ------------------
"let g:syntastic_python_checkers=['pylint']
"let g:syntastic_check_on_open = 1

"Bloc for filetype-specific options and formatting
if has("autocmd")
    "Options for C files
    autocmd Filetype c setlocal foldmethod=syntax ts=2 sts=2 sw=2 expandtab
    "Options for C header files
    autocmd Filetype h setlocal foldmethod=syntax ts=2 sts=2 sw=2 expandtab

endif 

"------------ Key remappings ---------------
"
"This makes the space bar toggle folding on and off.
noremap <Space> za 

"----------------- YouCompleteMe --------------
"let g:ycm_confirm_extra_conf = 0
"This makes YouCompleteMe and UltiSnips work together well
"let g:UltiSnipsExpandTrigger="<c-j>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"------------- vim slime -------------------
let g:slime_target = "tmux"
