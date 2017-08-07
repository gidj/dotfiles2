" -- vim-plug  --------------------------------------------------------------
" Use vim-plug to manage plugins
call plug#begin('~/.config/nvim/plugged')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make sure neovim doesn't use the virtualenv
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("nvim")
    if filereadable(expand('~/.virtualenvs/neovim/bin/python'))
        let g:python_host_prog = expand('~/.virtualenvs/neovim/bin/python')
    elseif filereadable('/usr/local/bin/python2')
        let g:python_host_prog = '/usr/local/bin/python'
    elseif filereadable('/usr/bin/python')
        let g:python_host_prog = '/usr/bin/python'
    else
        echom "WARNING: no valid python2 install found"
    endif

    if filereadable(expand('~/.virtualenvs/neovim3/bin/python'))
        let g:python3_host_prog = expand('~/.virtualenvs/neovim3/bin/python')
    elseif filereadable('/usr/local/bin/python3')
        let g:python3_host_prog = '/usr/local/bin/python3'
    elseif filereadable('/usr/bin/python3')
        let g:python3_host_prog = '/usr/bin/python3'
    else
        echom "WARNING: no valid python3 install found"
    endif
endif

" Recommended to install
Plug 'Shougo/vimproc', { 'do': 'make' }

" My Plugins

" Themes
Plug 'morhetz/gruvbox'
Plug 'gidj/vim-vimbrant'
" Plug 'w0ng/vim-hybrid'
" Plug 'jacoborus/tender.vim'
" Plug 'mhartington/oceanic-next'
" Plug 'jdkanani/vim-material-theme'
" Plug 'tomasr/molokai'
" Plug 'whatyouhide/vim-gotham'
" Plug 'chriskempson/base16-vim'
" Plug 'effkay/argonaut.vim'
" Plug 'mkarmona/colorsbox'
" Plug 'notpratheek/vim-luna'
" Plug 'tyrannicaltoucan/vim-quantum'
" Plug 'ayu-theme/ayu-vim'

" Indispensable Plugins
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi'
" Plug 'neomake/neomake'
" Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --tern-completer' }
" Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sjl/gundo.vim'
Plug 'majutsushi/tagbar'
Plug 'epeli/slimux'
Plug 'rking/ag.vim'
Plug 'bling/vim-airline'
" Plug 'benekastah/neomake'

" Useful plugins from Tim Pope
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sensible'
" Plug 'tpope/vim-fireplace'

" Python Plugins
" Plug 'pfdevilliers/Pretty-Vim-Python'
Plug 'jmcantrell/vim-virtualenv'
" Plug 'hdima/python-syntax'
Plug 'vim-python/python-syntax'

" Haskell Plugins
Plug 'dag/vim2hs'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'

" Javascript Plugins
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim' " For all JS libraries
Plug 'mxw/vim-jsx' " For ReactJS

" Ruby Plugins
" Plug 'vim-ruby/vim-ruby' " Doesn't work with Neovim yet

" Version control related
Plug 'mhinz/vim-signify'
" Plug 'ludovicchabant/vim-lawrencium'

" Various Language Plugings
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'ap/vim-css-color'
Plug 'othree/html5.vim'
Plug 'nathanaelkane/vim-indent-guides'
" Plug 'mattn/emmet-vim'
" Plug 'Keithbsmiley/swift.vim'
" Plug 'jiangmiao/auto-pairs'
" Plug 'gidj/vim-csyn'
" Plug 'marijnh/tern_for_vim'

" All of your Plugins must be added before the following line
call plug#end()            " required
"-- End vim-plug   --------------------------------------------------------

"-- Filetype Options ----------------------------------------------------
syntax on
filetype on
filetype plugin on
filetype indent on
" let mapleader="," " Change the leader to the comma character

" Function to strip whitespaces on write, while retaining position in the file
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

nnoremap n nzz

if has("autocmd")
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
    " Javascript, JSX
    autocmd FileType javascript.jsx set ts=4 sts=4 sw=4 et
    " Python files
    autocmd Filetype python setlocal ts=4 sts=4 sw=4 et
    " C files
    autocmd Filetype c,h setlocal foldmethod=syntax ts=2 sts=2 sw=2 expandtab
    " make files
    autocmd FileType make setlocal noexpandtab
    " Scheme- and Lisp-style files
    autocmd Filetype lisp,scheme setlocal lisp "foldmethod=syntax
    " Ruby
    autocmd FileType ruby,eruby setlocal ts=2 sts=2 sw=2 expandtab
    " Haskell
    autocmd Filetype haskell setlocal omnifunc=necoghc#omnifunc foldlevelstart=20
    " autocmd BufEnter *.hs compiler ghc
    " HTML files
    "autocmd Filetype html,css setlocal ts=2 sts=2 sw=2 expandtab
    " autocmd Filetype jinja setlocal syntax on

    "autocmd FileType * set tabstop=2|set shiftwidth=2|set noexpandtab
    " autocmd Filetype python set foldmethod=indent
endif
"-- End Filetype Options ------------------------------------------------


let g:airline#extensions#ale#enabled = 1

" let g:ale_python_flake8_executable = '/Users/gideon/.virtualenvs/neovim/bin/python/flake8'
" let g:ale_python_pylint_executable = '/Users/gideon/.virtualenvs/neovim/bin/python/pylint'

let g:ale_python_pylint_use_global = 1

"-- Deoplete ------------------------------------------------------------
let g:deoplete#enable_at_startup = 1
" Create comnifunc hash
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.java = '[^. *\t].\w*'
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.java = ['tag']

let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.ruby = '[^. *\t].\w*'

" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" let g:python_host_prog = '/Users/gideon/.virtualenvs/neovim/bin/python'
" let g:python3_host_prog = '/Users/gideon/.virtualenvs/neovim3/bin/python'
"-- End Deoplete --------------------------------------------------------

"-- EClim ---------------------------------------------------------------
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimPythonValidate = 0 " Disable validation of python files so syntastic takes over
"-- End EClim -----------------------------------------------------------

let g:airline_powerline_fonts=1
let g:airline#extensions#branch#use_vcscommand=1
let g:airline_theme='gruvbox'

let python_highlight_all = 1

" Theme settings
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

set background=dark " Set the background
let g:gruvbox_improved_warnings=1
let g:gruvbox_contrast_dark='hard'
let g:quantum_black=1
colorscheme gruvbox

set clipboard=unnamed

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set backspace=indent,eol,start  " Let backspace cross over end of line
set modeline
" set tabstop=4 expandtab shiftwidth=4 softtabstop=4 " Default to 4-space tabs, written in spaces

set splitright " Vertical split to the right
set splitbelow " Horizontal split below

set hlsearch " Hightlight search items
set incsearch " Hightlight search items as they are searched for
set showmatch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set number " Activate line numbering on the left side of the screen
highlight LineNr ctermfg=DarkGrey

" set updatetime=1000 " This has syntastic update every second instead of every two
set synmaxcol=120 " This stops syntax highlighting from trying after column 120
set cursorline " Turn on highlighting of active line:
" set relativenumber

set mouse=a " Turn on mouse mode, for terminals that can use it

set listchars=tab:▸\ ,eol:¬  " Use the same symbols as TextMate for tabstops and EOLs
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

"-- Powerline -----------------------------------------------------------
" Removes delay when exiting Insert Mode
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

set laststatus=2 " Activate persistent status line:
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
"-- End Powerline--------------------------------------------------------

"-- Suround -------------------------------------------------------------
"For Django
let b:surround_{char2nr("v")} = "{{ \r }}"
let b:surround_{char2nr("{")} = "{{ \r }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"
"-- End Suround ---------------------------------------------------------

"-- Signify -------------------------------------------------------------
let g:signify_vcs_list = ['hg', 'git']
"-- End Signify----------------------------------------------------------

"-- NeoMake -------------------------------------------------------------
let g:neomake_error_sign = { 'text': '>', }
" hi MyWarningMsg ctermbg=3 ctermfg=0
let g:neomake_warning_sign = { 'text': '⚠', }
" autocm! BufWritePost,BufEnter * Neomake
" let g:neomake_javascript_jshint_maker = {
"     \ 'args': ['--verbose'],
"     \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
"     \ }
let g:neomake_python_enabled_makers = ['pyflakes', 'pylint']
"-- End NeoMake ----------------------------------------------------------

"-- Syntastic -----------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_open=1 " Check on loading the buffer
let g:syntastic_check_on_wq=0 " Don't check on closing the buffer

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby', 'python', 'javascript', 'jinja'],
                           \ 'passive_filetypes': ['puppet', 'java'] }
let g:syntastic_c_compiler = 'clang'
let g:syntastic_c_compiler_options = '-std=c11'
let g:loaded_syntastic_c_gcc_checker = 1

let g:syntastic_enable_signs=1
"let g:syntastic_auto_jump=1
let g:syntastic_python_checkers=['pyflakes']

" let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol= '>' " 'X'  '✗'
let g:syntastic_warning_symbol='⚠'
"-- End Syntastic -------------------------------------------------------

"-- YouCompleteMe -------------------------------------------------------
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_allow_changing_updatetime = 0 " This lets the 1 second option above stand
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_server_log_level = "error"
let g:ycm_semantic_triggers = {'haskell' : ['.']}
" Recommended for Django:
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
" let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

let g:ycm_python_binary_path = 'python'
let g:ycm_server_python_interpreter = 'python'
""-- End YouCompleteMe ---------------------------------------------------

"-- Gundo Options -------------------------------------------------------
nnoremap <F5> :GundoToggle<CR>
"-- End Gundo Options ---------------------------------------------------

"-- Tabar Options -------------------------------------------------------
nnoremap <F8> :TagbarToggle<CR>
"-- End Tabar Options ---------------------------------------------------

"-- Haskellmode-Vim Options ---------------------------------------------
:let g:haddock_browser="/Applications/Google Chrome.app"
"-- End Haskellmode-Vim Options -----------------------------------------
"
"-- Keymapping ----------------------------------------------------------
" This makes the space bar toggle folding on and off.
noremap <Space> za
vnoremap . :norm.<CR>
"-- End Keymapping ------------------------------------------------------

"-- Slimux --------------------------------------------------------------
" let g:slimux_select_from_current_window=0
let g:slimux_exclude_vim_pane=0
map <C-c><C-c> :SlimuxREPLSendLine<CR>
vmap <C-c><C-c> :SlimuxREPLSendSelection<CR>
"-- End Slimux ----------------------------------------------------------

"-- CtrlP ---------------------------------------------------------------
"-- End CtrlP -----------------------------------------------------------

"" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
