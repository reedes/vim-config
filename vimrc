
" File: vimrc
"
" Author: created by reede on 16-Feb-2013
" Updated: continuously
" URL: https://reedes@bitbucket.org/reedes/vim-config.git (old)
" URL: https://github.com/reedes/vim-config
"
" Guidelines:
" - experiment freely, but disable unused configuration
" - minimize time-eating automatic behaviors, like syntax check
"
" :help map-which-keys
" :help index
"
" Interesting vim projects: {{{1
"  http://blog.begriffs.com/2012/09/bespoke-vim.html
"  https://github.com/amix/vimrc
"  https://github.com/carlhuda/janus
"  https://github.com/mrmargolis/vim_files
"  https://github.com/skwp/dotfiles
"  https://github.com/spf13/spf13-vim
"  https://github.com/vgod/vimrc
"  https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
"  https://bitbucket.org/sjl/dotfiles/src/cbbbc897e9b3/vim/vimrc
"  http://github.com/lucasoman/Conf/raw/master/.vimrc
"  https://github.com/square/maximum-awesome/blob/master/vimrc
"  http://atp-vim.sourceforge.net/vimrc
" }}}1

set nocompatible

"  # VUNDLE (package management) {{{1
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let vundle manage itself
Bundle 'gmarik/vundle'

" # Authored Bundles {{{2
Bundle 'reedes/vim-lexical'
Bundle 'reedes/vim-litecorrect'
Bundle 'reedes/vim-quotable'
Bundle 'reedes/vim-thematic'
Bundle 'reedes/vim-pencil'
Bundle 'reedes/vim-colors-pencil'
Bundle 'reedes/vim-wordy'
"Bundle 'reedes/vim-birdseye'
" }}}2
" # Non-color Bundles {{{2
Bundle 'airblade/vim-gitgutter'
Bundle 'bling/vim-airline'
Bundle 'kana/vim-textobj-user'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'milkypostman/vim-togglelist'
Bundle 'moll/vim-bbye'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
"Bundle 'tpope/vim-vinegar'
"Bundle 'justinmk/vim-sneak'
"Bundle 'mhinz/vim-signify'
"Bundle 'nelstrom/vim-markdown-folding'
"Bundle 'plasticboy/vim-markdown'
"Bundle 'regedarek/ZoomWin'
"Bundle 'roman/golden-ratio'
"Bundle 'sophacles/vim-bundle-python'
"Bundle 'spolu/dwm.vim'
"Bundle 'tpope/vim-markdown'
"Bundle 'tpope/vim-repeat'
"Bundle 'zhaocai/GoldenView.Vim'
" }}}2
" # Color Bundles {{{2
Bundle 'Lokaltog/vim-distinguished'
Bundle 'hmaarrfk/vim-colors-solarized'
Bundle 'baskerville/bubblegum'
Bundle 'chriskempson/base16-vim'
Bundle 'endel/vim-github-colorscheme'
Bundle 'nanotech/jellybeans.vim'
Bundle 'therubymug/vim-pyte'
Bundle 'twerth/ir_black'
Bundle 'vim-scripts/summerfruit256.vim'
Bundle 'zeis/vim-kolor'
Bundle 'noahfrederick/vim-hemisu'
" }}}2
" }}}1
" # LOCAL {{{1
" # First things first {{{2

syntax on     " seems to be important for colorscheme loading
filetype plugin indent on

set complete-=i                 " remove: scan current and included files
set fileformats+=mac
set history=1000
set nrformats-=octal
set scrolloff=1                 " min number of lines above or below the cursor
set synmaxcol=800               " Don't try to lines highlight longer than 800 characters.
set ttimeout
set ttimeoutlen=50              " per vim-airline wiki
set viminfo^=!

" text wrapping
set nowrap                      " don't wrap lines
set sidescrolloff=5             " for unwrapped lines, sidescroll when this close to edge

" display (should be in thematic?)
set list                        " show invisible characters
set laststatus=2

" display (other)
set shortmess=atI               " suppress PRESS ENTER messages by shortening messages
set showcmd
set showmatch                   " show matching bracket/paren on insert
set visualbell                  " avoid beeping
set wildmenu

" tabs/indent/backspace
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set smarttab
set autoindent
set backspace=indent,eol,start
set expandtab                   " use spaces, not tabs (optional)
set shiftround

" search
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set incsearch
set hlsearch                    " highlight matches

if has('unix')
  set shell=/bin/bash\ -i         " make Vim’s :! shell behave like your command prompt
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
  endif
endif

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
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

" }}}2
" # Abbreviations {{{2

iab mdy <c-r>=strftime("%B %d, %Y")<CR>
iab mdyhm <c-r>=strftime("%A %B %d, %Y %I:%M %p")<CR>
iab isodate <c-r>=strftime("%FT%T%z")<CR>

" }}}2
" # Misc Key Mappings {{{2

let mapleader = ","             " <Leader> key instead of backslash (options '\_,;')

"nnoremap S i<cr><esc>^mzgk:silent! s/\v +$//<cr>:noh<cr>`z
nnoremap J mzJ`z
"nnoremap <silent> K :nohlsearch<CR>

" select what was just pasted
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

nnoremap <silent> Q gqip
nnoremap <silent> K vipJ
nnoremap <silent> <leader>Q ggVGgq
nnoremap <silent> <leader>K :%norm vipJ<cr>

" For quick recordings just type qq to start recording, then q to stop. You
" don't have to worry about the name this way (you just named the recording
" 'q'). Now, to play back the recording you just type Q.
"nnoremap Q @q
"noremap <Space> @q

" Clean trailing whitespace and save
"nnoremap <leader>w mz:%s/\s\+$//e<cr>:let @/=''<cr>`z:w<cr>
nnoremap <silent> <leader>w :call TrimAndWrite()<cr>
function! TrimAndWrite()
  let l:p=getpos('.')
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

"fun! SpellBadWord(word)
"    let sp = spellbadword(a:word)
"    if sp== [ '', '' ]
"  let sp = [ a:word, 'good' ]
"    endif
"    return sp
"endfun
"nnoremap =s :echo SpellBadWord(expand("<cword>"))<CR>

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
"cnoremap %% <C-R>=expand('%:h').'/'<cr>

" identify syntax highlighting group at cursor
"map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
"\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
"\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" }}}2
" # Swap/Move {{{2

" nnoremap <leader>V V`]          " Easier linewise reselection of what you just pasted.
"
" move sentence backwards/forwards
" not working if on space between sentences
" <C-U> remove selection, if any
"nnoremap <leader>7 f.vasd(P`[v`]
"vnoremap <leader>7 vvasd(P`[v`]
"nnoremap <leader>8 f.vasd)P`[v`]
"vnoremap <leader>8 vvasd)P`[v`]

" }}}2
" # Buffers {{{2

set hidden                      " Allow backgrounding buffers without writing them,
set autoread

"autocmd FileType python,xquery autocmd BufWritePre <buffer> :%s/\s\+$//e

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

" is this an airline thing?
"let g:bufferline_echo = 0

" }}}2
" # Backup, Undo and NoSwap {{{2
set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.

set undofile                      " Save undo's after file closes
set undolevels=1000               " How many undos
set undoreload=10000              " number of lines to save for undo

set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set undodir=~/.vim/tmp/undo//     " undo files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand("~/.vim/tmp/backup"))
    call mkdir(expand("~/.vim/tmp/backup"), "p")
endif
if !isdirectory(expand("~/.vim/tmp/swap"))
    call mkdir(expand("~/.vim/tmp/swap"), "p")
endif
if !isdirectory(expand("~/.vim/tmp/undo"))
    call mkdir(expand("~/.vim/tmp/undo"), "p")
endif

" Make Vim able to edit crontab files again.
"set backupskip=/tmp/*,/private/tmp/*"
" }}}2
" # Folding {{{2
"
" Toggle folds with space bar, and center.
"nnoremap <Space> zazz
"vnoremap <Space> zazz

" Close all folds except the one(1) the cursor is on, and center.
nnoremap z1 zMzvzz

" Make zO (not zero) recursively open whatever top level fold we're in, no
" matter where the cursor happens to be, and center.
nnoremap zO zCzOzz
" }}}2
" # Windowing {{{2
"
" Map ctrl-movement keys to window switching
"map <C-H> <C-W>h
"map <C-J> <C-W>j
"map <C-K> <C-W>k
"map <C-L> <C-W>l

" set styling on vertical splits (hard space)
set fillchars=vert: 

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
"call matchadd('ColorColumn', '\%81v', 100)

" split where it's expected
set splitbelow
set splitright

" }}}2
" }}}1
" # PLUGINS {{{1
" # GoldenView/golden-ratio {{{2
let g:goldenview__enable_at_startup = 0
let g:goldenview__enable_default_mapping = 0

let g:golden_ratio_autocommand = 0
" }}}2
" # Litecorrect {{{2

let user_dict = {
  \ 'maybe': ['mabye'],
  \ 'medieval': ['medival', 'mediaeval', 'medevil'],
  \ 'then': ['hten'],
  \ }
augroup litecorrect
  autocmd!
  autocmd FileType markdown call litecorrect#init(user_dict)
augroup END

" }}}2
" # Lexical {{{2
augroup lexical
  autocmd!
  autocmd FileType markdown call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END
let g:lexical#spelllang = ['en_us',]

let g:lexical#spell_key = '<leader>u'
let g:lexical#thesaurus_key = '<leader>j'
let g:lexical#dictionary_key = '<leader>k'
"nmap <leader>u <Plug>LexicalSpell
"nmap <leader>j <Plug>LexicalThesaurus
"nmap <leader>k <Plug>LexicalDictionary
" }}}2
" # Quotable {{{2
let g:quotable#educateLevel = 1
augroup quotable
  autocmd!
  autocmd FileType markdown call quotable#init()
  autocmd FileType textile call quotable#init()
  autocmd FileType python call quotable#init({ 'educate': 0 })
augroup END

"nmap <silent> <leader>rs :call quotable#init()<cr>
"nmap <silent> <leader>rd :call quotable#init({'double':'„“','single':'‚‘'})<cr>
"nmap <silent> <leader>rx :call quotable#init({'double':'„”','single':'‚’'})<cr>
"nmap <silent> <leader>rf :call quotable#init({'double':'«»','single':'‹›'})<cr>

"nmap <silent> <leader>r1 :QuotableEducateOn<cr>
"nmap <silent> <leader>r0 :QuotableEducateOff<cr>
"nmap <silent> <leader>rq :QuotableEducateToggle<cr>

" remove these if using tpope/vim-surround
map <silent> Sq <Plug>QuotableSurroundDouble
map <silent> SQ <Plug>QuotableSurroundSingle

" }}}2
" # pencil (word processing) {{{2
let g:pencil#softDetectSample = 15
let g:pencil#wrapModeDefault = 'hard'
augroup pencil
  autocmd!
  autocmd FileType markdown call pencil#init()
  autocmd FileType textile call pencil#init()
augroup END

nmap <silent> <leader>W :PencilToggle<cr>
nmap <silent> <leader>A :PencilFormatToggle<cr>

" }}}2
" # Thematic (colors, fonts, etc.) {{{2
nmap <silent> <D-9> <Plug>ThematicNarrow
nmap <silent> <D-0> <Plug>ThematicWiden

nmap <Leader>y <Plug>ThematicNext
nmap <Leader>Y <Plug>ThematicRandom
nmap <Leader>I :Thematic pencil<CR>

set background=dark
colorscheme bubblegum

if has('gui_running')
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
  \ 'pencil'     : { 'background': 'light',
  \                  'columns': 75,
  \                  'font-size': 20,
  \                  'fullscreen': 1,
  \                  'laststatus': 0,
  \                  'linespace': 8,
  \                  'typeface': 'Cousine',
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
  \ 'reede_dark' : { 'airline-theme': 'badwolf',
  \                  'sign-column': 1,
  \                  'typeface': 'Source Code Pro ExtraLight',
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
  \ 'distinguished':{'typeface': 'Pointfree',
  \                },
  \ 'ir_black'   : { },
  \ 'kolor'      : { },
  \ 'pyte'       : { 'background': 'light' },
  \ 'ir_blue'    : { },
  \ 'ir_dark'    : { },
  \ 'github'     : { 'background': 'light' },
  \ }
else
  let g:jellybeans_use_lowcolor_black = 1
  let g:thematic#defaults = {
  \ 'airline-theme': 'jellybeans',
  \ 'background': 'dark',
  \ 'laststatus': 0,
  \ 'ruler': 0,
  \ 'sign-column': 0,
  \ }
  let g:thematic#themes = {
  \ 'desert'         : { 'laststatus': 1,
  \                      'ruler': 1,
  \                      'diff-color-fix': 1,
  \                      'sign-column-color-fix': 1,
  \                      'fold-column-color-mute': 1,
  \                      'number-column-color-mute': 1,
  \                    },
  \ 'bubblegum'      : { 'laststatus': 1,
  \                      'ruler': 1,
  \                      'diff-color-fix': 1,
  \                      'sign-column-color-fix': 1,
  \                      'fold-column-color-mute': 1,
  \                      'number-column-color-mute': 1,
  \                    },
  \ 'distinguished'  : { },
  \ 'jellybeans'     : { 'laststatus': 2 },
  \ 'summerfruit256' : { 'background': 'light' },
  \ }
endif

" }}}2
" # Ack (grep){{{2

" The Silver Searcher
if executable('ag')
  let g:ackprg = 'ag --smart-case --nogroup --nocolor --column'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Motions to Ack for things.  Works with pretty much everything, including:
"
"   w, W, e, E, b, B, t*, f*, i*, a*, and custom text objects
"
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

" }}}2
" # CtrlP (navigation){{{2
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
" }}}2
" # NERD Tree (directory browser){{{2
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

" }}}2
" # Signify (change indicators){{{2
" https://github.com/mhinz/vim-signify
" Try ]c and [c to jump between hunks
let g:signify_sign_change='~'
let g:signify_sign_delete='-'
let g:signify_sign_overwrite=0    " prevent dumping gutter
let g:signify_update_on_focusgained=1    " dumps gutter if overwrite=1
let g:signify_sign_color_inherit_from_linenr=1
" }}}2
" # Airline (status line) {{{2
"
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
" }}}2
" # Syntastic (syntax-checking) {{{2
" trim, save and syntax check
"nmap <silent> <leader>S :call TrimAndWrite()<cr>:SyntasticCheck<cr>:lrewind<cr>
"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_auto_loc_list=0
"let g:syntastic_check_on_open=0
"let g:syntastic_check_on_wq=0
"let g:syntastic_enable_signs=1
"let g:syntastic_mode_map={ 'mode': 'active',
"                          \ 'active_filetypes': [],
"                          \ 'passive_filetypes': ['python', 'markdown', 'textile'] }
"let g:syntastic_stl_format = '%E{ERROR %fe}%B{ }%W{WARN %fw}'

" to support 'after the deadline'
"let g:syntastic_filetype_map = { 'markdown': 'text',
"                               \ 'textile' : 'text' }
"let g:syntastic_text_atdtool_args="--my --args --here"

" }}}2
" # Fugitive {{{2
" https://github.com/tpope/vim-fugitive
"nnoremap <leader>gb :Gblame<CR>
"nnoremap <leader>gs :Gstatus<CR>
"nnoremap <leader>gl :Glog<CR>
"nnoremap <leader>gc :Gcommit<CR>
"nnoremap <leader>gp :Git push<CR>
"nnoremap <leader>gd zR:set columns=9999<CR>:Gdiff<CR>
"nnoremap <Leader>gD <c-w>h<c-w>c
" }}}2
" }}}1
"
" vim:set ft=vim et sw=2:
