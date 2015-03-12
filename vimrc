" File: vimrc
"
" Author: created by reedes on 16-Feb-2013
" URL: https://github.com/reedes/vim-config
" Updated: continuously

set nocompatible

"{{{ == Plugin management
"filetype off

call plug#begin('~/.vim/bundle')

Plug 'junegunn/vim-plug'

" core
Plug 'tpope/vim-sensible'
Plug 'kana/vim-textobj-user'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'milkypostman/vim-togglelist'
Plug 'moll/vim-bbye'
Plug 'scrooloose/nerdtree'

"Plug 'gcavallanti/vim-noscrollbar'
"Plug 'corriander/vim-markdown-indent'

Plug 'tpope/vim-markdown'
"Plug 'tpope/vim-liquid'
"Plug 'godlygeek/tabular'
"Plug 'gabrielelana/vim-markdown'
" has an annoying set foldopen-=search
"Plug 'plasticboy/vim-markdown'
Plug 'mattly/vim-markdown-enhancements'
Plug 'nelstrom/vim-markdown-folding'
"Plug 'itspriddle/vim-marked'

"Plug 'jonhiggs/MacDict.vim'
"Plug 'kristijanhusak/vim-multiple-cursors'
"
"Plug 'garbas/vim-snipmate'
"Plug 'honza/vim-snippets'

"Plug 'kana/vim-operator-user'
"Plug 'rhysd/vim-operator-surround'
Plug 'mhinz/vim-signify'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'

"Plug 'tpope/vim-abolish'

"Plug '907th/vim-auto-save'
"Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
"Plug 'kana/vim-smartword'
"Plug 'tpope/vim-surround'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'kshenoy/vim-signature'

" # authored plugins
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-textobj-quote'
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-colors-pencil'
Plug 'reedes/vim-one'
Plug 'reedes/vim-thematic'
Plug 'reedes/vim-wheel'

" # color plugins
Plug 'baskerville/bubblegum'
Plug 'chriskempson/base16-vim'
Plug 'endel/vim-github-colorscheme'
Plug 'hmaarrfk/vim-colors-solarized'
Plug 'nanotech/jellybeans.vim'
Plug 'noahfrederick/vim-hemisu'
Plug 'jonathanfilip/vim-lucius'
Plug 'morhetz/gruvbox'

call plug#end()
"call vundle#end()
"}}}
"{{{ == BASIC

filetype indent plugin on

set nomodeline                  " disable mode lines as a security measure

" define a group `vimrc` and initialize, for single-line autocmds
augroup vimrc
  autocmd!
augroup END

" register autocmds to group `vimrc`.
"autocmd vimrc FileType cpp setlocal expandtab
"autocmd vimrc FileType make setlocal noexpandtab

" override Vim's own definition
"autocmd BufNewFile,BufRead *.md set filetype=markdown
"

"set encoding=utf-8    " set in vim-sensible
scriptencoding utf-8

if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
  let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
endif

" get out of insert mode
"inoremap kj <esc>l

"imap <leader>fn <c-r>=expand('%:t:r')<cr>

" Make the 'cw' and like commands put a $ at the end
" instead of just deleting the text and replacing it.
"set cpoptions+=$

" Various characters are 'wider' than normal fixed width
" characters, but the default setting of ambiwidth (single)
" squeezes them into 'normal' width, which sucks.
"set ambiwidth=double

" Add the unnamed register to the clipboard
" (shares with system clipboard)
"set clipboard+=unnamed

set expandtab                   " use spaces, not tabs (optional)
set fillchars=vert: 
set hidden                      " allow unwritten background buffers
set hlsearch                    " highlight matches
set ignorecase                  " searches are case insensitive...
set infercase
set list                        " show invisible characters
set nowrap                      " don't wrap lines
set shiftwidth=2                " a tab is two spaces (or set this to 4)
set shortmess=atI               " suppress PRESS ENTER messages by shortening messages
set cmdheight=2                 " more room to display messages
set smartcase                   " ... unless they contain at least one capital letter
set splitbelow
set splitright
set synmaxcol=800               " Don't try to lines highlight longer than 800 characters.
set tabstop=2
set visualbell                  " avoid beeping

if has('unix')
  set shell=/bin/bash\ -i       " make Vim’s :! shell behave like your command prompt
endif

"set noautochdir     " macvim HEAD was setting autochdir true by default

"nmap <leader>M :delm! | delm A-Z0-9<cr>

" Make the current file executable
"nmap <leader>x :w<cr>:!chmod 755 %<cr>:e<cr><cr>

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
"iab mdyhm <c-r>=strftime("%A %B %d, %Y %I:%M %p")<CR>
"iab isodate <c-r>=strftime("%FT%T%z")<CR>

let g:mapleader = ','             " <Leader> key instead of backslash (options '\_,;')

" select what was just pasted
"nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

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
"au BufWritePost $HOME/.vim/vimrc so $HOME/.vim/vimrc
"}}}
" == Redraw  {{{
"
" Don't update the display while executing macros
"set lazyredraw

" Don't show the current command int he lower right corner.
" In OSX, if this is set and lazyredraw is set then it's
" slow as molasses, so we unset this
"set noshowcmd

"nnoremap / /\v
"vnoremap / /\v

"make <c-l> clear the highlight as well as redraw screen
noremap <silent> <C-l> :<C-u>nohlsearch<cr><C-l>
inoremap <silent> <C-l> <C-o>:nohlsearch<cr>
" Use <C-L> to clear the highlighting of :set hlsearch.
"if maparg('<C-L>', 'n') ==# ''
"  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
"endif

" }}}
" == Navigating buffers  {{{

" jump to the first open window that has buffer
"set switchbuf=useopen

" from insert mode, jump to last active buffer
inoremap <C-^> <C-C><C-^>
"inoremap <C-^> <C-C>:update<CR><C-^>
"map <leader>x :bprevious<cr>:bdelete #<cr>

" switch buffers ([b and ]b in unimpaired)
map <C-p> :bprevious<CR>
map <C-n> :bnext<CR>

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
" == Saving buffers {{{

" Remember last location in file, but not for commit messages.
" see :help last-position-jump
" Not working well with save -- cursor jumping
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

" aggressively load buffers
set autoread

" aggressively save buffers
" - saves on quit, exit, or buffer switch
" - saves on exiting insert mode, or losing focus
" - autoexits to normal mode after 15 seconds of inactivity
set autowriteall
augroup save_helpers
  autocmd!
  autocmd FocusLost * nested silent! wall

  " the following line screws up `[ and '[
  "autocmd BufLeave,InsertLeave * if expand('%') != '' | update | endif

  autocmd CursorHoldI * stopinsert
  autocmd InsertEnter * let updaterestore=&updatetime | set updatetime=15000
  autocmd InsertLeave * let &updatetime=updaterestore

  " Remove any trailing whitespace that is in the file
  autocmd BufRead,BufWrite * if ! &bin | silent! :call TrimAndWrite()<cr> | endif
augroup END

"nnoremap <leader>w mz:%s/\s\+$//e<cr>:let @/=''<cr>`z:w<cr>
"nnoremap <silent> <leader>w :call TrimAndWrite()<cr>
function! TrimAndWrite()
  let l:p = getpos('.')
  silent! %s/\s\+$//ge
  call setpos('.', l:p)
  write
endfunction
" }}}
" == Backup/Undo/Swap files {{{
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
" == Folding  {{{

" automatically open folds on
" Default "block,hor,mark,percent,quickfix,search,tag,undo"
"set foldopen+=search

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

" surround the selection with {{{ }}}
"vnoremap <Space> zf

let g:markdown_folding = 1
let g:markdown_fold_style = 'nested'
let g:markdown_fenced_languages = ['vim',]

" }}}
" == My Plugins {{{

"let g:one#handleSwapfileConflicts = 1     " 0=disable, 1=enable (def)
"let g:force_reload_textobj_sentence = 1
augroup prose
  autocmd!
  "autocmd FileType markdown,mkd call pencil#init() |
  "                            \ call lexical#init() |
  "                            \ call litecorrect#init() |
  "                            \ call textobj#quote#init() |
  "                            \ call textobj#sentence#init() |
  "                            \ setlocal ruler nonumber |
  "                            \ nnoremap <buffer> <silent> Q gwip |
  "                            \ setl fdl=4 noru nonu nornu |
  "                            \ setl fdo+=search
  "autocmd Filetype git,gitcommit,gitsendemail,hgcommit,svn,*commit*,*COMMIT* |
  "                            \ call pencil#init({'wrap': 'hard', 'textwidth': 72}) |
  "                            \ call litecorrect#init() |
  "                            \ setl spell spl=en_us et sw=2 ts=2 noai
  "autocmd Filetype mail         call pencil#init({'wrap': 'hard', 'textwidth': 60}) |
  "                            \ call litecorrect#init() |
  "                            \ setl spell spl=en_us et sw=2 ts=2 noai nonu nornu
  "autocmd Filetype html,xml     call pencil#init({'wrap': 'soft'}) |
  "                            \ call litecorrect#init() |
  "                            \ setl spell spl=en_us et sw=2 ts=2
  autocmd FileType markdown,mkd call Prose()
  autocmd FileType text         call Prose()
  "autocmd FileType tex          call pencil#init({'wrap': 'hard'})
  "autocmd FileType rst          call Prose()
augroup END

"augroup pencil
"  autocmd!
"  autocmd FileType markdown,mkd,text,asciidoc call pencil#init()
"                                 \ | call lexical#init()
"                                 \ | call litecorrect#init()
"                                 \ | call textobj#quote#init()
"                                 \ | call textobj#sentence#init()
"augroup END

" Avoid loading of MatchParen, per pi_paren.txt
"let loaded_matchparen = 1

" Move visual block
vnoremap <D-j> :m '>+1<CR>gv=gv
vnoremap <D-k> :m '<-2<CR>gv=gv

"let g:wheel#map#up   = '<D-k>'
"let g:wheel#map#down = '<D-j>'
"let g:wheel#map#mouse = -1
"
let g:lexical#spelllang = ['en_us',]
let g:lexical#spell_key = '<leader>u'
let g:lexical#thesaurus_key = '<leader>j'
let g:lexical#dictionary_key = '<leader>k'
let g:pencil#softDetectSample = 40
let g:pencil#softDetectThreshold = 100
let g:pencil#wrapModeDefault = 'hard'

"map <F7> "dyiw:call MacDict(@d)<CR>

"let g:online_thesaurus_map_keys = 0
"nnoremap <leader>r :OnlineThesaurusCurrentWord<CR>

map <F10> :echo "hi<"
\ . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

nmap <F9> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"let g:pencil_heading_color = 'green'   " ''=neutral
let g:pencil_higher_contrast_ui = 0
let g:airline_theme = 'pencil'
let g:pencil_neutral_code_bg = 0
"let g:pencil_spell_undercurl = 1     " 0=underline (def), 1=undercurl

"nmap <silent> <leader>A :ShiftPencil<cr>
nmap <leader>y <Plug>ThematicNext
nmap <leader>Y <Plug>ThematicRandom
nmap <leader>I :Thematic pencil_lite<CR>

set background=dark
colorscheme pencil
"colorscheme desert

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
\ 'ruler': 0,
\ }
let g:thematic#themes = {
\ 'bubblegum'  : { 'sign-column-color-fix': 1,
\                  'columns': 80,
\                  'lines': 30,
\                  'linespace': 9,
\                  'sign-column': 1,
\                  'fold-column-color-mute': 1,
\                  'number-column-color-mute': 1,
\                  'typeface': 'Cutive Mono',
\                },
\ 'pencil_lite' :{ 'colorscheme': 'pencil',
\                  'airline-theme': 'pencil',
\                  'background': 'light',
\                  'columns': 84,
\                  'lines': 24,
\                  'font-size': 20,
\                  'laststatus': 0,
\                  'fullscreen': 1,
\                  'ruler': 1,
\                  'linespace': 8,
\                  'typeface': 'Cousine',
\                },
\ 'pencil_dark': { 'colorscheme': 'pencil',
\                  'background': 'dark',
\                  'font-size': 20,
\                  'laststatus': 0,
\                  'linespace': 8,
\                  'airline-theme': 'pencil',
\                  'typeface': 'Menlo',
\                },
\ 'latin':       { 'colorscheme': 'lucius',
\                  'background': 'light',
\                  'font-size': 24,
\                  'columns': 75,
\                  'laststatus': 0,
\                  'linespace': 8,
\                  'typeface': 'Latin Modern Mono 10 Regular',
\                },
\ 'traditional': { 'colorscheme': 'lucius',
\                  'background': 'light',
\                  'font-size': 20,
\                  'columns': 75,
\                  'laststatus': 0,
\                  'linespace': 8,
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
\                  'typeface': 'Verily Serif Mono',
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
\ 'github'     : { 'background': 'light',
\                  'typeface': 'Oxygen Mono Regular',
\                },
\ 'gruvbox_lite' : { 'colorscheme': 'gruvbox',
\                  'background': 'light',
\                  'columns': 75,
\                  'typeface': 'AurulentSansMono-Regular',
\                },
\ 'gruvbox_dark' : { 'colorscheme': 'gruvbox',
\                  'background': 'dark',
\                  'columns': 75,
\                  'typeface': 'OCRA Regular',
\                },
\ }


"let g:thematic#theme_name = 'pencil_lite'

" }}}
" == Text editing  {{{

"function! Foo(direction, mode)
"  " TODO support insert mode
"  " TODO support visual mode
"  " TODO rotate among recent corrections by pressing repeatedly?
"  let l:save_cursor = getcurpos()
"  let l:orig_line = line('.')
"  let l:orig_col = col('.')
"
"  if a:direction < 0
"    sil norm! [s
"  el
"    sil norm! ]s
"  en
"
"  " if not moved, then bail (spelling not enabled?)
"  if l:orig_line ==# line('.') && l:orig_col ==# col('.')
"    retu
"  en
"
"  " if moved, set to end of word that we'll correct
"  sil norm! e
"
"  " correct the misspelling with the first suggested correction
"  " (if available) and jump to the end of the result, which
"  " may be unchanged
"  let l:pre_correct_col = col('.')
"  sil norm! 1z=e
"  let l:post_correct_col = col('.')
"
"  let l:same_line = (line('.') ==# l:orig_line)
"
"  " restore original cursor position
"  call setpos('.', l:save_cursor)
"
"  " if spelling was on same line, adjust cursor position
"  if l:same_line
"    let l:diff = l:pre_correct_col - l:post_correct_col
"    "echom 'pre=' . l:pre_correct_col . ' post=' . l:post_correct_col . ' diff=' . l:diff
"    if l:diff ># 0
"      exe 'sil norm! ' . l:diff . 'h'
"    elsei l:diff <# 0
"      exe 'sil norm! ' . (-1*l:diff) . 'l'
"    en
"  en
"  if a:mode ==# 'i'
"    startinsert
"  en
"endf

function! Prose()

  "nnoremap W ]s      needed to skip over words separated by spaces
  "nnoremap B [s

  " add two lines after the current line
  "nmap <leader>o o<cr>

  " force top correction on most recent misspelling
  nnoremap <buffer> <c-s> [s1z=<c-o>
  inoremap <buffer> <c-s> <c-g>u<Esc>[s1z=`]A<c-g>u
  "nn  <buffer> <c-s> :call Foo(-1, 'n')<cr>
  ""vn  <buffer> <c-s> :<C-u>call foo(-1, visualmode())<cr>
  "ino <buffer> <c-s> <c-g>u<Esc><C-o>:call Foo(-1, 'i')<cr><c-g>u

  " Replace common punctuation
  "iab <buffer> -- –
  "iab <buffer> --- —
  "iab <buffer> ... …
  "iab <buffer> << «
  "iab <buffer> >> »
  "
  "if exists('*litecorrect#init')
    call litecorrect#init()
  "en
  "if exists('*lexical#init')
    call lexical#init()
  "en
  "if exists('*textobj#sentence#init')
    call textobj#sentence#init()
  "en
  "if exists('*textobj#quote#init')
    call textobj#quote#init()
    map <silent> <leader>c <Plug>ReplaceWithCurly
    map <silent> <leader>s <Plug>ReplaceWithStraight
    map <silent> <leader>2 <Plug>SurroundWithDouble
    map <silent> <leader>1 <Plug>SurroundWithSingle
  "en
  "if exists('*pencil#init')
    call pencil#init()
  "en

  "if exists('*wordy#init')
    "nnoremap <silent> K :NextWordy<cr>
    noremap <silent> <F8> :<C-u>NextWordy<cr>
    inoremap <silent> <F8> <C-o>:NextWordy<cr>
  "en

  "LimeLight0.7

  setlocal foldlevel=6

  " join, maintaining cursor position
  "nnoremap S i<cr><esc>^mzgk:silent! s/\v +$//<cr>:noh<cr>`z
  "nnoremap J mzJ`z

  nnoremap <silent> Q gwip
  "nnoremap <silent> K vipJ
  "nnoremap <silent> <leader>J :let p=getpos('.')<bar>join<bar>call setpos('.', p)<cr>
  "nnoremap <silent> <leader>Q :g/^/norm gqq<cr>
  "nnoremap <silent> <leader>K :%norm vipJ<cr>

  nnoremap <silent> <leader>S :call MyParagraph(0)<cr>
  nnoremap <silent> <leader>J :call MyParagraph(1)<cr>

  " delete or replace most inner surround

  "" if you use vim-textobj-quote
  "nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-quote-a)
  "nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-quote-a)
  "
  "" if you use vim-textobj-sentence
  "nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-sentence-a)
  "nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-sentence-a)

  " Kana's smartword support GGGGG
  "map w  <Plug>(smartword-w)
  "map b  <Plug>(smartword-b)
  "map e  <Plug>(smartword-e)
  "map ge <Plug>(smartword-ge)
  "
  " https://github.com/q335r49/vimrc/blob/b17b7b129fb610acf7dcd93d099fb1187c28ac40/vimrc
  "let b:CapStarters=".?!\<nl>\<cr>\<tab>\<space>"
  "let b:CapSeparators="\<nl>\<cr>\<tab>\<space>"
  "nm <buffer> <silent> O O^<Left><C-R>=CapWait("\r")<CR>
  "nm <buffer> <silent> o o^<Left><C-R>=CapWait("\r")<CR>
  "nm <buffer> <silent> cc cc^<Left><C-R>=CapHere()<CR>
  "nm <buffer> <silent> C C^<Left><C-R>=CapHere()<CR>
  "nm <buffer> <silent> I I^<Left><C-R>=CapHere()<CR>
  "im <buffer> <silent> <CR> <CR>^<Left><C-R>=CapWait("\r")<CR>
  "im <buffer> <silent> <NL> <NL>^<Left><C-R>=CapWait("\n")<CR>

  "syntax region Bold matchgroup=Normal start=+\(\W\|^\)\zs\*\ze\w+ end=+\w\zs\*+ concealends
  "syntax region Underline matchgroup=Normal start=+\(\W\|^\)\zs\/\ze\w+ end=+\w\zs\/+ concealends
  "syntax match Label +^txb\S*: \zs.[^#\n]*+ oneline display
  "setl noai
  "ino <buffer> <silent> <F6> <ESC>mt:call search("'",'b')<CR>x`ts
endfunction

"command! -nargs=0 BookEnglisch call lexical#init({
"                    \ 'spell': 1,
"                    \ 'spelllang':  ['en_us'],
"                    \ 'dictionary': ['/usr/share/dict/words'],
"                    \ })
"
"command! -nargs=0 BookGerman call lexical#init({
"                    \ 'spell': 1,
"                    \ 'spelllang':  ['de_20'],
"                    \ 'dictionary': ['~/.vim/spell/gerspchk.dict'],
"                    \ 'spellfile': ['~/.vim/spell/de.utf-8.add'],
"                    \ })

"let g:EscChar="\e"
"let g:charL=[]
"fun! CapWait(prev)
"  call add(g:charL,a:prev)
"  redr | let next=nr2char(getchar())
"  if next==g:EscChar || empty(next)
"    let g:charL=[]
"    return "\<del>".(next==g:EscChar? "\<esc>":"")
"  elseif stridx(b:CapStarters,next)!=-1
"    exe 'norm! i' . next . "\<right>"
"    if len(g:charL)>0 && next=='.' && g:charL[-1]=='.'
"      let g:charL=[]
"      return "\<del>"
"    el| return CapWait(next) |en
"  elseif stridx(b:CapSeparators,a:prev)!=-1
"    let g:charL=[]
"    return (next=~#'[A-Z]'? tolower(next) : toupper(next)). "\<del>"
"  el| let g:charL=[]
"    return next."\<del>"
"  endif
"endfun
"fun! CapHere()
"  let trunc = getline(".")[:col(".")-2]
"  return col(".")==1 ? (b:CapSeparators!=' '? CapWait("\r") : "\<del>") : (trunc=~'[?!.]\s*$\|^\s*$' && trunc!~'\.\.\s*$') ? (CapWait(trunc[-1:-1])) : "\<del>"
"endfun

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
" == Ack  {{{

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
" == CtrlP  {{{

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
"let g:ctrlp_user_command = 'mdfind -onlyin %s file'

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
" == NERDTree {{{

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
autocmd vimrc bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" }}}
" == Signify {{{

" Try ]c and [c to jump between hunks
let g:signify_disable_by_default = 0
"let g:signify_sign_change='~'
"let g:signify_sign_delete='-'
"let g:signify_sign_overwrite=0    " prevent dumping gutter
"let g:signify_update_on_focusgained=1    " dumps gutter if overwrite=1
"let g:signify_sign_color_inherit_from_linenr=1
let g:signify_vcs_list = [ 'svn', 'git' ]
" test

" }}}
" == Airline {{{

set statusline=%<%f\ %h%m%r%w\ \ %{PencilMode()}\ %=\ col\ %c%V\ \ line\ %l\,%L\ %P
set rulerformat=%-12.(%l,%c%V%)%{PencilMode()}\ %P

let g:airline#extensions#whitespace#show_message = 0
let g:airline#extensions#whitespace#checks = [ ]
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_linecolumn_prefix = ''
let g:airline_fugitive_prefix = '⎇'
let g:airline_paste_symbol = 'ρ'
let g:airline_section_x = "%{strlen(&ft)?&ft:'none'} %{PencilMode()}"

"function! Noscrollbar(...)
"    let w:airline_section_y = '%{noscrollbar#statusline(20,"∙","×")}'
"endfunction
"call airline#add_statusline_func('Noscrollbar')

" }}}
" == Lightline {{{

"set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" }}}
" == Multi-cursor {{{

  " Default mapping
"let g:multi_cursor_next_key='<D-n>'
"let g:multi_cursor_prev_key='<D-p>'
"let g:multi_cursor_skip_key='<D-x>'
"let g:multi_cursor_quit_key='<Esc>'
"" Map start key separately from next key
"let g:multi_cursor_start_key='<F6>'
" }}}
" == Surround {{{

" operator mappings for rhysd/vim-operator-surround
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)

" }}}
" == Macvim {{{
" Warning: causes virtual mode ctrl-f and ctrl-b to lose their selection
"if has("gui_macvim")
"  let macvim_hig_shift_movement = 1
"endif
"}}}
" == Schlepp {{{
"""""""""
"let g:Schlepp#allowSquishingLines = 1
"let g:Schlepp#allowSquishingBlocks = 1
"vmap <unique> <left>  <Plug>SchleppLeft
"vmap <unique> <up>    <Plug>SchleppUp
"vmap <unique> <down>  <Plug>SchleppDown
"vmap <unique> <right> <Plug>SchleppRight
"vmap <unique> <S-up>   <Plug>SchleppIndentUp
"vmap <unique> <S-down> <Plug>SchleppIndentDown"}}}

"function! YouToWe(target, mode, visual)
"  " Extract the target text...
"  if len(a:visual) > 0
"      silent normal! gvy
"  else
"      silent normal! vipy
"  endif
"  let l:text = getreg(v:register)
"  let l:opts = 'g'
"
"  if a:target ==# 3
"    "  first person plural
"    let l:text = substitute(l:text, '\C\<Your\>', 'Our', l:opts)
"    let l:text = substitute(l:text, '\C\<your\>', 'our', l:opts)
"    let l:text = substitute(l:text, '\C\<You\>', 'We', l:opts)
"    let l:text = substitute(l:text, '\C\<you did\>', 'we did', l:opts)
"    let l:text = substitute(l:text, '\C\<you\>', 'we|us', l:opts)
"    " <verb>you => <verb>us
"    " of you => of us
"    " you<verb> => we<verb>
"  elseif a:target ==# 2
"    " second person singular
"    let l:text = substitute(l:text, '\C\<Our\>', 'Your', l:opts)
"    let l:text = substitute(l:text, '\C\<our\>', 'your', l:opts)
"    let l:text = substitute(l:text, '\C\<We\>', 'You', l:opts)
"    let l:text = substitute(l:text, '\C\<\(we\|us\)\>', 'you', l:opts)
"  endif
"  " TODO if doing We/You to he, need to pluralize verb
"  " 'We eat' => 'He eats'
"  " And singularize in reverse
"  " TODO support curly quotes
"
"  " Paste back into buffer in place of original...
"  call setreg(v:register, l:text, mode())
"  silent normal! gvp
"endfunction
"nnoremap ,r :call YouToWe(3, 1, '')<cr>
"vnoremap ,r :<C-u>call YouToWe(3, 1, visualmode())<cr>
"nnoremap ,R :call YouToWe(2, 1, '')<cr>
"vnoremap ,R :<C-u>call YouToWe(2, 1, visualmode())<cr>

" vim:set ft=vim et sw=2:
