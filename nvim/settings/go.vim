" Go: {{{
" }}}
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" Run gofmt and goimports on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()
