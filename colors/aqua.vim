" Vim color file
" Maintainer:   tranquility@portugalmail.pt
" Last Change:  6 Apr 2002


" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="aqua"

hi Normal	guibg=steelblue 	guifg=linen
hi Cursor	guibg=lightblue3 	guifg=black 		gui=bold
hi VertSplit	guibg=navyblue		guifg=white 		gui=none
hi Folded	guibg=darkblue 		guifg=white
hi FoldColumn	guibg=lightgray 	guifg=navyblue
hi ModeMsg	guibg=steelblue1	guifg=black
hi MoreMsg	guibg=steelblue1	guifg=black
hi NonText	guibg=steelblue4	guifg=white 		gui=none
hi Question				guifg=snow
hi Search	guibg=#FFFFFF 		guifg=midnightblue 	gui=bold
hi SpecialKey				guifg=navyblue
hi StatusLine	guibg=skyblue3 		guifg=black 		gui=none
hi StatusLineNC	guibg=skyblue1 		guifg=black 		gui=none
hi Title				guifg=bisque3
hi Subtitle				guifg=black
hi Visual	guibg=royalblue4	guifg=white 		gui=none
hi WarningMsg	guibg=gray60		guifg=salmon4 		gui=bold
hi Comment				guifg=lightskyblue
hi Constant				guifg=turquoise 	gui=bold
hi Identifier				guifg=lightcyan
hi Statement				guifg=royalblue4
hi PreProc				guifg=black 		gui=bold
hi Type					guifg=lightgreen
hi Special				guifg=navajowhite
hi Ignore				guifg=grey29
hi Todo		guibg=black 		guifg=white
hi WildMenu	guibg=aquamarine
