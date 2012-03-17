" Pathogen
call pathogen#infect()
filetype plugin indent on

" Searching
set ignorecase
set smartcase
set incsearch
map <F7> :set hlsearch!<CR>

" Interface
set ruler
set laststatus=2
set showmode
set showmatch
set showcmd
set nowrap
set list
set listchars=tab:→\ ,extends:»,precedes:«,trail:▒,nbsp:·
set mouse=a

" Enable bash commands in vim.
set shellcmdflag=-ic

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
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" Delete trailing whitespaces on saving a file
autocmd BufWritePre * :%s/\s\+$//e

" .tpl files are mainly (x)html files, xhtml gives better omni completion.
autocmd BufNewFile,BufRead *.tpl set filetype=xhtml

" We like 80 characters. To maintain this we use a highlight if we have more than 80
set cc=100
hi ColorColumn ctermbg=lightgrey guibg=lightgrey

" Less finger wrecking window navigation.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Syntax highlighting
color twilight256
syntax on
syntax sync fromstart
set synmaxcol=16384

" Indentation settings
set autoindent
set smartindent
set noexpandtab

" Whitespace settings
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Code folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=5

" Do not pollute the working directory with swap and other files
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Auto-completion
set wildmode=longest,list,full

" Show a menu at the bottom of the vim window.
set wildmenu

" Show line numbers and make them 5 characters wide
map <F6> :set number!<CR>
set numberwidth=5
