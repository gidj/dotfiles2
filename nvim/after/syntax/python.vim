" GUI color definitions
let s:gui00        = "1d2021"
let g:base16_gui00 = "1d2021"
let s:gui01        = "3c3836"
let g:base16_gui01 = "3c3836"
let s:gui02        = "504945"
let g:base16_gui02 = "504945"
let s:gui03        = "665c54"
let g:base16_gui03 = "665c54"
let s:gui04        = "bdae93"
let g:base16_gui04 = "bdae93"
let s:gui05        = "d5c4a1"
let g:base16_gui05 = "d5c4a1"
let s:gui06        = "ebdbb2"
let g:base16_gui06 = "ebdbb2"
let s:gui07        = "fbf1c7"
let g:base16_gui07 = "fbf1c7"
let s:gui08        = "fb4934"
let g:base16_gui08 = "fb4934"
let s:gui09        = "fe8019"
let g:base16_gui09 = "fe8019"
let s:gui0A        = "fabd2f"
let g:base16_gui0A = "fabd2f"
let s:gui0B        = "b8bb26"
let g:base16_gui0B = "b8bb26"
let s:gui0C        = "8ec07c"
let g:base16_gui0C = "8ec07c"
let s:gui0D        = "83a598"
let g:base16_gui0D = "83a598"
let s:gui0E        = "d3869b"
let g:base16_gui0E = "d3869b"
let s:gui0F        = "d65d0e"
let g:base16_gui0F = "d65d0e"
" Terminal color definitions
let s:cterm00        = "00"
let g:base16_cterm00 = "00"
let s:cterm03        = "08"
let g:base16_cterm03 = "08"
let s:cterm05        = "07"
let g:base16_cterm05 = "07"
let s:cterm07        = "15"
let g:base16_cterm07 = "15"
let s:cterm08        = "01"
let g:base16_cterm08 = "01"
let s:cterm0A        = "03"
let g:base16_cterm0A = "03"
let s:cterm0B        = "02"
let g:base16_cterm0B = "02"
let s:cterm0C        = "06"
let g:base16_cterm0C = "06"
let s:cterm0D        = "04"
let g:base16_cterm0D = "04"
let s:cterm0E        = "05"
let g:base16_cterm0E = "05"
if exists('base16colorspace') && base16colorspace == "256"
  let s:cterm01        = "18"
  let g:base16_cterm01 = "18"
  let s:cterm02        = "19"
  let g:base16_cterm02 = "19"
  let s:cterm04        = "20"
  let g:base16_cterm04 = "20"
  let s:cterm06        = "21"
  let g:base16_cterm06 = "21"
  let s:cterm09        = "16"
  let g:base16_cterm09 = "16"
  let s:cterm0F        = "17"
  let g:base16_cterm0F = "17"
else
  let s:cterm01        = "10"
  let g:base16_cterm01 = "10"
  let s:cterm02        = "11"
  let g:base16_cterm02 = "11"
  let s:cterm04        = "12"
  let g:base16_cterm04 = "12"
  let s:cterm06        = "13"
  let g:base16_cterm06 = "13"
  let s:cterm09        = "09"
  let g:base16_cterm09 = "09"
  let s:cterm0F        = "14"
  let g:base16_cterm0F = "14"
endif

" Neovim terminal colours
if has("nvim")
  let g:terminal_color_0 =  "#1d2021"
  let g:terminal_color_1 =  "#fb4934"
  let g:terminal_color_2 =  "#b8bb26"
  let g:terminal_color_3 =  "#fabd2f"
  let g:terminal_color_4 =  "#83a598"
  let g:terminal_color_5 =  "#d3869b"
  let g:terminal_color_6 =  "#8ec07c"
  let g:terminal_color_7 =  "#d5c4a1"
  let g:terminal_color_8 =  "#665c54"
  let g:terminal_color_9 =  "#fb4934"
  let g:terminal_color_10 = "#b8bb26"
  let g:terminal_color_11 = "#fabd2f"
  let g:terminal_color_12 = "#83a598"
  let g:terminal_color_13 = "#d3869b"
  let g:terminal_color_14 = "#8ec07c"
  let g:terminal_color_15 = "#fbf1c7"
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = g:terminal_color_5
  if &background == "light"
    let g:terminal_color_background = g:terminal_color_7
    let g:terminal_color_foreground = g:terminal_color_2
  endif
endif

" Highlighting function
function! g:Base16hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=#" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=#" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=#" . a:guisp
  endif
endfunction


fun <sid>hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  call g:Base16hi(a:group, a:guifg, a:guibg, a:ctermfg, a:ctermbg, a:attr, a:guisp)
endfun


" Python highlighting
call <sid>hi("pythonOperator",  s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("pythonRepeat",    s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("pythonInclude",   s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("pythonStatement", s:gui0E, "", s:cterm0E, "", "", "")


" Remove functions
delf <sid>hi

" Remove color variables
unlet s:gui00 s:gui01 s:gui02 s:gui03  s:gui04  s:gui05  s:gui06  s:gui07  s:gui08  s:gui09 s:gui0A  s:gui0B  s:gui0C  s:gui0D  s:gui0E  s:gui0F
unlet s:cterm00 s:cterm01 s:cterm02 s:cterm03 s:cterm04 s:cterm05 s:cterm06 s:cterm07 s:cterm08 s:cterm09 s:cterm0A s:cterm0B s:cterm0C s:cterm0D s:cterm0E s:cterm0F
