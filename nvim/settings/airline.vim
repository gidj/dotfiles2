let g:airline#extensions#whitespace#show_message = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme='gruvbox'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.readonly = ''

set laststatus=2 " Activate persistent status line:
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

function! NearestMethodOrFunction() abort
  return get(b:, 'coc_current_function', '')
endfunction

call airline#parts#define('nearest_function', {'function': 'NearestMethodOrFunction'})
let g:airline_section_x = airline#section#create(['nearest_function'])
