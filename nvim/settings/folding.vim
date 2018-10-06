" Folding: {{{
" }}}
function! g:CoiledSnakeConfigureFold(fold)
  " Don't fold nested classes.
  if a:fold.type == 'class'
    let a:fold.max_level = 1
    " Don't fold nested functions, but do fold methods (i.e. functions
    " nested inside a class).
  elseif a:fold.type == 'function'
    let a:fold.max_level = 1
    if get(a:fold.parent, 'type') == 'class'
      let a:fold.num_blanks_below = 2
      let a:fold.max_level = 2
    endif

    " Only fold imports if there are 3 or more of them.
  " elseif a:fold.type == 'import'
  "   let a:fold.min_lines = 3
  " endif

  " Don't fold anything if the whole program is shorter than 30 lines.
  if line('$') < 30
    let a:fold.ignore = 1
  endif
endfunction
