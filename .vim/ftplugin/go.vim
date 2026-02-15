let g:go_fmt_command = "goimports"
let g:go_doc_popup_window = 1
let g:completor_filetype_map = {}
let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls -remote=auto'}

nnoremap <Leader>t :wa<CR> :GolangTestCurrentPackage<CR>
nnoremap <Leader>T :wa<CR> :GolangTestFocused<CR>
nnoremap <leader>a :GoAlternate<cr>
nmap <leader>ds <Plug>(go-def-vertical)
nmap <Leader>dt <Plug>(go-def-tab)
nmap <Leader>s <Plug>(go-implements)
nmap <Leader>i <Plug>(go-info)
nmap <Leader>gb <Plug>(go-doc-browser)
