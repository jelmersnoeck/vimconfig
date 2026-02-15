" Make <C-s> and <C-q> overwrites possible
silent !stty -ixon > /dev/null 2>/dev/null

" ----- Pathogen -----
call pathogen#infect()	" Pathogen must be called before filetype detection.
filetype plugin indent on

" ----- Text formatting -----
set autoindent			" automatic indent new lines.
set nowrap				" do not wrap lines.
set shiftwidth=4		" use four characters for tabs.
set softtabstop=4		" mindblowing.
set tabstop=4			" skullcracking.
set expandtab
set backspace=indent,eol,start
set nofoldenable
set relativenumber      " Relative line numbering
set number              " Overwrites the current line number to the actual number
set autoread            " Reload files changed outside buffer automatically
set scrolloff=5         " Always show x number of lines under/above cursor
set clipboard=unnamed
set hidden              " Allow switching buffers without saving

" ----- UI settings -----
set ruler				" always show cursor position.
set showcmd				" always display commands.
set showmatch			" highlight matching brackets/showbraces.
set laststatus=2		" show status line.
set cursorline			" visualize current line.
set colorcolumn=80
set history=1000
set tabpagemax=999

" Dynamically adjust window size of the active window to a minimum width
" let &winwidth = &columns * 7 / 12

" ----- File navigation -----
set wildmenu			" display all possibilities on autocomplete.
set wildmode=longest,list

" ----- Command settings -----
set shell=/bin/bash
set grepprg=ag

" ----- Movement -----
" Learn Vim.

" Less finger wrecking window navigation.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Searching redo
nnoremap <CR> :noh<CR><CR>

" This will enable us to have a nice choice with ctags
nnoremap <C-]> g<C-]>

" Forcing :E to work
" http://stackoverflow.com/a/14367507
command! -nargs=* -bar -bang -count=0 -complete=dir E Explore <args>

" ----- Searching -----
set ignorecase			" no case sensitivity please.
set smartcase			" search case sensitive if i'm willing to.
set incsearch			" do incremental search.
set hlsearch

" Always show tab line at the top
set showtabline=2

" ----- Syntax and such -----
syntax on				" enable syntax highlighting.
set background=dark
color PaperColor
let g:airline_theme='papercolor'

" Use terminal background color
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi TabLine guibg=NONE ctermbg=NONE
hi TabLineFill guibg=NONE ctermbg=NONE
hi StatusLine guibg=NONE ctermbg=NONE
hi StatusLineNC guibg=NONE ctermbg=NONE
hi VertSplit guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

" ----- Formatting -----
set fileformat=unix		" always use unix fileformat.
set encoding=utf-8		" force UTF-8 encoding.

" ----- Persistent undo -----
set undofile
set undodir=~/.vim-undo

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
nnoremap <leader>n :call RenameFile()<cr>

" ----- Custom mapping -----
nnoremap <leader>vc :sp ~/.vimrc<cr>
nnoremap <leader>vrc :so $MYVIMRC<cr>
nnoremap <leader>p :set paste<cr>o<C-v>:set nopaste<cr>
nnoremap <c-s> :w<cr>
inoremap <c-s> <Esc>:w<cr>
nnoremap <c-q> :q<cr><C-l>
nnoremap <c-e> :NERDTreeToggle<cr>

" Visualize whitespace
set listchars=tab:→\ ,extends:»,precedes:«,trail:▒,nbsp:·
set list

" Do not pollute the working directory with swap and other files.
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Tell snipmate where to get our snippets
let g:snippets_dir = "~/.vim/snippets"
let g:snipMate = { 'snippet_version' : 1 }

" Use terraform config
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" Tell ctrlp some new settings
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.cache$\|\.git$\|\.hg$\|\.svn$\|vendor$\|web$\|code-coverage$\|coverage$\|public$\|code-documentation$\|Godeps\/_workspace$\|cookbooks$\|tmp$\|Resources\/doc\|venv$',
    \ 'file': '\.exe$\|\.so$\|\.swp\|\.DS_STORE\|.php\~\|.pyc$',
    \ }

let g:ctrlp_map = '<c-i>'
let g:ctrlp_working_path_mode = 'cra'
let g:ctrlp_show_hidden = 1
nnoremap <leader>cp :CtrlPClearCache<cr>

" ----- Autocmds -----
augroup vimrc
    autocmd!
    autocmd FocusGained,BufEnter * checktime
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
    autocmd BufWritePre * :%s/\s\+$//e
    autocmd BufNewFile,BufRead *.tpl set filetype=xhtml
    autocmd BufNewFile,BufRead *.twig set filetype=htmldjango
    autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END
