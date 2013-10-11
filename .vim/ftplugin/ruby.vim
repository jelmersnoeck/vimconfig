" I'm using linux fifos for this. See the command "test-listener" for more
" information.
map <leader>t :call RunTestFile()<cr><cr>

" Easily add a ' => ' sign
imap <c-l> <space>=><space>

" This is the recommended setting for Ruby:
set shiftwidth=2
set tabstop=2
set expandtab
set softtabstop=2

function! RunTestFile()
    let in_test_file = match(expand("%"), '\(_spec.rb\|_test.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("g:rb_test_file")
        return
    end

    call RunTest()
endfunction

function! SetTestFile()
    let g:rb_test_file = @%
endfunction

function! RunTest()
    :w

    if filereadable("zeus.json")
        exec ":ZeusTest " . g:rb_test_file
    else
        if filereadable(".rspec")
            call VimuxRunCommand("clear && rspec " . g:rb_test_file)
        elseif filereadable("Rakefile")
            call VimuxRunCommand("clear && rake test TEST=" . g:rb_test_file)
        else
            call VimuxRunCommand("clear && ruby -Itest " . g:rb_test_file)
        end
    end
endfunction

" FILE: "/home/johannes/ruby.vim"
" Last Modification: "Mon, 06 May 2002 23:42:11 +0200 (johannes)"
" Additional settings for Ruby
" Johannes Tanzler, <jtanzler@yline.com>

" Matchit for Ruby: '%' {{{
"
"   This function isn't very sophisticated. It just takes care of indentation.
" (I've written it, because I couldn't extend 'matchit.vim' to handle Ruby
" files correctly (that's because everything in Ruby ends with 'end' -- no
" 'endif', 'endclass' etc.))
"
" If you're on the line `if x', then the cursor will jump to the next line
" with the same indentation as the if-clause. The same is true for a whole
" bunch of keywords -- see below for details.
"
" Since brave programmers use indentation, this will work for most of you, I
" hope. At least, it works for me. ;-)
" }}}
function! s:Ruby_Matchit()

    " use default matching for parenthesis, brackets and braces:
    if strpart(getline("."), col(".")-1, 1) =~ '(\|)\|{\|}\|\[\|\]'
	normal \\\\\
    endif

    normal ^
    sil! let curr_word = expand('<cword>')
    if curr_word == ""
	return
    endif

    let curr_line = line(".")
    let spaces = strlen(matchstr(getline("."), "^\\s*"))

    if curr_word =~ '\<end\>'
	while 1
	    normal k
	    if strlen(matchstr(getline("."), "^\\s*")) == spaces
			\&& getline(".") !~ "^\\s*$"
			\&& getline(".") !~ "^#"
		normal ^
		break
	    elseif line(".") == 1
		exe 'normal ' . curr_line . 'G'
		break
	    endif
	endwhile
    elseif curr_word =~ '\<\(if\|unless\|elsif\|else\|case\|when\|while\|'
		\.'until\|def\|\|module\|context\|should\|class\)\>'
	while 1
	    normal j
	    if strlen(matchstr(getline("."), "^\\s*")) == spaces
			\&& getline(".") !~ "^\\s*$"
			\&& getline(".") !~ "^#"
		normal ^
		break
	    elseif line(".") == line("$")
		exe 'normal ' . curr_line . 'G'
		break
	    endif
	endwhile
    endif

endfunction

nnoremap <buffer> \\\\\ %
nnoremap <buffer> % :call <SID>Ruby_Matchit()<CR>
