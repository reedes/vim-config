" ~/.vim/after/ftplugin/python.vim
" Execute commands after the vim config filetype handler has been run

" Make sure automatic continuation of comments is disabled
" Aggregating these doesn't seem to work consistently

" because python plugin (or something else) annoyingly sets it to 0
setlocal foldlevel=100

setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
setlocal expandtab tabstop=4 shiftwidth=4 autoindent
setlocal nocindent

autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

