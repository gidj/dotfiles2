" Nvim Completion Manager: {{{
" }}}
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=menu,menuone,noinsert,noselect,preview

let g:cm_sources_override = {
    \ 'cm-tags': {'enable':0},
    \ }

" Use <TAB> to select the popup menu:
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Close preview window
" augroup ncm2_preview
"   autocmd! InsertLeave <buffer> if pumvisible() == 0|pclose|endif
" augroup END

" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Remove 'x of y' in preview window
set shortmess+=c
