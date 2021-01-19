set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab


autocmd CursorHoldI,CursorMovedI * silent! call CocActionAsync('showSignatureHelp')
