" File: vimrc
"
" Author: created by reedes on 16-Feb-2013
" Updated: continuously
" URL: https://github.com/reedes/vim-config

set nocompatible

"  # VUNDLE (package management)
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let vundle manage itself
Bundle 'gmarik/vundle'

" # Non-color Bundles
"Bundle 'roman/golden-ratio'
"Bundle 'ervandew/supertab'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tommcdo/vim-exchange'
Bundle 'airblade/vim-gitgutter'
Bundle 'kana/vim-textobj-user'
"Bundle 'kana/vim-operator-user'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'milkypostman/vim-togglelist'
Bundle 'moll/vim-bbye'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-markdown'
"Bundle 'plasticboy/vim-markdown'
Bundle 'bling/vim-airline'
"Bundle 'rhysd/vim-operator-surround'
"Bundle 'tpope/vim-repeat'
"Bundle 'tpope/vim-abolish'
"Bundle 'tpope/vim-unimpaired'
Bundle 'junegunn/vader.vim'

" # Authored Bundles
Bundle 'reedes/vim-colors-pencil'
Bundle 'reedes/vim-lexical'
Bundle 'reedes/vim-litecorrect'
Bundle 'reedes/vim-one'
Bundle 'reedes/vim-pencil'
Bundle 'reedes/vim-textobj-quote'
Bundle 'reedes/vim-textobj-sentence'
Bundle 'reedes/vim-thematic'
Bundle 'reedes/vim-wheel'
Bundle 'reedes/vim-wordy'

" # Color Bundles
Bundle 'hmaarrfk/vim-colors-solarized'
Bundle 'baskerville/bubblegum'
Bundle 'chriskempson/base16-vim'
Bundle 'endel/vim-github-colorscheme'
Bundle 'nanotech/jellybeans.vim'
Bundle 'noahfrederick/vim-hemisu'

syntax enable
filetype plugin indent on

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal
set shiftround

set ttimeout
set ttimeoutlen=100

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set ruler
set showcmd
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
  endif
endif

if &shell =~# 'fish$'
  set shell=/bin/bash
endif

set fileformats+=mac

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>

imap ,fn <c-r>=expand('%:t:r')<cr>

" jump to last active buffer, even from insert mode
inoremap <C-^> <C-C><C-^>

" Make the 'cw' and like commands put a $ at the end
" instead of just deleting the text and replacing it.
set cpoptions+=$

" Don't update the display while executing macros
set lazyredraw

" Don't show the current command int he lower right corner.
" In OSX, if this is set and lazyredraw is set then it's
" slow as molasses, so we unset this
"set noshowcmd

" Various characters are "wider" than normal fixed width
" characters, but the default setting of ambiwidth (single)
" squeezes them into "normal" width, which sucks.
"set ambiwidth=double

" Add the unnamed register to the clipboard
set clipboard+=unnamed

set expandtab                   " use spaces, not tabs (optional)
set hlsearch                    " highlight matches
set ignorecase                  " searches are case insensitive...
set laststatus=0
set list                        " show invisible characters
set nowrap                      " don't wrap lines
set shortmess=atI               " suppress PRESS ENTER messages by shortening messages
set smartcase                   " ... unless they contain at least one capital letter
set synmaxcol=800               " Don't try to lines highlight longer than 800 characters.
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set visualbell                  " avoid beeping
set hidden                      " allow unwritten background buffers

if has('unix')
  set shell=/bin/bash\ -i       " make Vim’s :! shell behave like your command prompt
endif

" Make the current file executable
nmap ,x :w<cr>:!chmod 755 %<cr>:e<cr>

" command-t, ctrlp config and expanding wildcards
set wildignore+=*.*~
set wildignore+=*.bak
set wildignore+=*.bz2,*.gz,*.tar,*.xz,*.zip
set wildignore+=*.class,*.pyc,*.so
set wildignore+=*.epub,*.mobi,*.pdf
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.swp
set wildignore+=.DS_Store
set wildignore+=.git/**
set wildignore+=.svn/**
set wildignore+=log/**
set wildignore+=tmp/**

" get rid of cmd-t for tab
"if has('gui_macvim')
"  macmenu File.New\ Tab key=<nop>
"endif

iab mdy <c-r>=strftime("%B %d, %Y")<CR>
iab mdyhm <c-r>=strftime("%A %B %d, %Y %I:%M %p")<CR>
iab isodate <c-r>=strftime("%FT%T%z")<CR>

let mapleader = ","             " <Leader> key instead of backslash (options '\_,;')

" join, maintaining cursor position
"nnoremap S i<cr><esc>^mzgk:silent! s/\v +$//<cr>:noh<cr>`z
"nnoremap J mzJ`z

" select what was just pasted
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

"augroup CursorLine
"  au!
"  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"  au WinLeave * setlocal nocursorline
"augroup END
"set nocursorline
"set nocursorcolumn

nnoremap <silent> Q gwip
"nnoremap <silent> K vipJ
nnoremap <silent> ,J :let p=getpos('.')<bar>join<bar>call setpos('.', p)<cr>
"nnoremap <silent> ,Q :g/^/norm gqq<cr>
"nnoremap <silent> ,K :%norm vipJ<cr>

" For quick recordings just type qq to start recording, then q to stop. You
" don't have to worry about the name this way (you just named the recording
" 'q'). Now, to play back the recording you just type Q.
"nnoremap Q @q
"noremap <Space> @q

"make <c-l> clear the highlight as well as redraw
noremap <silent> <C-l> :<C-u>nohlsearch<cr><C-l>
inoremap <silent> <C-l> <C-o>:nohlsearch<cr>

" # Quick Editing - edit vimrc file and others
" NOTE pointing to all files in vim dir so that can easily
"      browse directory using NERDTreeFind (<leader>T).
nnoremap <silent> ,E :edit $MYVIMRC<cr>
"nnoremap <silent> ,es :wall<cr>:so $MYVIMRC<cr>

" Remember last location in file, but not for commit messages.
" see :help last-position-jump
augroup line_return
    au!
    au BufReadPost *
      \ if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$") |
      \   execute 'normal! g`"zvzz' |
      \ endif
augroup END


" jump to the first open window that has buffer
"set switchbuf=useopen

" delete buffer without closing window (vim-bbye plugin)
nmap <C-@> :Bdelete<CR>

" switch buffers ([b and ]b in unimpaired)
nmap <C-p> :bprevious<CR>
nmap <C-n> :bnext<CR>

" switch buffers via quickfix ([q and ]q in unimpaired)
nmap <silent> ,p :cprevious<cr>zvzz
nmap <silent> ,n :cnext<cr>zvzz
nmap <silent> ,P :crewind<cr>zvzz
nmap <silent> ,N :clast<cr>zvzz

" switch buffers via location ([l and ]l in unimpaired)
"nmap <silent> ,k :lprevious<cr>zvzz
"nmap <silent> ,j :lnext<cr>zvzz
"nmap <silent> ,K :lrewind<cr>zvzz
"nmap <silent> ,J :llast<cr>zvzz

" aggressively read/write buffers
augroup AutoWrite
  autocmd FocusLost * :silent! wall
  "autocmd! BufLeave * :update
augroup END
set autoread
"set autowrite
"set autowriteall
" lskjfs

" Clean trailing whitespace and save
"nnoremap ,w mz:%s/\s\+$//e<cr>:let @/=''<cr>`z:w<cr>
nnoremap <silent> ,w :call TrimAndWrite()<cr>
function! TrimAndWrite()
  let l:p = getpos('.')
  silent! %s/\s\+$//e
  call setpos('.', l:p)
  write
endfunction

" # Common directories for backup, undo and swap
set nobackup                      " disable backups

set undofile                      " Save undo's after file closes
set undolevels=1000               " How many undos
set undoreload=10000              " number of lines to save for undo

"set backupdir=~/.vim/tmp/backup// " backups
set undodir=~/.vim/tmp/undo//     " undo files
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
"if !isdirectory(expand("~/.vim/tmp/backup"))
"    call mkdir(expand("~/.vim/tmp/backup"), "p")
"endif
if !isdirectory(expand("~/.vim/tmp/undo"))
    call mkdir(expand("~/.vim/tmp/undo"), "p")
endif
if !isdirectory(expand("~/.vim/tmp/swap"))
    call mkdir(expand("~/.vim/tmp/swap"), "p")
endif

" Close all folds except the one(1) the cursor is on, and center.
nnoremap z1 zMzvzz

" Make zO (not zero) recursively open whatever top level fold we're in, no
" matter where the cursor happens to be, and center.
nnoremap zO zCzOzz

" Make horizontal scrolling easier
"nmap <silent> <C-o> 10zl
"nmap <silent> <C-i> 10zh

" set styling on vertical splits (hard space)
set fillchars=vert: 

set splitbelow
set splitright

"let g:SuperTabDefaultCompletionType = "context"

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
"call matchadd('ColorColumn', '\%81v', 100)

"key mapping for Gundo
"nnoremap <F4> :GundoToggle<CR>
"
"map ,e <Plug>(easymotion-prefix)
"

let g:one#handleSwapfileConflicts = 1     " 0=disable, 1=enable (def)

nmap <silent> ,v :wall<CR>:Vader<CR>

let g:force_reload_textobj_sentence = 1
let g:litecorrect#typographic = 0
augroup various
  autocmd!
  autocmd FileType markdown,mkd
    \ call litecorrect#init()           |
    \ call lexical#init()               |
    \ call textobj#sentence#init()      |
    \ call textobj#quote#init()         |
    \ call pencil#init()
  autocmd FileType text
    \ call litecorrect#init()           |
    \ call lexical#init({ 'spell': 0 }) |
    \ call textobj#sentence#init()      |
    \ call textobj#quote#init()         |
    \ call pencil#init()
augroup END

" Avoid loading of MatchParen, per pi_paren.txt
"let loaded_matchparen = 1

"let g:wheel#map#mouse = -1
let g:lexical#spelllang = ['en_us',]
let g:lexical#spell_key = ',u'
let g:lexical#thesaurus_key = ',j'
let g:lexical#dictionary_key = ',k'
let g:pencil#softDetectSample = 40
let g:pencil#softDetectThreshold = 100
let g:pencil#wrapModeDefault = 'soft'

let g:online_thesaurus_map_keys = 0
nnoremap ,r :OnlineThesaurusCurrentWord<CR>

"map <silent> ,c <Plug>ReplaceWithCurly
"map <silent> ,s <Plug>ReplaceWithStraight
"map <silent> ,2 <Plug>SurroundWithDouble
"map <silent> ,1 <Plug>SurroundWithSingle

" operator mappings for rhysd/vim-operator-surround
"map <silent>sa <Plug>(operator-surround-append)
"map <silent>sd <Plug>(operator-surround-delete)
"map <silent>sr <Plug>(operator-surround-replace)

" delete or replace most inner surround

"" if you use vim-textobj-quote
"nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-quote-a)
"nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-quote-a)
"
"" if you use vim-textobj-sentence
"nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-sentence-a)
"nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-sentence-a)

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

nnoremap <silent> K :NextWordy<cr>

let g:pencil_neutral_headings = 1
let g:pencil_higher_contrast_ui = 0
let g:airline_theme='pencil'

"nmap <silent> ,A :ShiftPencil<cr>
nmap <silent> <D-9> <Plug>ThematicNarrow
nmap <silent> <D-0> <Plug>ThematicWiden
nmap ,y <Plug>ThematicNext
nmap ,Y <Plug>ThematicRandom
nmap ,I :Thematic pencil_dark<CR>

" use jellybeans as default airline theme as it maps from
" existing colors
let g:thematic#defaults = {
\ 'airline-theme': 'jellybeans',
\ 'fullscreen-background-color-fix': 1,
\ 'sign-column-color-fix': 1,
\ 'laststatus': 0,
\ 'background': 'dark',
\ 'font-size': 20,
\ 'linespace': 0,
\ 'transparency': 0,
\ }
let g:thematic#themes = {
\ 'desert'     : { 'sign-column-color-fix': 1,
\                  'columns': 80,
\                  'lines': 30,
\                  'linespace': 9,
\                  'sign-column': 1,
\                  'fold-column-color-mute': 1,
\                  'number-column-color-mute': 1,
\                  'typeface': 'Cutive Mono',
\                },
\ 'pencil_light':{ 'colorscheme': 'pencil',
\                  'background': 'light',
\                  'columns': 75,
\                  'font-size': 20,
\                  'fullscreen': 1,
\                  'laststatus': 0,
\                  'linespace': 8,
\                  'airline-theme': 'pencil',
\                  'typeface': 'Cousine',
\                },
\ 'pencil_dark': { 'colorscheme': 'pencil',
\                  'background': 'dark',
\                  'font-size': 20,
\                  'fullscreen': 1,
\                  'laststatus': 0,
\                  'linespace': 8,
\                  'airline-theme': 'pencil',
\                  'typeface': 'Cousine',
\                },
\ 'traditional': { 'colorscheme': 'pencil',
\                  'background': 'light',
\                  'font-size': 20,
\                  'laststatus': 0,
\                  'linespace': 8,
\                  'airline-theme': 'pencil',
\                  'typeface': 'Linux Libertine Mono O',
\                },
\ 'hemi_dark'  : { 'colorscheme': 'hemisu',
\                  'font-size': 8,
\                  'linespace': 0,
\                  'typeface': 'Menlo',
\                },
\ 'hemi_lite'  : { 'colorscheme': 'hemisu',
\                  'background': 'light',
\                  'columns': 75,
\                  'typeface': 'CosmicSansNeueMono',
\                },
\ 'matrix'     : { 'colorscheme': 'base16-greenscreen',
\                  'font-size': 24,
\                  'linespace': 9,
\                  'typeface': 'Dot Matrix',
\                },
\ 'solar_dark' : { 'colorscheme': 'solarized',
\                  'diff-color-fix': 1,
\                  'sign-column': 1,
\                  'sign-column-color-fix': 1,
\                  'typeface': 'Source Code Pro Light',
\                },
\ 'solar_lite' : { 'colorscheme': 'solarized',
\                  'background': 'light',
\                  'font-size': 20,
\                  'sign-column-color-fix': 1,
\                  'typeface': 'Source Code Pro Medium',
\                },
\ 'github'     : { 'background': 'light' },
\ }


"let g:thematic#theme_name = 'desert'


" Motions to Ack for things.  Works with pretty much everything, including:
"   w, W, e, E, b, B, t*, f*, i*, a*, and custom text objects
" Note: If the text covered by a motion contains a newline it won't work.  Ack
" searches line-by-line.

nnoremap <silent> ,a :set opfunc=<SID>AckMotion<CR>g@
xnoremap <silent> ,a :<C-U>call <SID>AckMotion(visualmode())<CR>

function! s:CopyMotionForType(type)
    if a:type ==# 'v'
        silent execute "normal! `<" . a:type . "`>y"
    elseif a:type ==# 'char'
        silent execute "normal! `[v`]y"
    endif
endfunction

function! s:AckMotion(type) abort
    let reg_save = @@
    call s:CopyMotionForType(a:type)
    execute "normal! :Ack! --literal " . shellescape(@@) . "\<cr>"
    let @@ = reg_save
endfunction

" # CtrlP (navigation)
" http://kien.github.com/ctrlp.vim/
nmap ,b :CtrlPBuffer<CR>
nmap ,m :CtrlPMRU<CR>
"let g:ctrlp_map = '<c-p>'
let g:ctrlp_map = '<Leader>f'
let g:ctrlp_working_path_mode = 0      " don't manage
let g:ctrlp_by_filename = 1            " only consider filename, not full path
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }

"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" The Silver Searcher
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
  let g:ackprg = 'ag --smart-case --nogroup --nocolor --column'
  set grepprg=ag\ --nogroup\ --nocolor
endif

func! MyCtrlPMappings()
    nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc

func! s:DeleteBuffer()
    let line = getline('.')
    let bufid = line =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(line, '\d\+'))
        \ : fnamemodify(line[2:], ':p')
    exec "bd" bufid
    exec "norm \<F5>"
endfunc

" # NERD Tree (directory browser)
nmap <silent> ,t :set columns=999<CR>:NERDTreeToggle<CR>
nmap <silent> ,T :set columns=999<CR>:NERDTreeFind<CR>
let NERDChristmasTree=1
let NERDTreeChDirMode=2
let NERDTreeDirArrows=1
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.bak$', '\.zip$', '\.xz$' ]
let NERDTreeMapJumpFirstChild = 'gK'
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1

" quit if nerdtree is the last buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Try ]c and [c to jump between hunks
let g:signify_sign_change='~'
let g:signify_sign_delete='-'
let g:signify_sign_overwrite=0    " prevent dumping gutter
let g:signify_update_on_focusgained=1    " dumps gutter if overwrite=1
let g:signify_sign_color_inherit_from_linenr=1

let g:airline#extensions#whitespace#show_message = 0
let g:airline#extensions#whitespace#checks = [ ]
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_linecolumn_prefix = ''
let g:airline_fugitive_prefix = '⎇'
let g:airline_paste_symbol = 'ρ'
let g:airline_section_x = ''
let g:airline_section_y = "%{strlen(&ft)?&ft:'none'}"
" ===============================================================
"

" TODO for writing mode only
nnoremap <silent> ,s :call MyParagraph(0)<cr>
nnoremap <silent> ,j :call MyParagraph(1)<cr>

function! MyParagraph(mode)
  let p=getpos('.')
  execute "normal! vip\<esc>"
  normal! vip
  if a:mode == 0
    *s/\([\.\?\!\:]\+\)\s*/\1\r- /ge
  else
    *s/^\- //e
    if &textwidth == 0
      *join
    endif
  endif
  if &textwidth > 0
    normal! vipgq
  endif
  execute "normal! \<esc>"
  call setpos('.', p)
endfunction


" vim:set ft=vim et sw=2:
