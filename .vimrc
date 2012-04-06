" Pathogen
call pathogen#infect()
filetype plugin indent on

set nocompatible

" Searching
set ignorecase
set smartcase
set incsearch
map <F7> :set hlsearch!<CR>

let mapleader = "~"

" Interface
set ruler
set laststatus=2
set showmode
set showmatch
set showcmd
set nowrap
set list
set listchars=tab:→\ ,extends:»,precedes:«,trail:▒,nbsp:·
set cursorline
set shell=bash

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Tell snipmate where to get our snippets
let g:snippets_dir = "~/.vim/snippets"

" Splitview options
set splitright
set splitbelow

set tabpagemax=1024

" History
set history=1024
set undolevels=1024

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" Delete trailing whitespaces on saving a file
autocmd BufWritePre * :%s/\s\+$//e

" .tpl files are mainly (x)html files, xhtml gives better omni completion.
autocmd BufNewFile,BufRead *.tpl set filetype=xhtml
autocmd BufNewFile,BufRead *.twig set filetype=xhtml

" These types are fussy about tabs and spaces.
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab

" easily add a => sign
imap <c-l> <space>=><space>

" Specify a font
set gfn=Menlo:h13

" We like 80 characters. To maintain this we use a highlight if we have more than 80
set cc=100

" Less finger wrecking window navigation.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" This will enable us to have a nice choice with ctags
nnoremap <C-]> g<C-]>

" CtrlP Mapping to CtrlT
let g:ctrlp_map = '<c-t>'

" CtrlP directories to ignore
let g:ctrlp_custom_ignore = '\.git$\|\.svn$'

map <leader>y "*y

" Hop from method to method
nmap <c-n> ]]
nmap <c-n> [[

" Syntax highlighting
color twilight256
syntax on
syntax sync fromstart
set synmaxcol=16384

" Indentation settings
set autoindent
set smartindent
set noexpandtab
set softtabstop=4
set tabstop=4
" set expandtab
" set tabstop=4
" set shiftwidth=4

" Code folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=5

" No arrow keys allowed!
map <Left> :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up> :echo "no!"<cr>
map <Down> :echo "no!"<cr>

" Learn to use <c-c>!
inoremap <Esc> <NOP>

" Do not pollute the working directory with swap and other files
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Show a menu at the bottom of the vim window.
set wildmenu
set wildmode=longest,list,full

" Show line numbers and make them 5 characters wide
map <F6> :set number!<CR>
set numberwidth=5
