let g:go_fmt_command = "goimports"

map <leader>t :call RunTestFile()<cr><cr>

function! RunTest(command)
    call VimuxRunCommand("clear && " . a:command)
endfunction

function! RunTestFile()
    call LoadTestFile()
    call RunTest("go test " . g:rb_test_file)
endfunction

function! LoadTestFile()
    let in_test_file = match(expand("%"), '\(_test.go\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("g:rb_test_file")
        return
    end
    :w
endfunction

function! SetTestFile()
    let g:rb_test_file = @%
endfunction
