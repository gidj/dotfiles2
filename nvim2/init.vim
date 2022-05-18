set completeopt=menuone,noselect


runtime ./plugins.lua

" runtime ./lspconfig.lua
" runtime ./lualine.lua
" runtime ./lspsaga.vim
" runtime ./treesitter.lua
" runtime ./telescope.vim
runtime ./cmp.lua
runtime ./maps.vim
runtime macros/sandwich/keymap/surround.vim

set clipboard=unnamed

set listchars=tab:▸\ ,eol:¬  " Use the same symbols as TextMate for tabstops and EOLs
""Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

set modeline

if has("persistent_undo")
  set undodir=~/.local/tmp/undodir/
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

let g:tokyonight_style='night'
colorscheme tokyonight

set ts=4 sts=4 sw=4 et

if has("autocmd")
  " autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
  " Javascript, JSX
  autocmd FileType javascript,javascript.jsx,typescript.tsx setlocal ts=2 sts=2 sw=2 et
  " Markdown
  autocmd FileType markdown setlocal spell spelllang=en_us
  " YAML
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 et
  " Conf"
  autocmd FileType conf,hcl setlocal ts=2 sts=2 sw=2 et
  " Python files
  augroup filetype_python
    " autocmd!
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
    autocmd Filetype html,jinjs,jinja.html setlocal formatprg=/usr/local/bin/tidy
  augroup END
  " Vue
  " autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
  autocmd FileType vue setlocal ts=2 sts=2 sw=2 et
  autocmd FileType lua setlocal ts=2 sts=2 sw=2 et
  " Jenkins
  autocmd BufNewFile,BufRead Jenkinsfile setf groovy
  autocmd BufNewFile,BufRead Config setf perl
  autocmd Filetype css,scss,xml setlocal ts=4 sts=4 sw=4 expandtab

    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup END
endif

let g:gh_open_command = 'fn() { echo "$@" | pbcopy; }; fn '
