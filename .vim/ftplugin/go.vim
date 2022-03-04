let g:go_fmt_command = "goimports"
let g:go_doc_popup_window = 1
let g:completor_filetype_map = {}
let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls -remote=auto'}"

map <Leader>t :wa<CR> :GolangTestCurrentPackage<CR>
map <Leader>T :wa<CR> :GolangTestFocused<CR>
" map <leader>t <Plug>(go-test)
" map <leader>T <Plug>(go-test-func)
map <leader>a :GoAlternate<cr>
map <leader>ds <Plug>(go-def-vertical)
map <Leader>dt <Plug>(go-def-tab)
map <Leader>s <Plug>(go-implements)
map <Leader>i <Plug>(go-info)
map <Leader>gb <Plug>(go-doc-browser)
