" VimPlug: {{{
" Use vim-plug to manage plugins
call plug#begin('~/.config/nvim/plugged')

" My Plugins
" Themes
Plug 'morhetz/gruvbox'

" Completion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-ultisnips'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }

Plug 'w0rp/ale'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'bling/vim-airline'
Plug 'simnalamburt/vim-mundo'
" Plug 'majutsushi/tagbar'
" Plug 'epeli/slimux'

Plug 'Valloric/ListToggle'
Plug 'wellle/targets.vim'
Plug 'machakann/vim-sandwich'
Plug 'justinmk/vim-dirvish'

" Useful plugins from Tim Pope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'

" Terraform
Plug 'hashivim/vim-terraform'

" Python Plugins
Plug 'vim-python/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent' " Fix indentation

" Version control related
Plug 'airblade/vim-gitgutter' " For git
Plug 'tpope/vim-fugitive'
" Plug 'stephpy/vim-yaml'
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif

" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'

" Folding
" Plug 'tmhedberg/SimpylFold'
" Plug 'kalekundert/vim-coiled-snake'
" Plug 'Konfekt/FastFold'

" Javascript Plugins
" Plug 'pangloss/vim-javascript'
" Plug 'othree/yajs.vim'
" Plug 'othree/javascript-libraries-syntax.vim' " For all JS libraries
" Plug 'posva/vim-vue'
" Plug 'leafgarland/typescript-vim'

" Clojure
" Plug 'tpope/vim-fireplace'
" Plug 'tpope/vim-salve'
" Plug 'guns/vim-clojure-static'
" Plug 'guns/vim-clojure-highlight'
" Plug 'clojure-vim/async-clj-omni'

" Various Language Plugings
" Plug 'othree/html5.vim'
" Plug 'Glench/Vim-Jinja2-Syntax'
" Plug 'ap/vim-css-color'
" Plug 'Yggdroot/indentLine'
" Plug 'mattn/emmet-vim'
" Plug 'ekalinin/Dockerfile.vim'

" All of your Plugins must be added before the following line
call plug#end()            " required
" }}}

" runtime macros/sandwich/keymap/surround.vim

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

source ~/.config/nvim/mappings.vim
source ~/.config/nvim/settings/python.vim
source ~/.config/nvim/settings/language_server.vim
source ~/.config/nvim/settings/mundo.vim
source ~/.config/nvim/settings/ale.vim
source ~/.config/nvim/settings/gitgutter.vim
" source ~/.config/nvim/settings/slimux.vim
source ~/.config/nvim/settings/airline.vim
" source ~/.config/nvim/settings/folding.vim
source ~/.config/nvim/settings/fzf.vim
" source ~/.config/nvim/settings/tagbar.vim
" source ~/.config/nvim/settings/signify.vim
source ~/.config/nvim/settings/behaviour.vim
source ~/.config/nvim/settings/snippets.vim
source ~/.config/nvim/settings/ncm2.vim
" source ~/.config/nvim/settings/deoplete.vim

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
