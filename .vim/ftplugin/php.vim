" set noexpandtab

" This is the recommended setting for Python:
" Spaces instead of tabs and 4 spaces for 1 TAB
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4

" ----- PHPUnit ----
" I'm using linux fifos for this. See the command "test-listener" for more
" information.
map <leader>r :!./bin/phpunit -c app %<cr>

" ----- Namespaces -----
" Insert namespaces easily, based upon ctags.
imap <leader>u <C-O>:call PhpInsertUse()<CR>
map <leader>u :call PhpInsertUse()<CR>

" Easily add a ' => ' sign
imap <c-l> <space>=><space>
