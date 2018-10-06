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

