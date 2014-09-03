" see my work in vimrc

"nmap <D-t> :sp .<CR>
if has("gui_macvim")
  " get rid of cmd-t for tab, etc.
  "macm Edit.Copy<Tab>"+y
  "macm Edit.Cut<Tab>"+x
  "macm Edit.Paste<Tab>"+gP
  macm Edit.Find.Find\ Next     key=<nop>
  macm Edit.Find.Find\ Previous     key=<nop>
  macm Edit.Find.Find\.\.\.     key=<nop>
  macm Edit.Find.Use\ Selection\ for\ Find  key=<nop>
  macm Edit.Font.Bigger       key=<nop>
  macm Edit.Font.Show\ Fonts
  macm Edit.Font.Smaller      key=<nop>
  macm Edit.Redo<Tab>^R       key=<nop>
  macm Edit.Select\ All<Tab>ggVG    key=<nop>
  macm Edit.Special\ Characters\.\.\.   key=<nop>
  macm Edit.Undo<Tab>u        key=<nop>
  macm File.Close       key=<nop>
  macm File.Close\ Window<Tab>:qa   key=<nop>
  macm File.New\ Tab        key=<nop>
  macm File.New\ Tab key=<nop>
  macm File.New\ Window       key=<nop>
  macm File.Open\ Recent
  macm File.Open\ Tab\.\.\.<Tab>:tabnew   key=<nop>
  macm File.Open\.\.\.        key=<nop>
  macm File.Print       key=<nop>
  macm File.Save<Tab>:w       key=<nop>
  macm File.Save\ All       key=<nop>
  macm File.Save\ As\.\.\.<Tab>:sav   key=<nop>
  macm Help.MacVim\ Help      key=<nop>
  macm Tools.List\ Errors<Tab>:cl   key=<nop>
  macm Tools.Make<Tab>:make     key=<nop>
  macm Tools.Newer\ List<Tab>:cnew    key=<nop>
  macm Tools.Next\ Error<Tab>:cn    key=<nop>
  macm Tools.Older\ List<Tab>:cold    key=<nop>
  macm Tools.Previous\ Error<Tab>:cp    key=<nop>
  macm Tools.Spelling.Suggest\ Corrections<Tab>z=   key=<nop>
  macm Tools.Spelling.To\ Next\ error<Tab>]s  key=<nop>
  macm Window.Bring\ All\ To\ Front
  macm Window.Minimize    key=<nop>
  macm Window.Minimize\ All key=<nop>
  macm Window.Select\ Next\ Tab     key=<nop>
  macm Window.Select\ Previous\ Tab   key=<nop>
  "macm Window.Toggle\ Full\ Screen\ Mode  key=<nop>
  macm Window.Zoom    key=<nop>
  macm Window.Zoom\ All   key=<nop>
endif

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

" vim:set ft=vim et sw=2:
