" Ale: {{{
" }}}
let g:ale_fixers = {
\ 'go': ['gofmt'],
\ 'hcl': ['terraform'],
\ 'html': ['tidy'],
\ 'json': ['prettier'],
\ 'javascript': ['prettier'],
\ 'python': ['isort', 'black'],
\ 'vue': ['prettier'],
\ 'xml': ['xmllint'],
\ 'yaml': ['prettier'],
\}

let g:ale_linters = {
\ 'html': ['htmlhint'],
\ 'jinja': ['htmlhint'],
\ 'python': ['flake8'],
\ 'xml': ['xmllint'],
\}
let g:ale_linter_aliases = {
\ 'jinja': 'html',
\}

" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_delay = 500
let g:ale_set_highlights = 0

let g:ale_html_tidy_excecutable = expand('/usr/local/bin/tidy')
let g:ale_javascript_prettier_options = '--no-semi --single-quote --print-width 100 --trailing-comma es5'
let g:ale_vue_prettier_options = '--no-semi --single-quote'
let g:ale_python_flake8_use_global = 1
let g:ale_python_flake8_options = '--ignore=E128,E221,E241,E251,E265,E303,E501'

noremap <leader>f :ALEFix<CR>
