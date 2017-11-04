" Vim color file

" Always use dark background
set background=dark

" Theme setup
highlight clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "milesrc"

let s:cterm0 = "000" " black
let s:gui0 = "323232"

let s:cterm1 = "001" " red
let s:gui1 = "ff00aa"

let s:cterm2 = "002" " green
let s:gui2 = "00aa00"

let s:cterm3 = "003" " yellow
let s:gui3 = "cccc00"

let s:cterm4 = "004" " blue
let s:gui4 = "507fff"

let s:cterm5 = "005" " magenta
let s:gui5 = "aa50ff"

let s:cterm6 = "006" " cyan
let s:gui6 = "50cccc"

let s:cterm7 = "007" " white
let s:gui7 = "eeeeee"

let s:cterm8 = "008" " light_black
let s:gui8 = "505050"

let s:cterm9 = "009" " light_red
let s:gui9 = "ff00aa"

let s:cterma = "010" " light_green
let s:guia = "00aa00"

let s:ctermb = "011" " light_yellow
let s:guib = "cccc00"

let s:ctermc = "012" " light_blue
let s:guic = "507fff"

let s:ctermd = "013" " light_magenta
let s:guid = "aa50ff"

let s:cterme = "014" " light_cyan
let s:guie = "50cccc"

let s:ctermf = "015" " light_white
let s:guif = "eeeeee"

" Highlighting function
function <sid>clr(grp, fg, bg, attr)
  if a:fg == "black"
    exec "hi " . a:grp . " guifg=#" . s:gui0 . " ctermfg=" . s:cterm0
  elseif a:fg == "red"
    exec "hi " . a:grp . " guifg=#" . s:gui1 . " ctermfg=" . s:cterm1
  elseif a:fg == "green"
    exec "hi " . a:grp . " guifg=#" . s:gui2 . " ctermfg=" . s:cterm2
  elseif a:fg == "yellow"
    exec "hi " . a:grp . " guifg=#" . s:gui3 . " ctermfg=" . s:cterm3
  elseif a:fg == "blue"
    exec "hi " . a:grp . " guifg=#" . s:gui4 . " ctermfg=" . s:cterm4
  elseif a:fg == "magenta"
    exec "hi " . a:grp . " guifg=#" . s:gui5 . " ctermfg=" . s:cterm5
  elseif a:fg == "cyan"
    exec "hi " . a:grp . " guifg=#" . s:gui6 . " ctermfg=" . s:cterm6
  elseif a:fg == "white"
    exec "hi " . a:grp . " guifg=#" . s:gui7 . " ctermfg=" . s:cterm7
  elseif a:fg == "light_black"
    exec "hi " . a:grp . " guifg=#" . s:gui8 . " ctermfg=" . s:cterm8
  elseif a:fg == "light_red"
    exec "hi " . a:grp . " guifg=#" . s:gui9 . " ctermfg=" . s:cterm9
  elseif a:fg == "light_green"
    exec "hi " . a:grp . " guifg=#" . s:guia . " ctermfg=" . s:cterma
  elseif a:fg == "light_yellow"
    exec "hi " . a:grp . " guifg=#" . s:guib . " ctermfg=" . s:ctermb
  elseif a:fg == "light_blue"
    exec "hi " . a:grp . " guifg=#" . s:guic . " ctermfg=" . s:ctermc
  elseif a:fg == "light_magenta"
    exec "hi " . a:grp . " guifg=#" . s:guid . " ctermfg=" . s:ctermd
  elseif a:fg == "light_cyan"
    exec "hi " . a:grp . " guifg=#" . s:guie . " ctermfg=" . s:cterme
  elseif a:fg == "light_white"
    exec "hi " . a:grp . " guifg=#" . s:guif . " ctermfg=" . s:ctermf
  endif

  if a:bg == "black"
    exec "hi " . a:grp . " guibg=#" . s:gui0 . " ctermbg=" . s:cterm0
  elseif a:bg == "red"
    exec "hi " . a:grp . " guibg=#" . s:gui1 . " ctermbg=" . s:cterm1
  elseif a:bg == "green"
    exec "hi " . a:grp . " guibg=#" . s:gui2 . " ctermbg=" . s:cterm2
  elseif a:bg == "yellow"
    exec "hi " . a:grp . " guibg=#" . s:gui3 . " ctermbg=" . s:cterm3
  elseif a:bg == "blue"
    exec "hi " . a:grp . " guibg=#" . s:gui4 . " ctermbg=" . s:cterm4
  elseif a:bg == "magenta"
    exec "hi " . a:grp . " guibg=#" . s:gui5 . " ctermbg=" . s:cterm5
  elseif a:bg == "cyan"
    exec "hi " . a:grp . " guibg=#" . s:gui6 . " ctermbg=" . s:cterm6
  elseif a:bg == "white"
    exec "hi " . a:grp . " guibg=#" . s:gui7 . " ctermbg=" . s:cterm7
  elseif a:bg == "light_black"
    exec "hi " . a:grp . " guibg=#" . s:gui8 . " ctermbg=" . s:cterm8
  elseif a:bg == "light_red"
    exec "hi " . a:grp . " guibg=#" . s:gui9 . " ctermbg=" . s:cterm9
  elseif a:bg == "light_green"
    exec "hi " . a:grp . " guibg=#" . s:guia . " ctermbg=" . s:cterma
  elseif a:bg == "light_yellow"
    exec "hi " . a:grp . " guibg=#" . s:guib . " ctermbg=" . s:ctermb
  elseif a:bg == "light_blue"
    exec "hi " . a:grp . " guibg=#" . s:guic . " ctermbg=" . s:ctermc
  elseif a:bg == "light_magenta"
    exec "hi " . a:grp . " guibg=#" . s:guid . " ctermbg=" . s:ctermd
  elseif a:bg == "light_cyan"
    exec "hi " . a:grp . " guibg=#" . s:guie . " ctermbg=" . s:cterme
  elseif a:bg == "light_white"
    exec "hi " . a:grp . " guibg=#" . s:guif . " ctermbg=" . s:ctermf
  endif

  if a:attr != ""
    exec "hi " . a:grp . " gui=" . a:attr . " cterm=" . a:attr
  else
    exec "hi " . a:grp . " gui=NONE cterm=NONE"
  endif
endfun

" Vim editor colors
call <sid>clr("Bold", "default", "default", "bold")
call <sid>clr("Boolean", "light_red", "default", "")
call <sid>clr("Character", "cyan", "default", "")
call <sid>clr("ColorColumn", "default", "light_black", "")
call <sid>clr("Comment", "light_black", "default", "")
call <sid>clr("Conceal", "cyan", "default", "")
call <sid>clr("Conditional", "magenta", "default", "")
call <sid>clr("Constant", "light_red", "default", "")
call <sid>clr("Cursor", "black", "white", "")
call <sid>clr("CursorColumn", "default", "default", "")
call <sid>clr("CursorLine", "default", "default", "")
call <sid>clr("CursorLineNr", "blue", "light_black", "")
call <sid>clr("Debug", "cyan", "default", "")
call <sid>clr("Define", "magenta", "default", "")
call <sid>clr("Delimiter", "red", "default", "")
call <sid>clr("DiffAdded", "white", "green", "")
call <sid>clr("DiffAdd", "white", "green", "")
call <sid>clr("DiffChange", "white", "light_black", "")
call <sid>clr("DiffDelete", "white", "red", "")
call <sid>clr("DiffFile", "light_black", "default", "")
call <sid>clr("DiffLine", "white", "light_black", "")
call <sid>clr("DiffNewFile", "green", "default", "")
call <sid>clr("DiffRemoved", "red", "default", "")
call <sid>clr("DiffText", "white", "blue", "")
call <sid>clr("Directory", "blue", "default", "")
" call <sid>clr("Error", "default", "default", "")
call <sid>clr("ErrorMsg", "white", "red", "")
call <sid>clr("Exception", "cyan", "default", "")
call <sid>clr("Float", "light_red", "default", "")
call <sid>clr("FoldColumn", "default", "default", "")
call <sid>clr("Folded", "light_black", "default", "")
call <sid>clr("Function", "cyan", "default", "")
call <sid>clr("Identifier", "cyan", "default", "")
" call <sid>clr("Ignore", "default", "default", "")
call <sid>clr("Include", "cyan", "default", "")
call <sid>clr("IncSearch", "light_black", "blue", "")
call <sid>clr("Italic", "default", "default", "")
call <sid>clr("Keyword", "magenta", "default", "")
call <sid>clr("Label", "red", "default", "")
call <sid>clr("LineNr", "light_black", "default", "")
call <sid>clr("Macro", "cyan", "default", "")
call <sid>clr("MatchParen", "black", "light_black", "")
call <sid>clr("ModeMsg", "green", "default", "")
call <sid>clr("MoreMsg", "green", "default", "")
call <sid>clr("NonText", "light_black", "default", "")
call <sid>clr("Normal", "white", "black", "")
call <sid>clr("Number", "light_red", "default", "")
call <sid>clr("Operator", "white", "default", "")
call <sid>clr("PMenu", "white", "default", "")
call <sid>clr("PMenuSel", "black", "white", "")
" call <sid>clr("PreCondit", "default", "default", "")
call <sid>clr("PreProc", "red", "default", "")
call <sid>clr("Question", "cyan", "default", "")
call <sid>clr("Repeat", "red", "default", "")
call <sid>clr("Search", "white", "blue", "")
call <sid>clr("SignColumn", "light_black", "default", "")
call <sid>clr("Special", "cyan", "default", "")
call <sid>clr("SpecialChar", "red", "default", "")
" call <sid>clr("SpecialComment", "default", "default", "")
call <sid>clr("SpecialKey", "light_black", "default", "")
call <sid>clr("SpellBad", "default", "black", "undercurl")
call <sid>clr("SpellCap", "default", "black", "undercurl")
call <sid>clr("SpellLocal", "default", "black", "undercurl")
call <sid>clr("SpellRare", "default", "black", "undercurl")
call <sid>clr("Statement", "cyan", "default", "")
call <sid>clr("StatusLine", "white", "default", "")
call <sid>clr("StatusLineNC", "light_black", "default", "")
call <sid>clr("StorageClass", "red", "default", "")
call <sid>clr("String", "green", "default", "")
call <sid>clr("Structure", "magenta", "default", "")
call <sid>clr("TabLine", "light_black", "default", "")
call <sid>clr("TabLineFill", "light_black", "default", "")
call <sid>clr("TabLineSel", "green", "default", "")
call <sid>clr("Tag", "red", "default", "")
call <sid>clr("Title", "cyan", "default", "")
call <sid>clr("Todo", "red", "default", "")
call <sid>clr("TooLong", "cyan", "default", "")
call <sid>clr("Type", "light_red", "default", "")
call <sid>clr("Typedef", "red", "default", "")
call <sid>clr("Underlined", "cyan", "default", "")
call <sid>clr("VertSplit", "black", "default", "")
call <sid>clr("Visual", "white", "light_black", "")
call <sid>clr("VisualNOS", "cyan", "default", "")
call <sid>clr("WarningMsg", "white", "yellow", "")
call <sid>clr("WildMenu", "cyan", "default", "")

" Remove function
delfunction <sid>clr

" Remove color variables
unlet s:cterm0 s:cterm1 s:cterm2 s:cterm3 s:cterm4 s:cterm5 s:cterm6
unlet s:cterm7 s:cterm8 s:cterm9 s:cterma s:ctermb s:ctermc s:ctermd
unlet s:cterme s:ctermf
unlet s:gui0 s:gui1 s:gui2 s:gui3 s:gui4 s:gui5 s:gui6 s:gui7 s:gui8
unlet s:gui9 s:guia s:guib s:guic s:guid s:guie s:guif
