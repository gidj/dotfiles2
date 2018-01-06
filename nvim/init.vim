" VimPlug: {{{
" Use vim-plug to manage plugins
call plug#begin('~/.config/nvim/plugged')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make sure neovim doesn't use the virtualenv
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
    if filereadable(expand('~/.virtualenvs/neovim/bin/python'))
        let g:python_host_prog = expand('~/.virtualenvs/neovim/bin/python')
    elseif filereadable('/usr/local/bin/python2')
        let g:python_host_prog = '/usr/local/bin/python'
    elseif filereadable('/usr/bin/python')
        let g:python_host_prog = '/usr/bin/python'
    else
        echom 'WARNING: no valid python2 install found'
    endif

    if filereadable(expand('~/.virtualenvs/neovim3/bin/python'))
        let g:python3_host_prog = expand('~/.virtualenvs/neovim3/bin/python')
    elseif filereadable('/usr/local/bin/python3')
        let g:python3_host_prog = '/usr/local/bin/python3'
    elseif filereadable('/usr/bin/python3')
        let g:python3_host_prog = '/usr/bin/python3'
    else
        echom 'WARNING: no valid python3 install found'
    endif
endif

" Recommended to install
" Plug 'Shougo/vimproc', { 'do': 'make' }

" My Plugins

" Themes
Plug 'morhetz/gruvbox'

" Plug 'tyrannicaltoucan/vim-quantum'
" Plug 'TheBB/badwolf'
" Plug 'gidj/vim-vimbrant'
" Plug 'dikiaap/minimalist'
" Plug 'rakr/vim-one'
" Plug 'hzchirs/vim-material'
" Plug 'NLKNguyen/papercolor-theme'


" Indispensable Plugins
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'Shougo/neco-syntax'
"
" Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'sjl/gundo.vim'
Plug 'majutsushi/tagbar'
Plug 'epeli/slimux'
" Plug 'rking/ag.vim'
Plug 'mileszs/ack.vim'
Plug 'bling/vim-airline'
" Plug 'pearofducks/ansible-vim'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

" Useful plugins from Tim Pope
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'

" Plug 'sheerun/vim-polyglot'
" Python Plugins
" Plug 'jmcantrell/vim-virtualenv'
Plug 'vim-python/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent'
" Plug 'python-mode/python-mode'
" Plug 'tmhedberg/SimpylFold'

" Haskell Plugins
" Plug 'dag/vim2hs'
" Plug 'eagletmt/ghcmod-vim'
" Plug 'eagletmt/neco-ghc'

" Javascript Plugins
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim' " For all JS libraries
" Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'mxw/vim-jsx' " For ReactJS

" Ruby Plugins
" Plug 'vim-ruby/vim-ruby' " Doesn't work with Neovim yet

" Version control related
Plug 'mhinz/vim-signify'
Plug 'ludovicchabant/vim-lawrencium'

" Various Language Plugings
Plug 'othree/html5.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'ap/vim-css-color'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
" Plug 'mattn/emmet-vim'
" Plug 'Keithbsmiley/swift.vim'
" Plug 'jiangmiao/auto-pairs'
" Plug 'gidj/vim-csyn'

" All of your Plugins must be added before the following line
call plug#end()            " required
" }}}

" Filetype: {{{
syntax on
filetype on
filetype plugin on
filetype indent on
" set smartindent
let mapleader=',' " Change the leader to the comma character
" set encoding=utf8

" for italics
set t_ZH=[3m
set t_ZR=[23m

let g:indentLine_char = '│'

"" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

noremap <leader>f :ALEFix<CR>

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Center search matches
nnoremap n nzz

" Limit autocomplete list length
set pumheight=25

" Function to strip whitespaces on write, while retaining position in the file
function! <SID>StripTrailingWhitespaces()
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  call cursor(l, c)
endfun

if has("autocmd")
  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
  " Javascript, JSX
  autocmd FileType javascript,javascript.jsx set ts=4 sts=4 sw=4 et
  " autocmd FileType json setlocal conceallevel=0
  " Python files
  augroup filetype_python
    autocmd!
    autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab
    autocmd Filetype python setlocal textwidth=120
    autocmd Filetype python let &formatprg=expand('~/.virtualenvs/neovim/bin/yapf')
  augroup END
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
  augroup filtype_html_jinja
    autocmd!
    autocmd Filetype html,jinja,jinja.html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd Filetype html,jinjs,jinja.html set formatprg=/usr/local/bin/tidy
  augroup END
  autocmd Filetype css,scss,xml setlocal ts=4 sts=4 sw=4 expandtab
  " autocmd Filetype jinja setlocal syntax on

  "autocmd FileType * set tabstop=2|set shiftwidth=2|set noexpandtab
  " autocmd Filetype python set foldmethod=indent
endif
" }}}
" Leaders: {{{
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
" }}}
" Keymapping: {{{
" This makes the space bar toggle folding on and off.
noremap <Space> za
vnoremap . :norm.<CR>
" }}}

let g:LanguageClient_serverCommands = {
    \ 'python': ['/Users/gideon/.virtualenvs/neovim/bin/pyls'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1
" Disable Diagnostics
let g:LanguageClient_diagnosticsEnable=0

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <leader>g :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_references()<CR>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:python_highlight_indent_errors = 0
let g:python_highlight_all = 1

" Theme settings
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

set background=dark " Set the background
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italicize_strings=1
let g:gruvbox_improved_warnings=1
" let g:gruvbox_improved_strings=1

colorscheme gruvbox

set clipboard=unnamed

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set backspace=indent,eol,start  " Let backspace cross over end of line
set modeline

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
" set synmaxcol=120 " This stops syntax highlighting from trying after column 120
set cursorline " Turn on highlighting of active line:
" set relativenumber

set mouse=a " Turn on mouse mode, for terminals that can use it

set listchars=tab:▸\ ,eol:¬  " Use the same symbols as TextMate for tabstops and EOLs
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
" set list!

" Ale: {{{
let g:ale_fixers = {
  \ 'html': ['tidy'],
  \ 'python': ['isort'],
\}
  " \ 'javascript': ['eslint'],
let g:ale_linters = {
  \ 'html': ['htmlhint'],
  \ 'jinja': ['htmlhint'],
  \ 'python': ['flake8'],
\}
  " \ 'vim': ['vint'],
let g:ale_linter_aliases = {
  \ 'jinja': 'html',
\}
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_delay = 500
let g:ale_set_highlights = 0
" let g:ale_sign_error = '⤫'
" let g:ale_sign_warning = '⚠'

let g:ale_html_tidy_excecutable = expand('/usr/local/bin/tidy')
let g:ale_vim_vint_executable = expand('~/.virtualenvs/neovim/bin/vint')

" let g:ale_python_yapf_executable = expand('~/.virtualenvs/neovim/bin/yapf')
let g:ale_python_isort_executable = expand('~/.virtualenvs/neovim/bin/isort')
" let g:pylint_params = ''
" if !empty($VIRTUAL_ENV)
"   let g:venv = join([$VIRTUAL_ENV, 'lib/python2.7/site-packages'], '/')
"   let g:pylint_params .= '--init-hook=''' . 'import sys; sys.path.insert(0, "' . g:venv . '")'''
" else
"   let g:venv = ''
" endif

" let g:ale_python_pylint_executable = expand('~/.virtualenvs/neovim/bin/pylint')
" let g:ale_python_pylint_use_global = 1
" " --disable=all
" " --enalbe=E
" let g:ale_python_pylint_options = g:pylint_params

let g:ale_python_flake8_executable = expand('~/.virtualenvs/neovim/bin/flake8')
let g:ale_python_flake8_use_global = 1
let g:ale_python_flake8_options = '--ignore=E128,E221,E241,E251,E265,E303,E501'
" }}}
" Airline: {{{
" let g:airline#extensions#whitespace#show_message = 0
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts=1
" let g:airline#extensions#branch#use_vcscommand=1
let g:airline_theme='gruvbox'

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
" }}}
" Customized Syntax: {{{
hi! link htmlTag GruvboxBlue
hi! link htmlEndTag GruvboxBlue

hi! link htmlTagName GruvboxBlueBold
hi! link htmlArg GruvboxYellow

hi! link htmlScriptTag GruvboxPurple
hi! link htmlTagN GruvboxFg1
hi! link htmlSpecialTagName GruvboxOrangeBold
" highlight Comment cterm=italic
" }}}
" Gundo: {{{
nnoremap <F5> :GundoToggle<CR>
" }}}
" Signify: {{{
let g:signify_vcs_list = ['hg', 'git']
" }}}
" Slimux: {{{
" let g:slimux_select_from_current_window=0
let g:slimux_exclude_vim_pane=0
map <C-c><C-c> :SlimuxREPLSendLine<CR>
vmap <C-c><C-c> :SlimuxREPLSendSelection<CR>
" }}}
" Tabar: {{{
hi link TagbarKind       Function
hi link TagbarNestedKind SVDBlueBold
nnoremap <F8> :TagbarToggle<CR>
" }}}


inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")


" Deoplete: {{{
let g:deoplete#enable_at_startup = 1
" " Create comnifunc hash
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni_patterns = {}
" let g:deoplete#omni_patterns.java = '[^. *\t].\w*'
let g:deoplete#ignore_sources = {}
" let g:deoplete#ignore_sources.java = ['tag']

let g:deoplete#omni_patterns = {}
" let g:deoplete#omni_patterns.ruby = '[^. *\t].\w*'
let g:deoplete#auto_refresh_delay=200

" " use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" " use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" " Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" }}}

" EClim: {{{
" let g:EclimCompletionMethod = 'omnifunc'
" let g:EclimPythonValidate = 0 " Disable validation of python files so syntastic takes over
" }}}
" Haskellmode-Vim: {{{
" :let g:haddock_browser='/Applications/Google Chrome.app'
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
