"
" Modified by reede on 2013/02/15
"
" Description: Vim color file
"

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name="iawriter"

hi Cursor       guifg=#424242    guibg=#a6c6ed
hi Normal       guifg=#424242    guibg=#f5f6f6               ctermfg=black  ctermbg=white
hi DiffAdd      guifg=#99DD99    guibg=NONE
hi DiffDelete   guifg=#FFCCCC    guibg=NONE
hi DiffChange   guifg=#CCCCFF    guibg=NONE
hi DiffText     guifg=darkblue   guibg=NONE
hi NonText      guifg=darkred    guibg=bg                    ctermfg=darkred
hi SpecialKey   guifg=grey50     guibg=bg      gui=NONE      ctermfg=darkblue

hi LineNr       guifg=grey50     guibg=grey86                ctermfg=darkblue
hi Search       guifg=darkred    guibg=grey86
hi StatusLine   guifg=fg         guibg=grey86  gui=NONE      ctermfg=fg       ctermbg=bg cterm=NONE
hi StatusLineNC guifg=fg         guibg=grey86  gui=NONE      ctermfg=fg       ctermbg=bg cterm=NONE
hi Visual       guifg=fg         guibg=#b6d6fd gui=NONE
hi VisualNOS    guifg=bg         guibg=#b6d6fd gui=NONE

" syntax highlighting groups
hi Comment      guifg=#009900    guibg=bg      gui=italic    ctermfg=darkgreen
hi String       guifg=#b30000    guibg=bg                    ctermfg=darkred
hi Constant     guifg=#c033ff    guibg=bg                    ctermfg=darkmagenta
hi Statement    guifg=darkyellow guibg=bg      gui=NONE      ctermfg=black                  cterm=NONE
hi PreProc      guifg=#335588    guibg=bg       gui=NONE     ctermfg=blue
hi Type         guifg=#338855    guibg=bg      gui=NONE      ctermfg=darkgreen
hi StorageClass guifg=#990000    guibg=bg                    ctermfg=red
hi Special      guifg=#6688ff    guibg=bg                    ctermfg=darkcyan
hi Function     guifg=#117777    guibg=NONE                  ctermfg=red
hi Title        guifg=darkblue   guibg=bg      gui=italic    ctermfg=darkblue ctermbg=NONE  cterm=NONE

hi Conditional  guifg=#6699CC    guibg=NONE    gui=bold      ctermfg=blue        ctermbg=NONE        cterm=NONE  " if else end
hi CursorLine   guifg=NONE       guibg=#e5e6e6 gui=NONE      ctermfg=NONE   ctermbg=NONE  cterm=NONE
hi Delimiter    guifg=#424242
hi FoldColumn   guifg=darkgray   guibg=NONE    gui=NONE      ctermfg=darkgray    ctermbg=NONE
hi Folded       guifg=#6686ad    guibg=NONE    gui=reverse   ctermfg=darkgray    ctermbg=NONE        cterm=NONE
hi Identifier   guifg=brown      guibg=NONE    gui=NONE      ctermfg=cyan        ctermbg=NONE        cterm=NONE
hi Keyword      guifg=darkyellow guibg=NONE    gui=italic    ctermfg=darkyellow  ctermbg=NONE        cterm=NONE
hi SignColumn   guifg=#3D3D3D    guibg=bg      gui=italic    ctermfg=darkgray ctermbg=NONE  cterm=NONE
hi VertSplit    guifg=fg         guibg=grey86  gui=NONE      ctermfg=fg       ctermbg=bg cterm=NONE

" settings for Vim7
if version >= 700
  hi MatchParen                    guibg=#c4ffc4                                                ctermbg=lightgreen
  hi SpellBad     guifg=#cc0000                  gui=undercurl guisp=#cc0000 ctermfg=red                        cterm=underline
  hi SpellCap                                    gui=undercurl guisp=#22cc22                                    cterm=underline
  hi SpellRare    guifg=magenta                  gui=undercurl               ctermfg=magenta                    cterm=underline
  hi Pmenu                         guibg=#ffffcc                                                ctermbg=yellow
  hi PmenuSbar                     guibg=#999966                                                ctermbg=lightcyan
  hi PmenuSel                      guibg=#ddddaa                                                ctermbg=lightcyan  cterm=NONE
  hi TabLine                       guibg=grey70                                                                 cterm=underline
  hi TabLineSel                                  gui=NONE                                                       cterm=NONE
  hi TabLineFill  guifg=black      guibg=grey80                                                                 cterm=underline
endif



" plugin-specific
hi SyntasticErrorSign        guifg=darkred
hi SyntasticWarningSign      guifg=darkorange

" Special for XML
hi link xmlTag          Keyword
hi link xmlTagName      Conditional
hi link xmlEndTag       Identifier

" Special for HTML (and markdown)
hi htmlItalic     guifg=fg      guibg=NONE gui=italic    ctermfg=38  ctermbg=NONE cterm=bold
hi htmlBold       guifg=fg      guibg=NONE gui=bold      ctermfg=38  ctermbg=NONE cterm=bold
hi htmlBoldItalic guifg=fg      guibg=NONE gui=bold,italic ctermfg=38  ctermbg=NONE cterm=bold
hi htmlH1         guifg=#6686ad guibg=NONE gui=bold      ctermfg=38  ctermbg=NONE cterm=bold
hi htmlH2         guifg=#6686ad guibg=NONE gui=NONE      ctermfg=38  ctermbg=NONE cterm=bold
hi htmlLink       guifg=#929292 guibg=NONE gui=underline ctermfg=185 ctermbg=NONE cterm=NONE
hi htmlString     guifg=#87875f guibg=NONE gui=NONE      ctermfg=101 ctermbg=NONE cterm=NONE
hi htmlTagName    guifg=fg      guibg=NONE gui=NONE      ctermfg=182 ctermbg=NONE cterm=NONE
hi link htmlTag         Keyword
hi link htmlEndTag      Identifier
hi link htmlTagName     Conditional
"hi link htmlH2 htmlH1
hi link htmlH3 htmlH1
hi link htmlH4 htmlH1
