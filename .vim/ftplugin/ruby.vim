" I'm using linux fifos for this. See the command "test-listener" for more
" information.
map <leader>t :call RunTestFile()<cr>
map <leader>cr :VimuxCloseRunner<cr>

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
        if filereadable("Rakefile")
            call VimuxRunCommand("clear && rake test TEST=" . g:rb_test_file)
        else
            call VimuxRunCommand("clear && ruby -Itest " . g:rb_test_file)
        end
    end
endfunction
