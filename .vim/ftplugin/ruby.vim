" ----- RSpec ----
" I'm using linux fifos for this. See the command "test-listener" for more
" information.
map <leader>t :!clear && rake test:units TEST=%<cr>

" Easily add a ' => ' sign
imap <c-l> <space>=><space>

" This is the recommended setting for Ruby:
set shiftwidth=2
set tabstop=2
set expandtab
set softtabstop=2
