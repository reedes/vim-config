
" To support Write (for Android) which doesn't recognize
" .md file extension.
au BufRead,BufNewFile *.{md},*.{md}.{txt}   set filetype=markdown
