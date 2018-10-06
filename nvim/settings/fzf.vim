" FZF: {{{
" }}}
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

