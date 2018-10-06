" Snippets: {{{
" }}}
let g:UltiSnipsSnippetsDir="~/.config/nvim/myUltiSnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "myUltiSnips"]
" Trigger configuration.
let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"
" Vsplit if you want to edit a snippet
let g:UltiSnipsEditSplit="vertical"
map <leader>es :UltiSnipsEdit<CR>
" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
