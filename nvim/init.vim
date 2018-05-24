" VimPlug: {{{
" Use vim-plug to manage plugins
call plug#begin('~/.config/nvim/plugged')

" Use python2 and python3 from venvs
function! s:python_venv(pipfile_dir)
  if filereadable(expand(a:pipfile_dir . '/Pipfile'))
    return substitute(system('cd ' . a:pipfile_dir . ' && pipenv --venv'), '\n\+$', '', '')
  else
    return v:null
  endif
endfunction

function! s:set_pyenv()
  let s:path = s:python_venv('~/.config/nvim/neovim2')
  if empty(s:path)
    let g:loaded_python_provider = 1
    let g:neovim2_venv_path = v:null
  else
    let g:neovim2_venv_path = expand(s:path)
    let g:python_host_prog = expand(s:path . '/bin/python')
  endif
  let s:path = s:python_venv('~/.config/nvim/neovim3')
  if empty(s:path)
    let g:loaded_python3_provider = 1
    let g:neovim3_venv_path = v:null
  else
    let g:neovim3_venv_path = expand(s:path)
    let g:python3_host_prog = expand(s:path . '/bin/python')
  endif
endfunction

call s:set_pyenv()

" My Plugins
" Themes
Plug 'morhetz/gruvbox'

" Indispensable Plugins
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'w0rp/ale'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'bling/vim-airline'
Plug 'simnalamburt/vim-mundo'
Plug 'majutsushi/tagbar'
Plug 'epeli/slimux'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Valloric/ListToggle'
Plug 'wellle/targets.vim'
Plug 'machakann/vim-sandwich'
Plug 'justinmk/vim-dirvish'

" Useful plugins from Tim Pope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'

" Python Plugins
Plug 'vim-python/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent' " Fix indentation

" Javascript Plugins
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim' " For all JS libraries
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'

" Clojure
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-salve'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'clojure-vim/async-clj-omni'

" Version control related
Plug 'mhinz/vim-signify' " For hg
Plug 'ludovicchabant/vim-lawrencium'
Plug 'airblade/vim-gitgutter' " For git
Plug 'tpope/vim-fugitive'

" Various Language Plugings
Plug 'othree/html5.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'ap/vim-css-color'
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
Plug 'ekalinin/Dockerfile.vim'

" All of your Plugins must be added before the following line
call plug#end()            " required
" runtime macros/sandwich/keymap/surround.vim
" }}}
" Look and Feel: {{{
set clipboard=unnamed

set listchars=tab:▸\ ,eol:¬  " Use the same symbols as TextMate for tabstops and EOLs
""Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

set modeline

if has("persistent_undo")
  set undodir=~/.config/nvim/undodir/
  set undofile
endif

set splitright " Vertical split to the right
set splitbelow " Horizontal split below

set hlsearch " Hightlight search items
set showmatch

set number " Activate line numbering on the left side of the screen
highlight LineNr ctermfg=DarkGrey

set cursorline " Turn on highlighting of active line:

set mouse=a " Turn on mouse mode, for terminals that can use it

set termguicolors
set background=dark " Set the background
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italicize_strings=1
let g:gruvbox_improved_warnings=1
colorscheme gruvbox

let g:python_highlight_indent_errors = 0
let g:python_highlight_all = 1
" }}}
" Filetype: {{{
syntax on
filetype on
filetype plugin on
filetype indent on

let g:indentLine_char = '│'

" Limit autocomplete list length
set pumheight=25

" Function to strip whitespaces on write, while retaining position in the file
function! <SID>StripTrailingWhitespaces()
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  call cursor(l, c)
endfun

set ts=4 sts=4 sw=4 et

if has("autocmd")
  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
  " Javascript, JSX
  autocmd FileType javascript,javascript.jsx set ts=2 sts=2 sw=2 et
  " YAML
  autocmd FileType yaml set ts=2 sts=2 sw=2 et
  " Python files
  augroup filetype_python
    autocmd!
    autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab
    autocmd Filetype python setlocal textwidth=120
  augroup END
  " C files
  autocmd Filetype c,h setlocal foldmethod=syntax ts=2 sts=2 sw=2 expandtab
  " make files
  autocmd FileType make setlocal noexpandtab
  " Scheme- and Lisp-style files
  autocmd Filetype lisp,scheme setlocal lisp "foldmethod=syntax
  " Ruby
  autocmd FileType ruby,eruby setlocal ts=2 sts=2 sw=2 expandtab
  " HTML files
  augroup filtype_html_jinja
    autocmd!
    autocmd Filetype html,jinja,jinja.html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd Filetype html,jinjs,jinja.html set formatprg=/usr/local/bin/tidy
  augroup END
  autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
  autocmd Filetype css,scss,xml setlocal ts=4 sts=4 sw=4 expandtab
endif

" }}}
" Keymapping: {{{
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
" }}}
" Language Server: {{{
let g:LanguageClient_serverCommands = {
    \ 'python': [expand(g:neovim3_venv_path . '/bin/pyls')],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'vue': ['javascript-typescript-stdio'],
    \ }
" Automatically start language servers.
let g:LanguageClient_autoStart = 1
" Disable Diagnostics
let g:LanguageClient_diagnosticsEnable=0
" Required for operations modifying multiple buffers like rename.
set hidden

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <leader>g :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <leader>rn :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <leader>rf :call LanguageClient_textDocument_references()<CR>
" }}}
" Ale: {{{
let g:ale_fixers = {
\ 'html': ['tidy'],
\ 'python': ['isort'],
\}
let g:ale_linters = {
\ 'html': ['htmlhint'],
\ 'jinja': ['htmlhint'],
\ 'python': ['flake8'],
\}
let g:ale_linter_aliases = {
\ 'jinja': 'html',
\}
let g:ale_pattern_options = {
\ '.*\.app\.js$': {'ale_enabled': 0},
\}

" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_delay = 500
let g:ale_set_highlights = 0

let g:ale_html_tidy_excecutable = expand('/usr/local/bin/tidy')
let g:ale_vim_vint_executable = expand(g:neovim3_venv_path . '/bin/vint')
let g:ale_python_yapf_executable = expand(g:neovim3_venv_path . '/bin/yapf')
let g:ale_python_isort_executable = expand(g:neovim3_venv_path . '/bin/isort')
let g:ale_python_flake8_executable = expand(g:neovim3_venv_path . '/bin/flake8')
let g:ale_python_flake8_use_global = 1
let g:ale_python_flake8_options = '--ignore=E128,E221,E241,E251,E265,E303,E501'

noremap <leader>f :ALEFix<CR>
" }}}
" Airline: {{{
let g:airline#extensions#whitespace#show_message = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme='gruvbox'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.readonly = ''

set laststatus=2 " Activate persistent status line:
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
" }}}
" Mundo: {{{
noremap <leader>u :MundoToggle<CR>
let g:mundo_preview_bottom=1
" }}}
" GitGutter: {{{
set updatetime=200
" }}}
" Signify: {{{
let g:signify_vcs_list = ['hg']
" }}}
" Slimux: {{{
let g:slimux_exclude_vim_pane=0
map <C-c><C-c> :SlimuxREPLSendLine<CR>
vmap <C-c><C-c> :SlimuxREPLSendSelection<CR>
" }}}
" Tabar: {{{
hi link TagbarKind       Function
hi link TagbarNestedKind SVDBlueBold
nnoremap <F8> :TagbarToggle<CR>
" }}}
" FZF: {{{
function! s:find_root()
  for vcs in ['.venv', 'Pipfile', 'Gemfile', '.git', '.svn', '.hg']
    let dir = finddir(vcs.'/..', ';')
    if !empty(dir)
      execute 'FZF' dir
      return
    endif
  endfor
  FZF
endfunction

command! FZFR call s:find_root()
nmap <leader><space> :<C-u>FZFR<CR>
" command! AGR call s:find_root('Ag')
" nmap <leader>a :<C-u>AGR<CR>

" }}}
" Snippets: {{{
let g:UltiSnipsSnippetsDir="~/.config/nvim/myUltiSnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "myUltiSnips"]
" Trigger configuration.
let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"
" Vsplit if you want to edit a snippet
let g:UltiSnipsEditSplit="vertical"
map <leader>es :UltiSnipsEdit<CR>
" }}}
" Nvim Completion Manager: {{{
" Disable tags
let g:cm_sources_override = {
    \ 'cm-tags': {'enable':0},
    \ }

imap <expr> <CR>  (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)" : "\<CR>")
imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-J>":"\<CR>")

" use tab to forward cycle
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" use tab to backward cycle
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Show documentation of autocomplete option
let g:cm_completeopt = 'menu,menuone,noinsert,noselect,preview'

" Close preview window
augroup ncm_preview
  autocmd! InsertLeave <buffer> if pumvisible() == 0|pclose|endif
augroup END

" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Remove 'x of y' in preview window
set shortmess+=c
" }}}

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
