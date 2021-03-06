" Base16 Monokai

" Always use dark background
set background=dark

" Theme setup
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "base16-monokai"

" Terminal color definitions
let s:cterm00 = "236" " gray
let s:cterm01 = "235" " gray
let s:cterm02 = "238" " gray
let s:cterm03 = "059" " gray
let s:cterm04 = "101" " silver
let s:cterm05 = "255" " white
let s:cterm06 = "255" " white
let s:cterm07 = "255" " white
let s:cterm08 = "039" " sky blue
let s:cterm09 = "009" " light red
let s:cterm0A = "198" " magenta
let s:cterm0B = "118" " green
let s:cterm0C = "122" " cyan
let s:cterm0D = "117" " light blue
let s:cterm0E = "141" " lavendar
let s:cterm0F = "198" " magenta

" FIXME GUI colors
" GUI color definitions
let s:gui00 = "000000"
let s:gui01 = "000000"
let s:gui02 = "000000"
let s:gui03 = "000000"
let s:gui04 = "000000"
let s:gui05 = "000000"
let s:gui06 = "000000"
let s:gui07 = "000000"
let s:gui08 = "000000"
let s:gui09 = "000000"
let s:gui0A = "000000"
let s:gui0B = "000000"
let s:gui0C = "000000"
let s:gui0D = "000000"
let s:gui0E = "000000"
let s:gui0F = "000000"

" Return terminal color for light/dark variants
fun s:cterm(color)
    return a:color
    if &background == "dark"
        return a:color
    endif

    if a:color == s:cterm00
        return s:cterm07
    elseif a:color == s:cterm01
        return s:cterm06
    elseif a:color == s:cterm02
        return s:cterm05
    elseif a:color == s:cterm03
        return s:cterm04
    elseif a:color == s:cterm04
        return s:cterm03
    elseif a:color == s:cterm05
        return s:cterm02
    elseif a:color == s:cterm06
        return s:cterm01
    elseif a:color == s:cterm07
        return s:cterm00
    endif

    return a:color
endfun

" Return GUI color for light/dark variants
fun s:gui(color)
    if &background == "dark"
        return a:color
    endif

    if a:color == s:gui00
        return s:gui07
    elseif a:color == s:gui01
        return s:gui06
    elseif a:color == s:gui02
        return s:gui05
    elseif a:color == s:gui03
        return s:gui04
    elseif a:color == s:gui04
        return s:gui03
    elseif a:color == s:gui05
        return s:gui02
    elseif a:color == s:gui06
        return s:gui01
    elseif a:color == s:gui07
        return s:gui00
    endif

    return a:color
endfun

" Highlighting function
fun <sid>hi(group, guifg, guibg, ctermfg, ctermbg, attr)
    if a:guifg != ""
        exec "hi " . a:group . " guifg=#" . s:gui(a:guifg)
    endif
    if a:guibg != ""
        exec "hi " . a:group . " guibg=#" . s:gui(a:guibg)
    endif
    if a:ctermfg != ""
        exec "hi " . a:group . " ctermfg=" . s:cterm(a:ctermfg)
    endif
    if a:ctermbg != ""
        exec "hi " . a:group . " ctermbg=" . s:cterm(a:ctermbg)
    endif
    if a:attr != ""
        exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
    else
        exec "hi " . a:group . " gui=NONE cterm=NONE"
    endif
endfun

" Vim editor colors
call <sid>hi("Bold", "", "", "", "", "bold")
call <sid>hi("ColorColumn", "", s:gui01, "", s:cterm01, "")
call <sid>hi("Conceal", s:gui0D, s:gui00, s:cterm0D, s:cterm00, "")
call <sid>hi("Cursor", s:gui00, s:gui05, s:cterm00, s:cterm05, "")
call <sid>hi("CursorColumn", "", s:gui01, "", s:cterm01, "")
call <sid>hi("CursorLine", "", s:gui01, "", s:cterm01, "")
call <sid>hi("CursorLineNr", s:gui03, s:gui01, s:cterm03, s:cterm01, "")
call <sid>hi("Debug", s:gui08, "", s:cterm08, "", "")
call <sid>hi("Directory", s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("ErrorMsg", s:gui08, s:gui00, s:cterm08, s:cterm00, "")
call <sid>hi("Exception", s:gui08, "", s:cterm08, "", "")
call <sid>hi("FoldColumn", "", s:gui01, "", s:cterm01, "")
call <sid>hi("Folded", s:gui03, s:gui01, s:cterm03, s:cterm01, "")
call <sid>hi("IncSearch", s:gui01, s:gui09, s:cterm01, s:cterm09, "")
call <sid>hi("Italic", "", "", "", "", "")
call <sid>hi("LineNr", s:gui03, "", s:cterm03, "", "")
call <sid>hi("Macro", s:gui08, "", s:cterm08, "", "")
call <sid>hi("MatchParen", s:gui00, s:gui03, s:cterm00, s:cterm03, "")
call <sid>hi("ModeMsg", s:gui0B, "", s:cterm0B, "", "")
call <sid>hi("MoreMsg", s:gui0B, "", s:cterm0B, "", "")
call <sid>hi("NonText", s:gui03, "", s:cterm03, "", "")
call <sid>hi("Normal", s:gui05, s:gui00, s:cterm05, s:cterm00, "")
call <sid>hi("PMenu", s:gui04, s:gui01, s:cterm04, s:cterm01, "")
call <sid>hi("PMenuSel", s:gui01, s:gui04, s:cterm01, s:cterm04, "")
call <sid>hi("Question", s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("Search", s:gui03, s:gui0A, s:cterm03, s:cterm0A, "")
call <sid>hi("SignColumn", s:gui03, s:gui01, s:cterm03, s:cterm01, "")
call <sid>hi("SpecialKey", s:gui03, "", s:cterm03, "", "")
call <sid>hi("StatusLine", s:gui04, s:gui02, s:cterm04, s:cterm02, "")
call <sid>hi("StatusLineNC", s:gui03, s:gui01, s:cterm03, s:cterm01, "")
call <sid>hi("TabLine", s:gui03, s:gui01, s:cterm03, s:cterm01, "")
call <sid>hi("TabLineFill", s:gui03, s:gui01, s:cterm03, s:cterm01, "")
call <sid>hi("TabLineSel", s:gui0B, s:gui01, s:cterm0B, s:cterm01, "")
call <sid>hi("Title", s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("TooLong", s:gui08, "", s:cterm08, "", "")
call <sid>hi("Underlined", s:gui08, "", s:cterm08, "", "")
call <sid>hi("VertSplit", s:gui02, s:gui02, s:cterm02, s:cterm02, "")
call <sid>hi("Visual", "", s:gui02, "", s:cterm02, "")
call <sid>hi("VisualNOS", s:gui08, "", s:cterm08, "", "")
call <sid>hi("WarningMsg", s:gui08, "", s:cterm08, "", "")
call <sid>hi("WildMenu", s:gui08, "", s:cterm08, "", "")

" Standard syntax highlighting
call <sid>hi("Boolean", s:gui09, "", s:cterm09, "", "")
call <sid>hi("Character", s:gui08, "", s:cterm08, "", "")
call <sid>hi("Comment", s:gui03, "", s:cterm03, "", "")
call <sid>hi("Conditional", s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("Constant", s:gui09, "", s:cterm09, "", "")
call <sid>hi("Define", s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("Delimiter", s:gui0F, "", s:cterm0F, "", "")
call <sid>hi("Float", s:gui09, "", s:cterm09, "", "")
call <sid>hi("Function", s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("Identifier", s:gui08, "", s:cterm08, "", "")
call <sid>hi("Include", s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("Keyword", s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("Label", s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("Number", s:gui09, "", s:cterm09, "", "")
call <sid>hi("Operator", s:gui05, "", s:cterm05, "", "")
call <sid>hi("PreProc", s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("Repeat", s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("Special", s:gui0C, "", s:cterm0C, "", "")
call <sid>hi("SpecialChar", s:gui0F, "", s:cterm0F, "", "")
call <sid>hi("Statement", s:gui08, "", s:cterm08, "", "")
call <sid>hi("StorageClass", s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("String", s:gui0B, "", s:cterm0B, "", "")
call <sid>hi("Structure", s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("Tag", s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("Todo", s:gui0A, s:gui01, s:cterm0A, s:cterm01, "")
call <sid>hi("Type", s:gui09, "", s:cterm09, "", "")
call <sid>hi("Typedef", s:gui0A, "", s:cterm0A, "", "")

" Spelling highlighting
call <sid>hi("SpellBad", "", s:gui00, "", s:cterm00, "undercurl")
call <sid>hi("SpellCap", "", s:gui00, "", s:cterm00, "undercurl")
call <sid>hi("SpellLocal", "", s:gui00, "", s:cterm00, "undercurl")
call <sid>hi("SpellRare", "", s:gui00, "", s:cterm00, "undercurl")

" Additional diff highlighting
call <sid>hi("DiffAdd", s:gui0B, s:gui00, s:cterm0B, s:cterm00, "")
call <sid>hi("DiffAdded", s:gui0B, s:gui00, s:cterm0B, s:cterm00, "")
call <sid>hi("DiffChange", s:gui0D, s:gui00, s:cterm0D, s:cterm00, "")
call <sid>hi("DiffDelete", s:gui08, s:gui00, s:cterm08, s:cterm00, "")
call <sid>hi("DiffFile", s:gui08, s:gui00, s:cterm08, s:cterm00, "")
call <sid>hi("DiffLine", s:gui0D, s:gui00, s:cterm0D, s:cterm00, "")
call <sid>hi("DiffNewFile", s:gui0B, s:gui00, s:cterm0B, s:cterm00, "")
call <sid>hi("DiffRemoved", s:gui08, s:gui00, s:cterm08, s:cterm00, "")
call <sid>hi("DiffText", s:gui0D, s:gui00, s:cterm0D, s:cterm00, "")

" Remove functions
delf <sid>cterm
delf <sid>gui
delf <sid>hi

" Remove color variables
unlet s:cterm00 s:cterm01 s:cterm02 s:cterm03 s:cterm04 s:cterm05
unlet s:cterm06 s:cterm07 s:cterm08 s:cterm09 s:cterm0A s:cterm0B
unlet s:cterm0C s:cterm0D s:cterm0E s:cterm0F
unlet s:gui00 s:gui01 s:gui02 s:gui03 s:gui04 s:gui05 s:gui06 s:gui07
unlet s:gui08 s:gui09 s:gui0A s:gui0B s:gui0C s:gui0D s:gui0E s:gui0F
