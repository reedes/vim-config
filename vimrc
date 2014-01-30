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

" # Authored Bundles
Bundle 'reedes/vim-bubbler'
Bundle 'reedes/vim-lexical'
Bundle 'reedes/vim-litecorrect'
Bundle 'reedes/vim-quotable'
Bundle 'reedes/vim-thematic'
Bundle 'reedes/vim-pencil'
Bundle 'reedes/vim-colors-pencil'
Bundle 'reedes/vim-wordy'
Bundle 'reedes/vim-textobj-sentence'

" # Non-color Bundles
Bundle 'airblade/vim-gitgutter'
Bundle 'bling/vim-airline'
Bundle 'kana/vim-textobj-user'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'milkypostman/vim-togglelist'
Bundle 'moll/vim-bbye'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-unimpaired'
"Bundle 'kana/vim-vspec'
Bundle 'junegunn/vader.vim'

" # Color Bundles
Bundle 'hmaarrfk/vim-colors-solarized'
Bundle 'baskerville/bubblegum'
Bundle 'chriskempson/base16-vim'
Bundle 'endel/vim-github-colorscheme'
Bundle 'nanotech/jellybeans.vim'
Bundle 'noahfrederick/vim-hemisu'

syntax on
filetype plugin indent on

set expandtab                   " use spaces, not tabs (optional)
set hlsearch                    " highlight matches
set ignorecase                  " searches are case insensitive...
set laststatus=2
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
"nnoremap <silent> K :nohlsearch<CR>

" select what was just pasted
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" cursor movement synced with scroll - cursor maintains viewport position
nnoremap <C-j> gj<C-e>
nnoremap <C-k> gk<C-y>

"nnoremap <silent> Q gwip
"nnoremap <silent> K vipJ
"nnoremap <silent> <leader>Q :g/^/norm gqq<cr>
"nnoremap <silent> <leader>K :%norm vipJ<cr>

" For quick recordings just type qq to start recording, then q to stop. You
" don't have to worry about the name this way (you just named the recording
" 'q'). Now, to play back the recording you just type Q.
"nnoremap Q @q
"noremap <Space> @q

" Clean trailing whitespace and save
"nnoremap <leader>w mz:%s/\s\+$//e<cr>:let @/=''<cr>`z:w<cr>
nnoremap <silent> <leader>w :call TrimAndWrite()<cr>
function! TrimAndWrite()
  let l:p = getpos('.')
  silent! %s/\s\+$//e
  call setpos('.', l:p)
  write
endfunction

" # Quick Editing - edit vimrc file and others
" NOTE pointing to all files in vim dir so that can easily
"      browse directory using NERDTreeFind (<leader>T).
nnoremap <silent> <leader>e :edit ~/.vim/vimrc<cr>
nnoremap <silent> <leader>E :wall<cr>:source ~/.vim/vimrc<cr>

" Make sure Vim returns to the same line when you reopen a file.
" see :help last-position-jump
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" automatically save all buffers when focus is lost
autocmd FocusLost * :silent! wall

" delete buffer without closing window (vim-bbye plugin)
nmap <C-@> :Bdelete<CR>

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

" # Backup, Undo and NoSwap
set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.

set undofile                      " Save undo's after file closes
set undolevels=1000               " How many undos
set undoreload=10000              " number of lines to save for undo

set backupdir=~/.vim/tmp/backup// " backups
set undodir=~/.vim/tmp/undo//     " undo files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand("~/.vim/tmp/backup"))
    call mkdir(expand("~/.vim/tmp/backup"), "p")
endif
if !isdirectory(expand("~/.vim/tmp/undo"))
    call mkdir(expand("~/.vim/tmp/undo"), "p")
endif

" Close all folds except the one(1) the cursor is on, and center.
nnoremap z1 zMzvzz

" Make zO (not zero) recursively open whatever top level fold we're in, no
" matter where the cursor happens to be, and center.
nnoremap zO zCzOzz

" set styling on vertical splits (hard space)
set fillchars=vert: 

set splitbelow
set splitright

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
"call matchadd('ColorColumn', '\%81v', 100)
"let g:force_reload_quotable = 1
"let g:textobj#sentence#select = 'x'

"set nomodeline
"set modelines=0
augroup various
  autocmd!
  autocmd FileType markdown
    \ call litecorrect#init()           |
    \ call lexical#init()               |
    \ call textobj#sentence#init()      |
    \ call quotable#init()              |
    \ call bubbler#init()              |
    \ call pencil#init()
  autocmd FileType text
    \ call litecorrect#init()           |
    \ call lexical#init({ 'spell': 0 }) |
    \ call textobj#sentence#init()      |
    \ call quotable#init()              |
    \ call pencil#init()
  autocmd FileType python
    \ call quotable#init({ 'educate': 0 })
augroup END

let g:lexical#spelllang = ['en_us',]
let g:lexical#spell_key = '<leader>u'
let g:lexical#thesaurus_key = '<leader>j'
let g:lexical#dictionary_key = '<leader>k'
let g:pencil#softDetectSample = 15
let g:pencil#wrapModeDefault = 'hard'
"nmap <leader>u <Plug>LexicalSpell
"nmap <leader>j <Plug>LexicalThesaurus
"nmap <leader>k <Plug>LexicalDictionary

map <silent> <leader>c <Plug>QuotableReplaceWithCurly
map <silent> <leader>s <Plug>QuotableReplaceWithStraight
nmap <silent> <leader>A :ShiftPencil<cr>
"nmap <silent> <D-9> <Plug>ThematicNarrow
"nmap <silent> <D-0> <Plug>ThematicWiden
nmap <Leader>y <Plug>ThematicNext
nmap <Leader>Y <Plug>ThematicRandom
nmap <Leader>I :Thematic pencil_dark<CR>

" use jellybeans as default airline theme as it maps from
" existing colors
let g:thematic#defaults = {
\ 'airline-theme': 'jellybeans',
\ 'fullscreen-background-color-fix': 1,
\ 'sign-column-color-fix': 1,
\ 'laststatus': 2,
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
\                  'airline-theme': 'light',
\                  'typeface': 'Cousine',
\                },
\ 'pencil_dark': { 'colorscheme': 'pencil',
\                  'background': 'dark',
\                  'font-size': 20,
\                  'fullscreen': 1,
\                  'laststatus': 0,
\                  'linespace': 8,
\                  'airline-theme': 'badwolf',
\                  'typeface': 'Anonymous Pro',
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


let g:thematic#theme_name = 'pencil_dark'


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

" # CtrlP (navigation)
" http://kien.github.com/ctrlp.vim/
nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader>m :CtrlPMRU<CR>
"let g:ctrlp_map = '<c-p>'
let g:ctrlp_map = '<Leader>f'
let g:ctrlp_working_path_mode = 0      " don't manage
let g:ctrlp_by_filename = 1            " only consider filename, not full path
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }

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
nmap <silent> <leader>t :set columns=999<CR>:NERDTreeToggle<CR>
nmap <silent> <leader>T :set columns=999<CR>:NERDTreeFind<CR>
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

" vim:set ft=vim et sw=2:
