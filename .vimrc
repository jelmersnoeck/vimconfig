" Make <C-s> and <C-q> overwrites possible
silent !stty -ixon > /dev/null 2>/dev/null

" ----- Defaults -----
set nocompatible		" use Vim defaults.

" ----- Pathogen -----
call pathogen#infect()	" Pathogen must be called before filetype detection.
filetype plugin indent on

" ----- Text formatting -----
set autoindent			" automatic indent new lines.
set smartindent			" make it smart.
set nowrap				" do not wrap lines.
set shiftwidth=4		" use four characters for tabs.
set softtabstop=4		" mindblowing.
set tabstop=4			" skullcracking.
set expandtab
set backspace=indent,eol,start
set nofoldenable
set relativenumber      " Relative line numbering
set autoread            " Reload files changed outside buffer automatically
set scrolloff=5         " Always show x number of lines under/above cursor

" ----- UI settings -----
set ruler				" always show cursor position.
set showcmd				" always display commands.
set showmatch			" highlight matching brackets/showbraces.
set laststatus=2		" show status line.
set cursorline			" visualize current line.
set nopaste				" don't use stupid paste settings
set colorcolumn=80
set history=1000
set tabpagemax=999
" Dynamically adjust window size of the active window to a minimum width
let &winwidth = &columns * 6 / 10

" ----- File navigation -----
set wildmenu			" display all possibilities on autocomplete.
set wildmode=longest,list

" ----- Command settings -----
set shell=bash
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

" Copy to our clipboard
map <leader>y "+y<cr>

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
color twilight256		" use zenburn colorscheme.

" ----- Formatting -----
set fileformat=unix		" always use unix fileformat.
set encoding=utf-8		" force UTF-8 encoding.

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
map <leader>n :call RenameFile()<cr>

" ----- Custom mapping -----
map <leader>su :sp ~/Dropbox/work/speed-up<cr>
map <leader>pn :sp ~/Dropbox/work/programming-notes<cr>
map <leader>vc :sp ~/.vimrc<cr>
map <leader>sp :set paste<cr>
map <leader>np :set nopaste<cr>
map <leader>vrc :so $MYVIMRC<cr>
map <leader>p :set paste<cr>o<C-v>:set nopaste<cr>
map <c-s> :w<cr>
imap <c-s> <Esc>:w<cr>
map <c-q> :q<cr><C-l>

" visualize stuff.
set listchars=tab:→\ ,extends:»,precedes:«,trail:▒,nbsp:·

" on editing, jump to last known cursor position.
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" on save, remove trailing spaces.
autocmd BufWritePre * :%s/\s\+$//e

" Do not pollute the working directory with swap and other files.
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" .tpl files are mainly (x)html files, xhtml gives better omni completion.
autocmd BufNewFile,BufRead *.tpl set filetype=xhtml
autocmd BufNewFile,BufRead *.twig set filetype=htmldjango

" Tell snipmate where to get our snippets
let g:snippets_dir = "~/.vim/snippets"

" Tell ctrlp some new settings
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|vendor$\|web$\|code-coverage$\|coverage$\|public$\|code-documentation$\|Godeps\/_workspace$\|cookbooks$\|tmp$\|Resources\/doc\|venv$',
    \ 'file': '\.exe$\|\.so$\|\.swp\|\.DS_STORE\|.php\~\|.pyc$',
    \ }

let g:ctrlp_map = '<c-i>'
let g:ctrlp_working_path_mode = 'cra'
let g:ctrlp_show_hidden = 1

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.exe$\|\.so$\|\.swp\|\.DS_STORE\|.php\~\|\.pyc$\|\.git']
