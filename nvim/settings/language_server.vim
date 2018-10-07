" Language Server: {{{
" }}}
let g:LanguageClient_serverCommands = {
    \ 'python': [expand(g:neovim3_venv_path . '/bin/pyls')],
    \ }
" Automatically start language servers.
let g:LanguageClient_autoStart = 1
" Disable Diagnostics
let g:LanguageClient_diagnosticsEnable=1
" Required for operations modifying multiple buffers like rename.
set hidden
let g:LanguageClient_hasSnippetSupport=1
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <leader>g :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <leader>rn :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <leader>rf :call LanguageClient_textDocument_references()<CR>
