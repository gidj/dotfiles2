" Go: {{{
" }}}
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'
" Run gofmt and goimports on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

let g:go_auto_sameids = 1
let g:go_auto_type_info = 1

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
