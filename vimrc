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
Plugin 'gmarik/vundle'

" # Non-color Plugins
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'airblade/vim-gitgutter'
"Plugin 'ervandew/supertab'
"Plugin 'junegunn/vader.vim'
"Plugin 'kana/vim-operator-user'
"Plugin 'kien/ctrlp.vim'
"Plugin 'kien/rainbow_parentheses.vim'
"Plugin 'luochen1990/rainbow'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'rhysd/vim-operator-surround'
"Plugin 'roman/golden-ratio'
"Plugin 'tommcdo/vim-exchange'
"Plugin 'tpope/vim-abolish'
"Plugin 'tpope/vim-repeat'
"Plugin 'tpope/vim-unimpaired'

Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'kshenoy/vim-signature'
Plugin 'mhinz/vim-signify'
Plugin 'mileszs/ack.vim'
Plugin 'milkypostman/vim-togglelist'
Plugin 'moll/vim-bbye'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-markdown'

" # Authored Plugins
Plugin 'reedes/vim-litecorrect'
Plugin 'reedes/vim-textobj-sentence'
Plugin 'reedes/vim-lexical'
Plugin 'reedes/vim-pencil'
Plugin 'reedes/vim-textobj-quote'
Plugin 'reedes/vim-wordy'
Plugin 'reedes/vim-colors-pencil'
Plugin 'reedes/vim-one'
Plugin 'reedes/vim-thematic'
Plugin 'reedes/vim-wheel'

" # Color Plugins
Plugin 'baskerville/bubblegum'
Plugin 'chriskempson/base16-vim'
Plugin 'endel/vim-github-colorscheme'
Plugin 'hmaarrfk/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'
Plugin 'noahfrederick/vim-hemisu'

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

set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
  let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
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

" undo during insert
inoremap <C-U> <C-G>u<C-U>

" get out of insert mode
"inoremap kj <esc>l

"imap <leader>fn <c-r>=expand('%:t:r')<cr>

" Make the 'cw' and like commands put a $ at the end
" instead of just deleting the text and replacing it.
"set cpoptions+=$

" Various characters are "wider" than normal fixed width
" characters, but the default setting of ambiwidth (single)
" squeezes them into "normal" width, which sucks.
"set ambiwidth=double

" Add the unnamed register to the clipboard
" (shares with system clipboard)
"set clipboard+=unnamed

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

"nmap <leader>M :delm! | delm A-Z0-9<cr>

" Make the current file executable
nmap <leader>x :w<cr>:!chmod 755 %<cr>:e<cr><cr>

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

iab mdy <c-r>=strftime("%B %d, %Y")<CR>
iab mdyhm <c-r>=strftime("%A %B %d, %Y %I:%M %p")<CR>
iab isodate <c-r>=strftime("%FT%T%z")<CR>

let mapleader = ","             " <Leader> key instead of backslash (options '\_,;')

" select what was just pasted
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" D is d$ C is c$ A is $a but Y is yy. WHY?
"map Y y$
noremap Y y$

"augroup CursorLine
"  au!
"  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"  au WinLeave * setlocal nocursorline
"augroup END
"set nocursorline
"set nocursorcolumn

" For quick recordings just type qq to start recording, then q to stop. You
" don't have to worry about the name this way (you just named the recording
" 'q'). Now, to play back the recording you just type Q.
"nnoremap Q @q
"noremap <Space> @q

" # Quick Editing - edit vimrc file and others
" NOTE pointing to all files in vim dir so that can easily
"      browse directory using NERDTreeFind (<leader>T).
nnoremap <silent> <leader>E :edit $HOME/.vim/vimrc<cr>
" reload vimrc when saved
au BufWritePost $HOME/.vim/vimrc so $HOME/.vim/vimrc

" == Redraw ================== {{{
"
" Don't update the display while executing macros
set lazyredraw

" Don't show the current command int he lower right corner.
" In OSX, if this is set and lazyredraw is set then it's
" slow as molasses, so we unset this
"set noshowcmd

"make <c-l> clear the highlight as well as redraw screen
noremap <silent> <C-l> :<C-u>nohlsearch<cr><C-l>
inoremap <silent> <C-l> <C-o>:nohlsearch<cr>
" Use <C-L> to clear the highlighting of :set hlsearch.
"if maparg('<C-L>', 'n') ==# ''
"  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
"endif

" }}}
" == Navigating buffers ================= {{{

" jump to the first open window that has buffer
"set switchbuf=useopen

" from insert mode, jump to last active buffer
inoremap <C-^> <C-C><C-^>
"inoremap <C-^> <C-C>:update<CR><C-^>

" switch buffers ([b and ]b in unimpaired)
nmap <C-p> :bprevious<CR>
nmap <C-n> :bnext<CR>

" switch buffers via quickfix ([q and ]q in unimpaired)
nmap <silent> <leader>p :cprevious<cr>zvzz
nmap <silent> <leader>n :cnext<cr>zvzz
nmap <silent> <leader>P :crewind<cr>zvzz
nmap <silent> <leader>N :clast<cr>zvzz

" switch buffers via location ([l and ]l in unimpaired)
"nmap <silent> <leader>k :lprevious<cr>zvzz
"nmap <silent> <leader>j :lnext<cr>zvzz
"nmap <silent> <leader>K :lrewind<cr>zvzz
"nmap <silent> <leader>J :llast<cr>zvzz


" }}}
" == Saving buffers ==================== {{{

" Remember last location in file, but not for commit messages.
" see :help last-position-jump
augroup line_return
    au!
    au BufReadPost *
      \ if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$") |
      \   execute 'normal! g`"zvzz' |
      \ endif
augroup END

" save and delete buffer without closing window (vim-bbye plugin)
nnoremap <C-@> :update<CR>:Bdelete<CR>
inoremap <C-@> <C-C>:update<CR>:Bdelete<CR>

" save with running vim tests
"nmap <silent> <leader>v :wall<CR>:Vader<CR>

" aggressively read/write buffers
augroup AutoWrite
  autocmd!
  autocmd FocusLost * :silent! wall
  autocmd BufLeave * :silent! update
augroup END
set autoread
"set autowrite           " ensure save when <C-^>
"set autowriteall

" Clean trailing whitespace and save
"nnoremap <leader>w mz:%s/\s\+$//e<cr>:let @/=''<cr>`z:w<cr>
nnoremap <silent> <leader>w :call TrimAndWrite()<cr>
function! TrimAndWrite()
  let l:p = getpos('.')
  silent! %s/\s\+$//e
  call setpos('.', l:p)
  write
endfunction
" }}}
" == Backup/Undo/Swap files =================== {{{
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

" }}}
" == folding ================= {{{

" Close all folds except the one(1) the cursor is on, and center.
nnoremap z1 zMzvzz

" Make zO (not zero) recursively open whatever top level fold we're in, no
" matter where the cursor happens to be, and center.
nnoremap zO zCzOzz

" In normal mode, press Space to toggle the current fold open/closed. However,
" if the cursor is not in a fold, move to the right (the default behavior). In
" addition, with the manual fold method, you can create a fold by visually
" selecting some lines, then pressing Space.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

let g:markdown_fold_style = 'nested'

" }}}
" == splits ==================== {{{
" set styling on vertical splits (hard space)
set fillchars=vert: 

set splitbelow
set splitright

" }}}
" == My Plugins ===================== {{{

"let g:one#handleSwapfileConflicts = 1     " 0=disable, 1=enable (def)
"let g:force_reload_textobj_sentence = 1
let g:litecorrect#typographic = 0
augroup various
  autocmd!
  autocmd FileType markdown,mkd
    \ call litecorrect#init()           |
    \ call lexical#init()               |
    \ call textobj#sentence#init()      |
    \ call textobj#quote#init()         |
    \ call pencil#init()
    " Limelight
  autocmd FileType text
    \ call litecorrect#init()           |
    \ call lexical#init({ 'spell': 0 }) |
    \ call textobj#sentence#init()      |
    \ call textobj#quote#init()         |
    \ call pencil#init()
    " Limelight
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
nnoremap <leader>r :OnlineThesaurusCurrentWord<CR>

"map <silent> <leader>c <Plug>ReplaceWithCurly
"map <silent> <leader>s <Plug>ReplaceWithStraight
map <silent> <leader>2 <Plug>SurroundWithDouble
map <silent> <leader>1 <Plug>SurroundWithSingle

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

" TEMPORARY see where this loads
"augroup mycustomhighlights
"  autocmd!
"  autocmd colorscheme *
"        \ hi cursor guibg=#5FD7A7 guifg=#80a0ff
"augroup END
"augroup MyCustomHighlights2
"  autocmd!
"  autocmd colorscheme *
"   \ highlight SpellBad   gui=bold guibg=#faa |
"   \ highlight SpellCap   gui=bold guibg=#faf |
"   \ highlight SpellRare  gui=bold guibg=#aff |
"   \ highlight SpellLocal gui=bold guibg=#ffa
"augroup END


"let g:pencil_neutral_headings = 1
let g:pencil_higher_contrast_ui = 0
let g:airline_theme = 'pencil'

" increase contrast for cursor line
"let g:pencil_focus = 1

"nmap <silent> <leader>A :ShiftPencil<cr>
nmap <leader>y <Plug>ThematicNext
nmap <leader>Y <Plug>ThematicRandom
nmap <leader>I :Thematic pencil_dark<CR>

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
\ 'latin':       { 'colorscheme': 'pencil',
\                  'background': 'dark',
\                  'font-size': 24,
\                  'fullscreen': 1,
\                  'laststatus': 0,
\                  'linespace': 8,
\                  'airline-theme': 'pencil',
\                  'typeface': 'Latin Modern Mono 10 Regular',
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
\                  'font-size': 24,
\                  'linespace': 7,
\                  'transparency': 25,
\                  'typeface': 'CosmicSansNeueMono',
\                },
\ 'hemi_lite'  : { 'colorscheme': 'hemisu',
\                  'background': 'light',
\                  'columns': 75,
\                  'typeface': 'Menlo',
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

" }}}
" == Ack ================== {{{

" Motions to Ack for things.  Works with pretty much everything, including:
"   w, W, e, E, b, B, t*, f*, i*, a*, and custom text objects
" Note: If the text covered by a motion contains a newline it won't work.  Ack
" searches line-by-line.

nnoremap <silent> <leader>a :set opfunc=<SID>AckMotion<CR>g@
xnoremap <silent> <leader>a :<C-U>call <SID>AckMotion(visualmode())<CR>

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

" }}}
" == CtrlP ================== {{{

" http://kien.github.com/ctrlp.vim/
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>m :CtrlPMRU<CR>
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

" The Silver Searcher (Note: not respecting wildignore!)
"if executable('ag')
"  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"
"  " ag is fast enough that CtrlP doesn't need to cache
"  let g:ctrlp_use_caching = 0
"  let g:ackprg = 'ag --smart-case --nogroup --nocolor --column'
"  set grepprg=ag\ --nogroup\ --nocolor
"endif

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

" }}}
" == NERDTree =================== {{{

" restore columns when disabling NERDTree; expand when enabling
func! MyNerdTree(mode)
  if exists("g:myNerdTreeCols") && g:myNerdTreeCols
    " NT was open, so close it, restoring columns
    NERDTreeClose
    exec "set columns=" . g:myNerdTreeCols
    let g:myNerdTreeCols = 0
  else
    " Open it, maximizing screen, but preserving original columns
    let g:myNerdTreeCols=&columns
    set columns=999
    if a:mode == 1
      NERDTree
    elseif a:mode == 2
      NERDTreeFind
    endif
  endif
endfunc

nmap <silent> <leader>t :call MyNerdTree(1)<cr>
nmap <silent> <leader>T :call MyNerdTree(2)<cr>
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

" }}}
" == Signify =================== {{{

" Try ]c and [c to jump between hunks
let g:signify_sign_change='~'
let g:signify_sign_delete='-'
let g:signify_sign_overwrite=0    " prevent dumping gutter
let g:signify_update_on_focusgained=1    " dumps gutter if overwrite=1
let g:signify_sign_color_inherit_from_linenr=1

" }}}
" == Airline =================== {{{

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

" }}}
" == Paragraph formatting ================ {{{

" join, maintaining cursor position
"nnoremap S i<cr><esc>^mzgk:silent! s/\v +$//<cr>:noh<cr>`z
"nnoremap J mzJ`z

nnoremap <silent> Q gwip
"nnoremap <silent> K vipJ
nnoremap <silent> <leader>J :let p=getpos('.')<bar>join<bar>call setpos('.', p)<cr>
"nnoremap <silent> <leader>Q :g/^/norm gqq<cr>
"nnoremap <silent> <leader>K :%norm vipJ<cr>

" TODO for writing mode only
nnoremap <silent> <leader>s :call MyParagraph(0)<cr>
nnoremap <silent> <leader>j :call MyParagraph(1)<cr>

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

" }}}

" vim:set ft=vim et sw=2:
