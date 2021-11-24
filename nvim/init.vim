" VimPlug: {{{
" Use vim-plug to manage plugins
call plug#begin('~/.config/nvim/plugged')

" My Plugins
" Themes
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wellle/tmux-complete.vim'
Plug 'honza/vim-snippets'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Plug 'dense-analysis/ale'

Plug 'liuchengxu/vista.vim'
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
Plug 'preservim/nerdtree'

" Useful plugins from Tim Pope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'

" Terraform
Plug 'hashivim/vim-terraform'
Plug 'b4b4r07/vim-hcl'

" Python Plugins
Plug 'vim-python/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent' " Fix indentation

" Rust
Plug 'rust-lang/rust.vim'

Plug 'ekalinin/Dockerfile.vim'

" Version control related
Plug 'airblade/vim-gitgutter' " For git
Plug 'tpope/vim-fugitive'
Plug 'ruanyl/vim-gh-line'

" Folding
" Plug 'tmhedberg/SimpylFold'
" Plug 'kalekundert/vim-coiled-snake'
" Plug 'Konfekt/FastFold'

" Javascript Plugins
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
" Plug 'posva/vim-vue'
Plug 'cespare/vim-toml'
Plug 'mechatroner/rainbow_csv'
" Plug 'RRethy/vim-illuminate'
Plug 'jparise/vim-graphql'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'Glench/Vim-Jinja2-Syntax'
" Various Language Plugings
" Plug 'othree/html5.vim'
" Plug 'ap/vim-css-color'
Plug 'Yggdroot/indentLine'
" Plug 'mattn/emmet-vim'

" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

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

let ayucolor="mirage"

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italicize_strings=1
let g:gruvbox_improved_warnings=1

let g:gruvbox_material_enable_italic=1
let g:gruvbox_material_enable_bold=1
let g:gruvbox_material_background='hard'
let g:gruvbox_material_palette='mix'
" let g:gruvbox_italicize_strings=1
" let g:gruvbox_improved_warnings=1

let g:palenight_terminal_italics=1
colorscheme gruvbox

" let g:python3_host_prog = '/full/path/to/neovim3/bin/python'
let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python')
let g:python_highlight_indent_errors = 0
let g:python_highlight_all = 1
" }}}
"
" Custom highlighting
function! MyHighlights() abort
    " Define BadWhitespace before using in a match
    highlight BadWhitespace ctermbg=red guibg=darkred

    " Highlight spelling mistakes in red
    highlight SpellBad cterm=underline ctermfg=red guifg=red

    " Do not use separate background color in sign column
    highlight SignColumn guibg=bg
    highlight SignColumn ctermbg=bg

    " Use underlined, bold, green for current tag
    highlight TagbarHighlight guifg=#b8bb26
    highlight TagbarHighlight gui=bold,underline

    " Highlight search results in bold green
    highlight Search guibg=guibg guifg=#b8bb26 gui=bold,underline cterm=bold,underline

    " Try to use more subdued colors in vimdiff mode
    highlight DiffAdd cterm=bold ctermfg=142 ctermbg=235 gui=NONE guifg=#b8bb26 guibg=#3c3c25
    highlight DiffChange cterm=bold ctermfg=108 ctermbg=235 gui=NONE guifg=#8ec07c guibg=#383228
    highlight DiffText cterm=NONE ctermfg=214 ctermbg=235 gui=NONE guifg=#fabd2f guibg=#483D28
    highlight DiffDelete cterm=bold ctermfg=167 ctermbg=235 gui=NONE guifg=#fb4934 guibg=#372827

    " Use Gruvbox colors for python semshi semantic highlighter
    hi semshiGlobal          ctermfg=167 guifg=#fb4934
    hi semshiImported        ctermfg=214 guifg=#fabd2f cterm=bold gui=bold
    hi semshiParameter       ctermfg=142  guifg=#98971a
    hi semshiParameterUnused ctermfg=106 guifg=#665c54
    hi semshiBuiltin         ctermfg=208 guifg=#fe8019
    hi semshiAttribute       ctermfg=108  guifg=fg
    hi semshiSelf            ctermfg=109 guifg=#85a598
    hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f
endfunction

" augroup MyColors
"     autocmd!
"     autocmd ColorScheme * call MyHighlights()
" augroup END

runtime macros/sandwich/keymap/surround.vim

source ~/.config/nvim/mappings.vim
source ~/.config/nvim/settings/vue.vim
" source ~/.config/nvim/settings/python.vim
" source ~/.config/nvim/settings/language_server.vim
source ~/.config/nvim/settings/mundo.vim
" source ~/.config/nvim/settings/ale.vim
source ~/.config/nvim/settings/gitgutter.vim
" source ~/.config/nvim/settings/go.vim
" source ~/.config/nvim/settings/slimux.vim
source ~/.config/nvim/settings/airline.vim
" source ~/.config/nvim/settings/folding.vim
source ~/.config/nvim/settings/fzf.vim
" source ~/.config/nvim/settings/tagbar.vim
" source ~/.config/nvim/settings/signify.vim
source ~/.config/nvim/settings/behaviour.vim
" source ~/.config/nvim/settings/snippets.vim
source ~/.config/nvim/settings/coc.vim
source ~/.config/nvim/settings/vista.vim

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

hi link CocHighlightText CtrlPMode2

let g:gh_open_command = 'fn() { echo "$@" | pbcopy; }; fn '
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:

"lua <<EOF
"require'nvim-treesitter.configs'.setup {
"  highlight = {
"    enable = true,
"    custom_captures = {
"      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
"      ["foo.bar"] = "Identifier",
"    },
"  },
"}
"EOF
