" ----- Defaults -----

set nocompatible		" use Vim defaults.

" ----- Pathogen -----

call pathogen#infect()	" Pathogen must be called before filetype detection.
filetype plugin indent on

" ----- Text formatting -----

set autoindent			" automatic indent new lines.
set smartindent			" make it smart.
set copyindent			" copy structure of existing lines.
set cindent				" enable automatic C program indenting.
set nowrap				" do not wrap lines.
set shiftwidth=4		" use four characters for tabs.
set softtabstop=4		" mindblowing.
set tabstop=4			" skullcracking.
set expandtab
set backspace=indent,eol,start

" ----- UI settings -----

set ruler				" always show cursor position.
set showmode			" show the mode we're currently in.
set showcmd				" always display commands.
set showmatch			" highlight matching brackets/showbraces.
set list				" enable listcharacters.
set laststatus=2		" show status line.
set cursorline			" visualize current line.
set nopaste				" don't use stupid paste settings
set colorcolumn=80

" ----- File navigation -----

set wildmenu			" display all possibilities on autocomplete.
set wildmode=longest,list,full

" ----- Command settings -----
set shell=bash
let mapleader = "~"

" ----- Movement -----

" Less finger wrecking window navigation.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" This will enable us to have a nice choice with ctags
nnoremap <C-]> g<C-]>

" Hop from method to method
nmap <c-n> ]]
nmap <c-n> [[

" Copy to our clipboard
map <leader>y "*y

" ----- Searching -----

set ignorecase			" no case sensitivity please.
set smartcase			" search case sensitive if i'm willing to.
set incsearch			" do incremental search.

" ----- Syntax and such -----

syntax on				" enable syntax highlighting.
color twilight256		" use zenburn colorscheme.
set synmaxcol=512		" try highlighting maximum 512 columns.

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

" F7 toggles highlighted search.
map <F7> :set hlsearch!<CR>

" ----- PHPSpec2 ----
map <leader>r :!./bin/phpspec run<cr>

" ----- Remapping -----

" ----- Chromed out, pimped out -----

" visualize stuff.
set listchars=tab:→\ ,extends:»,precedes:«,trail:▒,nbsp:·

" on editing, jump to last known cursor position.
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" on save, remove trailing spaces.
autocmd BufWritePre * :%s/\s\+$//e

" Do not pollute the working directory with swap and other files.
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" custom statusline
set statusline=%<%f\ %m%r\ %=line\ %l\ of\ %L\ %15.15(col\ %c%V%)\ %25.25(%{&ff},%{strlen(&fenc)?&fenc:'none'}\ %y%)\ "

" .tpl files are mainly (x)html files, xhtml gives better omni completion.
autocmd BufNewFile,BufRead *.tpl set filetype=xhtml
autocmd BufNewFile,BufRead *.twig set filetype=htmldjango
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" ----- Shortcuts -----
" Easily add a ' => ' sign
imap <c-l> <space>=><space>

" ----- Plugins -----

imap <buffer> <Leader>u <C-O>:call PhpInsertUse()<CR>
map <buffer> <Leader>u :call PhpInsertUse()<CR>

" Tell snipmate where to get our snippets
let g:snippets_dir = "~/.vim/snippets"

" Tell ctrlp some new settings
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|cache$\|vendor$\|web$',
    \ 'file': '\.exe$\|\.so$\|\.swp\|\.DS_STORE$',
    \ }
