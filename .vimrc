" All the cool kids are doing it.
syntax on

" Use specific indentation for a bunch of filename extensions.
au!BufNewFile,BufRead   *.html    set ts=2 sw=2 et
au!BufNewFile,BufRead   *.css    set ts=2 sw=2 et
au!BufNewFile,BufRead   *.py    set ts=4 sw=4 et

" Highlight whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
