let g:go_fmt_command = "goimports"

map <leader>t :call RunTestFile()<cr><cr>
map <leader>ds <Plug>(go-def-vertical)

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
    let l:currentFilePath = expand("%:p")
    let l:currentFilePaths = split(l:currentFilePath, "\/")
    let l:directory = "/" . join(l:currentFilePaths[:-2], "/") . "/"
    let l:files = split(globpath(l:directory, '*.go'), '\n')
    let l:testingFiles = []
    call add(l:testingFiles, expand("%:p"))

    for file in l:files
        if match(file, '\(_test.go\)$') == -1
            call add(l:testingFiles, file)
        end
    endfor

    let g:rb_test_file = join(l:testingFiles)
endfunction
