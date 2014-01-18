" see my work in vimrc

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

  set guifont=Source\ Code\ Pro\:h18
  set linespace=2     "extra space between lines
endif

colorscheme reede_dark

" vim:set ft=vim et sw=2:
