" see my work in vimrc

" get rid of cmd-t for tab
macmenu File.New\ Tab key=<nop>
"nmap <D-t> :sp .<CR>

" disable cursor blink
set guicursor+=a:blinkon0

if has("gui_macvim")
  set antialias

  set guioptions-=r   "kill right scrollbar
  set guioptions-=l   "kill left scrollbar
  set guioptions-=L   "kill left scrollbar with multiple buffers
  set guioptions-=T   "kill toolbar

  set guioptions-=m   "don't source menus
  set guioptions+=M

  set guioptions+=E   " Emoji support

  "set guifont=Fantasque\ Sans\ Mono\:h22
  set guifont=Cousine\:h18
  "set guifont=Linux\ Libertine\ Mono\ O\:h18
  "set guifont=Cousine\:h18
  "set guifont=Source\ Code\ Pro\:h18
  set linespace=2     "extra space between lines

  map <silent> <D-9> <Plug>ThematicNarrow
  map <silent> <D-0> <Plug>ThematicWiden
endif

set background=dark
colorscheme pencil

" vim:set ft=vim et sw=2:
