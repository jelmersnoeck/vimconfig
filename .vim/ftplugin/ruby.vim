" ----- RSpec ----
" I'm using linux fifos for this. See the command "test-listener" for more
" information.
map <leader>t :!clear && ruby -Itest %<cr>
map <leader>tt :!echo "clear && ruby -Itest %" >> test-commands<cr><cr>

" Easily add a ' => ' sign
imap <c-l> <space>=><space>

" This is the recommended setting for Ruby:
set shiftwidth=2
set tabstop=2
set expandtab
set softtabstop=2
