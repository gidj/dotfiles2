" Ale: {{{
" }}}
let g:ale_fixers = {
\ 'html': ['tidy'],
\ 'json': ['prettier'],
\ 'python': ['isort', 'black'],
\ 'go': ['gofmt'],
\ 'xml': ['xmllint'],
\ 'yml': ['xmllint'],
\}
" let g:ale_fixers = {
" \ 'html': ['tidy'],
" \ 'json': ['prettier'],
" \ 'python': ['isort', 'yapf'],
" \ 'xml': ['xmllint'],
" \ 'yml': ['xmllint'],
" \}
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
let g:ale_vim_vint_executable = expand(g:neovim3_venv_path . '/bin/vint')
let g:ale_python_yapf_executable = expand(g:neovim3_venv_path . '/bin/yapf')
let g:ale_python_isort_executable = expand(g:neovim3_venv_path . '/bin/isort')
let g:ale_python_flake8_executable = expand(g:neovim3_venv_path . '/bin/flake8')
let g:ale_python_black_executable = expand(g:neovim3_venv_path . '/bin/black')
let g:ale_python_pyls_executable = expand(g:neovim3_venv_path . '/bin/pyls')
let g:ale_python_flake8_use_global = 1
let g:ale_python_flake8_options = '--ignore=E128,E221,E241,E251,E265,E303,E501'

noremap <leader>f :ALEFix<CR>
